#!/usr/bin/env python3
"""由「附錄二_法定傳染病增補欄位與檢核邏輯」(docx) 產生各疾病增補欄位之 FHIR Questionnaire (FSH)。

用法：
    python3 scripts/gen_questionnaires.py [附錄二docx] [輸出目錄] [頁面輸出檔]

每一疾病產生一份 Questionnaire：
  * 答題編號(KEY)  -> item.linkId
  * 問題內容/選項內容 -> item.text（依表格之問題階層建立 group）
  * 答案值格式      -> item.type（1=勾選→boolean、String/N→string+maxLength、日期→date、Number→integer/decimal）
  * 備註            -> designNote 擴充
  * 檢核邏輯        -> Questionnaire.purpose
"""
import re
import sys
import unicodedata
from pathlib import Path

import docx
from docx.oxml.ns import qn

SRC = Path(sys.argv[1] if len(sys.argv) > 1 else "source/nidrs-emr2.0-v1.42/附錄二_法定傳染病增補欄位與檢核邏輯_v1.42.docx")
OUT = Path(sys.argv[2] if len(sys.argv) > 2 else "input/fsh/generated/questionnaires")
PAGE = Path(sys.argv[3] if len(sys.argv) > 3 else "input/pagecontent/supplement-fields.md")
DISEASE_FSH = Path("input/fsh/generated/CodeSystem-cdc-disease.fsh")
BASE = "https://ancientsky.github.io/fhir_ig_demo"
DATE = "2026-09-29"

KEY_RE = re.compile(r"^[A-Za-z0-9_]+$")
ALIASES = {"M痘": "MPXV", "HIV感染(含母子垂直感染疑似個案)": "044"}


def norm(t):
    return re.sub(r"\s+", " ", t.replace("　", " ")).strip()


def fold(t):
    return unicodedata.normalize("NFKC", t).replace(" ", "")


def fsh_str(t):
    return norm(t).replace("\\", "\\\\").replace('"', '\\"')


def load_disease_codes():
    codes = {}
    for m in re.finditer(r'^\* #"?([^" ]+)"? "([^"]+)"', DISEASE_FSH.read_text(encoding="utf-8"), re.M):
        codes.setdefault(fold(m.group(2)), m.group(1))
    return codes


def extract():
    d = docx.Document(str(SRC))
    out, cur, h1, h2 = [], None, None, None
    for el in d.element.body.iterchildren():
        if el.tag == qn("w:p"):
            p = docx.text.paragraph.Paragraph(el, d)
            t = norm(p.text)
            if not t:
                continue
            style = p.style.name
            if style == "Heading 1":
                h1 = t
            elif style == "Heading 2":
                h2 = t
                cur = {"class": h1, "name": t, "sub": None, "rows": [], "rules": []}
                out.append(cur)
            elif style == "Heading 3" and h2 and h2.startswith("HIV"):
                cur = {"class": h1, "name": h2, "sub": t, "rows": [], "rules": []}
                out.append(cur)
        elif el.tag == qn("w:tbl") and cur is not None:
            t = docx.table.Table(el, d)
            hdr = [norm(c.text) for c in t.rows[0].cells]
            if "答題編號" in hdr:
                ki = hdr.index("答題編號")
                for r in t.rows[1:]:
                    cells = [norm(c.text) for c in r.cells]
                    if len(cells) <= ki:
                        continue
                    ctx = []
                    for c in cells[:ki]:
                        if c and (not ctx or ctx[-1] != c):
                            ctx.append(c)
                    cur["rows"].append({
                        "key": cells[ki],
                        "path": ctx,
                        "value": cells[ki + 1] if ki + 1 < len(cells) else "",
                        "note": cells[ki + 2] if ki + 2 < len(cells) else "",
                    })
            else:
                txt = "\n".join(norm(c.text) for r in t.rows for c in r.cells[:1])
                if txt and txt != "無":
                    cur["rules"].append(txt)
    return [x for x in out if x["rows"] or x["rules"]]


def item_type(value, note):
    v = value.lower().replace(" ", "")
    if v.startswith("1=勾選"):
        return "boolean", None
    if v.startswith("number"):
        return ("decimal" if "小數" in note else "integer"), None
    if v == "text":
        return "text", None
    m = re.match(r"string/?(\d+)", v)
    if m:
        n = int(m.group(1))
        if n == 10 and ("ex.20" in note.lower() or "yyyy" in note.lower() or "日" in note):
            return "date", None
        return "string", n
    if v.startswith("代碼"):
        return "string", None
    return None, None


class Builder:
    def __init__(self):
        self.lines = []
        self.n = 0

    def emit(self, path, rule):
        self.lines.append(f"* {path}{rule}")

    def build(self, rows):
        sections = []  # [text, [(group_text or None, [leaf])]]
        seen = set()
        skipped = []
        for r in rows:
            key, path, value, note = r["key"], r["path"], r["value"], r["note"]
            if not key or not KEY_RE.match(key) or (key == value and not key.startswith("S_")):
                text = key or value or (path[0] if path else "")
                if not text:
                    continue
                if key == value == note and len(text) <= 20 and not text.startswith("("):
                    # 區段標題列(例如「臨床症狀」)
                    sections.append([text, []])
                else:
                    # 說明文字列(整列合併之說明，或「填寫於共同欄位」)
                    if not sections:
                        sections.append(["增補欄位", []])
                    label = " / ".join(path + ([text] if text not in path else [])) if key not in path else text
                    disp = (None, label, "display", None, "", "")
                    if sections[-1][1]:
                        sections[-1][1][-1][1].append(disp)
                    else:
                        sections[-1][1].append((None, [disp]))
                continue
            if key in seen:
                skipped.append(key)
                continue
            seen.add(key)
            typ, maxlen = item_type(value, note)
            remark = note
            if typ is None:
                typ = "string"
                remark = "；".join(x for x in (value, note) if x)
            if not sections:
                sections.append(["增補欄位", []])
            groups = sections[-1][1]
            if len(path) >= 2:
                gtext = path[0]
                text = " / ".join(path[1:])
            else:
                gtext = None
                text = path[0] if path else key
            if groups and groups[-1][0] == gtext and gtext is not None:
                groups[-1][1].append((key, text, typ, maxlen, remark, value))
            else:
                groups.append((gtext, [(key, text, typ, maxlen, remark, value)]))
        return [s for s in sections if s[1]], skipped

    def leaf(self, p, leaf):
        key, text, typ, maxlen, remark, value = leaf
        if typ == "display":
            self.n += 1
            self.emit(p, f'.linkId = "display-{self.n}"')
            self.emit(p, f'.text = "{fsh_str(text)}"')
            self.emit(p, ".type = #display")
            return
        self.emit(p, f'.linkId = "{key}"')
        self.emit(p, f'.text = "{fsh_str(text)}"')
        self.emit(p, f".type = #{typ}")
        if maxlen:
            self.emit(p, f".maxLength = {maxlen}")
        note = "；".join(x for x in (f"答案值：{value}" if value else "", f"備註：{remark}" if remark else "") if x)
        if note:
            self.emit(p, '.extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"')
            self.emit(p, f'.extension[0].valueMarkdown = "{fsh_str(note)}"')

    def render(self, sections):
        for si, (stitle, groups) in enumerate(sections):
            sp = f"item[{si}]"
            self.emit(sp, f'.linkId = "section-{si + 1}"')
            self.emit(sp, f'.text = "{fsh_str(stitle)}"')
            self.emit(sp, ".type = #group")
            ci = 0
            for gi, (gtext, leaves) in enumerate(groups):
                if gtext is None:
                    for lf in leaves:
                        self.leaf(f"{sp}.item[{ci}]", lf)
                        ci += 1
                else:
                    gp = f"{sp}.item[{ci}]"
                    self.emit(gp, f'.linkId = "section-{si + 1}.group-{gi + 1}"')
                    self.emit(gp, f'.text = "{fsh_str(gtext)}"')
                    self.emit(gp, ".type = #group")
                    for li, lf in enumerate(leaves):
                        self.leaf(f"{gp}.item[{li}]", lf)
                    ci += 1


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    codes = load_disease_codes()
    diseases = extract()
    index = []
    for x in diseases:
        code = ALIASES.get(x["name"]) or codes.get(fold(x["name"]))
        if not code:
            print("!! 找不到疾病代碼:", x["name"])
            continue
        qid = f"nidrs-supplement-{code}"
        title = f"法定傳染病增補欄位-{x['name']}"
        if x["sub"]:
            qid += "-lt18m" if "以下" in x["sub"] else "-ge18m"
            title += f"({x['sub']})"
        qid = qid.replace("_", "-")
        name = "NIDRSSupplement" + re.sub(r"[^A-Za-z0-9]", "", qid.split("supplement-")[1].title())
        b = Builder()
        sections, skipped = b.build(x["rows"])
        b.render(sections)
        nkeys = sum(1 for _, gs in sections for _, lf in gs for leaf in lf if leaf[2] != "display")
        purpose = "**檢核邏輯**\n\n" + ("\n\n".join(x["rules"]) if x["rules"] else "無")
        head = [
            f"Instance: {qid}",
            "InstanceOf: Questionnaire",
            "Usage: #definition",
            f'Title: "{fsh_str(title)}"',
            f'Description: "{fsh_str(title)}({code})之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"',
            f'* url = "{BASE}/Questionnaire/{qid}"',
            '* version = "0.1.0"',
            f'* name = "{name}"',
            f'* title = "{fsh_str(title)}"',
            "* status = #active",
            "* experimental = false",
            f'* date = "{DATE}"',
            '* publisher = "fhir_ig_demo（非官方示範）"',
            f'* description = "{fsh_str(x["class"] or "")}「{fsh_str(title)}」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"',
            f'* purpose = "{fsh_str(purpose)}"',
            "* subjectType = #Patient",
            '* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus',
            f'* useContext[0].valueCodeableConcept = {BASE}/CodeSystem/cdc-disease#{code if re.match(r"^[A-Za-z0-9._]+$", code) else chr(34) + code + chr(34)} "{fsh_str(x["name"])}"',
        ]
        (OUT / f"Questionnaire-{qid}.fsh").write_text("\n".join(head + b.lines) + "\n", encoding="utf-8")
        index.append((x["class"], x["name"] + (f"({x['sub']})" if x["sub"] else ""), code, qid, nkeys, len(x["rules"]) > 0))
        print(f"{qid}: {nkeys} 題" + (f"，略過重複答題編號 {skipped}" if skipped else ""))

    lines = [
        "本頁列出「附錄二_法定傳染病增補欄位與檢核邏輯」(v1.42) 所轉換之 Questionnaire。各疾病之增補欄位(DISEASE_FIELD)以 "
        "[增補欄位填答-QuestionnaireResponse NIDRS](StructureDefinition-QuestionnaireResponse-nidrs.html) 傳送，"
        "`QuestionnaireResponse.questionnaire` 指向下表之 Questionnaire，`item.linkId` 即原規格之答題編號(KEY)，`answer.value[x]` 即答案值(VALUE)。",
        "",
        "### 答案值轉換規則",
        "",
        "| 原規格資料型別 | 原規格填寫方式 | Questionnaire item.type | QuestionnaireResponse answer |",
        "|---|---|---|---|",
        "| 布林型別 | `1`=勾選；不勾選則不傳送該答題編號 | boolean | `valueBoolean = true`（不勾選者不傳送該 item） |",
        "| 文字型態 String/N | 字串，長度 N | string（maxLength = N） | `valueString` |",
        "| 日期型別 | `yyyy/MM/dd`，長度 10 | date | `valueDate`（`yyyy-MM-dd`） |",
        "| 數字型態 Number | 整數；備註說明可填小數者為小數 | integer / decimal | `valueInteger` / `valueDecimal` |",
        "| 代碼型別 | 依附錄四代碼表之代碼字串 | string | `valueString`（代碼值） |",
        "",
        "### 各疾病增補欄位",
        "",
        "| 分類 | 疾病 | 疾病代碼 | Questionnaire | 答題數 | 檢核邏輯 |",
        "|---|---|---|---|---|---|",
    ]
    for cls, name, code, qid, n, has_rule in index:
        lines.append(f"| {cls} | {name} | `{code}` | [{qid}](Questionnaire-{qid}.html) | {n} | {'有' if has_rule else '無'} |")
    PAGE.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
