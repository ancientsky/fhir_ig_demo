# -*- coding: utf-8 -*-
"""產生 input/fsh/models/*.fsh 與 input/pagecontent/mapping.md 之欄位對應表。
用法：python3 -I gen.py <repo root>"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from data import MODELS  # noqa: E402

ROOT = sys.argv[1]
MODEL_DIR = os.path.join(ROOT, "input/fsh/models")
PAGE_DIR = os.path.join(ROOT, "input/pagecontent")

MODEL_NAME = {m["id"]: m for m in MODELS}
SRC_TO_MODEL = {"Report_Common": "ReportCommonModel", "Report_ContactInfo": "ReportContactInfoModel",
                "Report_Travel": "ReportTravelModel", "Report_Animal": "ReportAnimalModel"}


def fsh_str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def ftype_of(f):
    if f.ftype:
        return f.ftype, None
    st = f.stype
    m = re.match(r"^String/(\d+)$", st)
    if m:
        return "string", int(m.group(1))
    return {
        "String": "string", "string": "string",
        "Code": "code",
        "Int": "integer", "int": "integer",
        "Bool": "boolean", "bool": "boolean",
        "Datetime": "string",
        "DateTime": "dateTime",
        "": "BackboneElement",
    }[st], None


def type_label(st):
    return {"": "(區塊)"}.get(st, st)


def defn_of(f):
    d = f.defn
    if not d.endswith("。"):
        d += "。"
    if f.stype:
        d += "原規格資料型態：%s。" % f.stype
    if f.stype == "Datetime":
        d += "因原格式(yyyyMMdd HH:mi:ss)非 FHIR dateTime 格式，本模型以 string 表達。"
    elif re.match(r"^String/(8|10)$", f.stype) and ("日" in f.short or "時間" in f.short or "BIRTHDAY" == f.name):
        d += "日期以原格式字串表達。"
    return d


def map_str(maps):
    return "；".join(("%s: %s" % (p, path)) if p else path for p, path in maps)


def code_tok(v):
    v = str(v)
    if re.match(r"^[A-Za-z0-9_\-.]+$", v):
        return "#" + v
    return "#" + fsh_str(v)


def example_rule(path, f, t):
    if f.ex is None:
        return []
    out = ["* %s ^example.label = %s" % (path, fsh_str("範例"))]
    if t == "boolean":
        out.append("* %s ^example.valueBoolean = %s" % (path, "true" if f.ex else "false"))
    elif t == "integer":
        out.append("* %s ^example.valueInteger = %d" % (path, int(f.ex)))
    elif t == "code":
        out.append("* %s ^example.valueCode = %s" % (path, code_tok(f.ex)))
    elif t == "dateTime":
        out.append("* %s ^example.valueDateTime = %s" % (path, fsh_str(str(f.ex))))
    else:
        out.append("* %s ^example.valueString = %s" % (path, fsh_str(str(f.ex))))
    return out


def walk(fields, prefix=""):
    for f in fields:
        path = prefix + f.name
        yield path, f
        for x in walk(f.kids, path + "."):
            yield x


def gen_fsh(m):
    L = []
    L.append("// %s %s：%s" % (m["src"], m["msg"], m["title"]))
    L.append("// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。")
    L.append("Logical: %s" % m["id"])
    L.append("Id: %s" % m["id"])
    L.append("Title: %s" % fsh_str(m["title"]))
    L.append("Description: %s" % fsh_str(m["desc"]))
    L.append('* ^version = "0.1.0"')
    L.append('* ^status = #draft')
    for path, f in walk(m["fields"]):
        t, maxlen = ftype_of(f)
        L.append("* %s %s %s %s %s" % (path, f.card, t, fsh_str(f.short), fsh_str(defn_of(f))))
        if maxlen:
            L.append("* %s ^maxLength = %d" % (path, maxlen))
        if f.bind:
            L.append("* %s from %s (%s)" % (path, f.bind[0], f.bind[1]))
        L.extend(example_rule(path, f, t))
    L.append("")
    L.append("Mapping: %sToFHIR" % m["id"])
    L.append("Id: nidrs-to-fhir")
    L.append('Title: "NIDRS JSON → FHIR"')
    L.append("Description: %s" % fsh_str("%s JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。" % m["msg"]))
    L.append("Source: %s" % m["id"])
    L.append('Target: "http://hl7.org/fhir/R4"')
    L.append("* -> %s %s" % (fsh_str(map_str(m["root"])), fsh_str(m["rootnote"])))
    for path, f in walk(m["fields"]):
        if not f.maps:
            continue
        if f.note:
            L.append("* %s -> %s %s" % (path, fsh_str(map_str(f.maps)), fsh_str(f.note)))
        else:
            L.append("* %s -> %s" % (path, fsh_str(map_str(f.maps))))
    L.append("")
    return "\n".join(L)


# ---------------------------------------------------------------- markdown
def md_esc(s):
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("|", "&#124;")


def plink(p):
    return "[%s](StructureDefinition-%s.html)" % (p, p)


def md_path(path):
    return "`%s`" % path.replace("|", "/")


def md_row(cells):
    return "| " + " | ".join(cells) + " |"


def md_type(f):
    if f.ftype and f.ftype in MODEL_NAME:
        mm = MODEL_NAME[f.ftype]
        return "[%s](#%s)" % (f.stype, mm["anchor"])
    return md_esc(type_label(f.stype))


def md_table(m):
    out = []
    out.append(md_row(["原欄位", "基數", "型態", "說明", "FHIR Profile", "FHIR 元素", "轉換說明"]))
    out.append(md_row(["---"] * 7))
    out.append(md_row(["*(%s 本體)*" % md_esc(m["msg"]), "", "", md_esc(m["title"]),
                       "<br>".join(plink(p) for p, _ in m["root"]),
                       "<br>".join(md_path(x) for _, x in m["root"]),
                       md_esc(m["rootnote"])]))
    for path, f in walk(m["fields"]):
        if f.group:
            out.append(md_row(["**%s**" % md_esc(f.group), "", "", "", "", "", ""]))
        out.append(md_row([
            md_path(path), f.card, md_type(f), md_esc(f.defn),
            "<br>".join(plink(p) for p, _ in f.maps),
            "<br>".join(md_path(x) for _, x in f.maps),
            md_esc(f.note),
        ]))
    return "\n".join(out) + "\n{:.grid}"


def model_table_rows():
    rows = [md_row(["邏輯模型", "原規格表號", "訊息/結構", "說明"]), md_row(["---"] * 4)]
    for m in MODELS:
        rows.append(md_row(["[%s](StructureDefinition-%s.html)" % (m["id"], m["id"]), m["src"], m["msg"], md_esc(m["title"])]))
    return "\n".join(rows)


def main():
    os.makedirs(MODEL_DIR, exist_ok=True)
    for m in MODELS:
        with open(os.path.join(MODEL_DIR, m["id"] + ".fsh"), "w", encoding="utf-8") as fp:
            fp.write(gen_fsh(m))
    # mapping.md 由樣板組裝
    here = os.path.dirname(os.path.abspath(__file__))
    tpl = open(os.path.join(here, "mapping.tpl.md"), encoding="utf-8").read()

    def repl(mo):
        return md_table(MODEL_NAME[mo.group(1)])
    page = re.sub(r"\{\{TABLE:([A-Za-z0-9]+)\}\}", repl, tpl)
    with open(os.path.join(PAGE_DIR, "mapping.md"), "w", encoding="utf-8") as fp:
        fp.write(page)
    tpl2 = open(os.path.join(here, "models.tpl.md"), encoding="utf-8").read()
    with open(os.path.join(PAGE_DIR, "models.md"), "w", encoding="utf-8") as fp:
        fp.write(tpl2.replace("{{MODEL_LIST}}", model_table_rows()))
    # 檢查：無 TABLE 殘留
    assert "{{" not in page


if __name__ == "__main__":
    main()
