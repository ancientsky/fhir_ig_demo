#!/usr/bin/env python3
"""產生 NIDRS 代碼對應國際標準術語(SNOMED CT、LOINC)之概念對應(FSH)。

用法：
    python3 scripts/gen_standard_maps.py

對應表為人工整理，以下列原則建立：
  * 僅收錄語意明確之代碼，NIDRS 代碼較 SNOMED CT 概念狹義者(例如「流感併發重症」→「Influenza」)標示 wider；
  * 來源代碼須存在於本 IG 由附錄四產生之代碼系統(input/fsh/generated)，否則略過並列出；
  * SNOMED CT 顯示名稱不寫入對應表，由 IG Publisher 依術語伺服器呈現。
輸出：input/fsh/vocabulary/ConceptMaps-Standard.fsh
"""
import re
from pathlib import Path

BASE = "https://ancientsky.github.io/fhir_ig_demo"
GEN = Path("input/fsh/generated")
OUT = Path("input/fsh/vocabulary/ConceptMaps-Standard.fsh")
SCT = "http://snomed.info/sct"
LNC = "http://loinc.org"

# 通報疾病(cdc-disease) → SNOMED CT 疾患(disorder)
DISEASE = {
    "020": "58750007", "050": "67924001", "071": "14168008", "SARS": "398447004",
    "001": "63650001", "002": "4834000", "002a": "85904008", "004": "36188001",
    "022": "409498004", "032": "397428000", "055": "14189004", "056": "36653000",
    "061": "38362002", "084": "61462000", "A920": "111864006", "ZIKAV": "3928002",
    "030": "81004002", "033": "27836007", "037": "76902006", "042": "62479008",
    "044": "86406008", "010": "56717001", "010m": "423092005", "0620": "52947006",
    "0701": "40468003", "0703": "76795007", "0705": "235866006", "072": "36989005",
    "090": "76272004", "091": "35742006", "098": "15628003", "4828": "26726000",
    "7710": "1857005", "7713": "43424001", "0051": "398565003", "021": "19265001",
    "023": "75702008", "025": "86615009", "027": "4241002", "0461": "792004",
    "0830": "186788009", "100": "77377001", "1048": "23502006", "130": "187192000",
    "060": "16541001", "0788": "37109004", "0788b": "19065005", "19CVS": "840539006",
    "MPXV": "414015000", "045": "398102009",
}
DISEASE_WIDER = {"487a": "6142004", "052VC": "38907003", "19CoV": "840539006"}

# 症狀(cdc-symptom) → SNOMED CT 臨床發現(finding)
SYMPTOM = {
    "133": "386661006", "75": "49727002", "181": "25064002", "182": "25064002",
    "46": "68962001", "45": "68962001", "288": "68962001", "189": "57676002",
    "24": "271807003", "250": "271807003", "158": "62315008", "2": "62315008",
    "162": "422400008", "195": "422587007", "84": "43724002", "319": "43724002",
    "91": "84229001", "289": "84229001", "124": "162397003", "76": "162397003",
    "65": "267036007", "155": "21522001", "80": "64531003", "139": "9826008",
    "217": "9826008", "147": "18165001", "131": "91175000", "248": "91175000",
    "69": "233604007", "256": "30746006", "115": "30746006", "16": "339008",
    "219": "45170000", "309": "7180009", "177": "161882006", "89": "79890006",
    "33": "27942005", "68": "371632003", "148": "271782001", "55": "80515008",
    "143": "16294009", "194": "89362005", "253": "42984000", "167": "249366005",
    "341": "29857009", "204": "404640003", "222": "68235000", "111": "91302008",
    "231": "50920009", "142": "42399005", "136": "3415004", "51": "40739000",
    "172": "24982008", "119": "11934000", "347": "26544005", "74": "14760008",
    "32": "418290006", "17": "267038008", "66": "271823003",
}
SYMPTOM_WIDER = {"134": "386661006", "107": "386661006", "335": "386661006"}

# 送驗檢體類別(cdc-specimen-type) → SNOMED CT 檢體(specimen)
SPECIMEN = {
    "1": "119297000", "4": "258580003", "0": "119364003", "5": "119361006",
    "14": "119334006", "216": "119334006", "42": "122575003", "40": "119339001",
    "20": "258450006", "23": "418564007", "15": "258528007", "10": "119342007",
    "240": "119373006", "308": "119332005", "284": "258500001", "261": "258529004",
}
SPECIMEN_WIDER = {"213": "119339001"}
TB_SPECIMEN = {"1": "119297000", "14": "119334006", "20": "258450006", "23": "418564007"}

# 病原體(cdc-pathogen 大項) → SNOMED CT 生物體(organism)
PATHOGEN = {
    "001": "75953000", "009": "113861009", "020": "54365009", "022": "21234000",
    "032": "5851001", "033": "5247005", "044": "19030005", "055": "52584002",
    "061": "34348001", "098": "68704007", "0412": "9861002", "ZIKAV": "50471002",
    "19CoV": "840533007", "052": "19551004", "027": "36094007", "3200": "44470000",
}

# 病歷檔案類別(cdc-file-category) → LOINC 文件類型
FILE_CATEGORY = {"1": ("18842-5", "Discharge summary"), "2": ("34108-1", "Outpatient Note"),
                 "3": ("11502-2", "Laboratory report"), "4": ("18748-4", "Diagnostic imaging study")}


def codes_of(cs_id):
    path = GEN / f"CodeSystem-{cs_id}.fsh"
    if path.exists():
        text = path.read_text(encoding="utf-8")
    else:  # 本 IG 手動定義之代碼系統
        local = Path("input/fsh/vocabulary/CDC-NIDRS-Local.fsh").read_text(encoding="utf-8")
        m = re.search(rf"^Id: {re.escape(cs_id)}\n(.*?)(?=^ValueSet:|^CodeSystem:|\Z)", local, re.M | re.S)
        text = m.group(1) if m else ""
    return {m.group(1) for m in re.finditer(r'^\* #"?([^" ]+)"? "', text, re.M)}


def fsh_code(c):
    return "#" + c if re.match(r"^[A-Za-z0-9][A-Za-z0-9._-]*$", c) else '#"' + c + '"'


def concept_map(cid, name, title, desc, source_cs, target, groups):
    out = [
        f"Instance: {cid}", "InstanceOf: ConceptMap", "Usage: #definition",
        f'Title: "{title}"', f'Description: "{desc}"',
        f'* url = "{BASE}/ConceptMap/{cid}"', f'* name = "{name}"', f'* title = "{title}"',
        "* status = #active", "* experimental = false", '* date = "2026-10-22"', '* version = "0.1.0"',
        f'* description = "{desc}"',
        f'* sourceCanonical = "{BASE}/ValueSet/{source_cs}"',
        f'* group[0].source = "{BASE}/CodeSystem/{source_cs}"', f'* group[0].target = "{target}"',
    ]
    valid = codes_of(source_cs)
    skipped = []
    i = 0
    for src, tgt, disp, eq in groups:
        if src not in valid:
            skipped.append(src)
            continue
        out.append(f"* group[0].element[{i}].code = {fsh_code(src)}")
        out.append(f"* group[0].element[{i}].target[0].code = {fsh_code(tgt)}")
        if disp:
            out.append(f'* group[0].element[{i}].target[0].display = "{disp}"')
        out.append(f"* group[0].element[{i}].target[0].equivalence = #{eq}")
        if eq in ("wider", "narrower", "inexact"):
            out.append(f'* group[0].element[{i}].target[0].comment = "NIDRS 代碼之定義較目標概念狹義(例如限定併發重症或特定條件)"')
        i += 1
    if skipped:
        print(f"{cid}: 來源代碼不存在而略過 {skipped}")
    print(f"{cid}: {i} 筆")
    return "\n".join(out) + "\n"


def pairs(d, eq="equivalent"):
    return [(k, v, "", eq) for k, v in d.items()]


def main():
    parts = [
        "// 本檔由 scripts/gen_standard_maps.py 產生，請勿手動修改。\n",
        concept_map("cdc-disease-to-snomed", "CDCDiseaseToSNOMED", "通報疾病代碼對應 SNOMED CT",
                    "NIDRS 通報疾病代碼(DISEASE_ID)對應 SNOMED CT 疾患概念；實作者可於 Condition.code 同時填寫 SNOMED CT 編碼(TW Core sct slice)。",
                    "cdc-disease", SCT, pairs(DISEASE) + pairs(DISEASE_WIDER, "wider")),
        concept_map("cdc-symptom-to-snomed", "CDCSymptomToSNOMED", "症狀代碼對應 SNOMED CT",
                    "NIDRS 症狀代碼(DISEASE_SYMPTOM)對應 SNOMED CT 臨床發現概念；實作者可於 Condition.evidence.code 同時填寫 SNOMED CT 編碼。",
                    "cdc-symptom", SCT, pairs(SYMPTOM) + pairs(SYMPTOM_WIDER, "wider")),
        concept_map("cdc-specimen-type-to-snomed", "CDCSpecimenTypeToSNOMED", "送驗檢體類別對應 SNOMED CT",
                    "NIDRS 送驗檢體類別(SAMPLE_TYPE)對應 SNOMED CT 檢體概念；實作者可於 Specimen.type 同時填寫 SNOMED CT 編碼。",
                    "cdc-specimen-type", SCT, pairs(SPECIMEN) + pairs(SPECIMEN_WIDER, "wider")),
        concept_map("cdc-tb-specimen-type-to-snomed", "CDCTBSpecimenTypeToSNOMED", "結核病檢體類別對應 SNOMED CT",
                    "NIDRS 結核病檢體類別(TB_SAMPLE.SAMPLE_TYPE)對應 SNOMED CT 檢體概念。",
                    "cdc-tb-specimen-type", SCT, pairs(TB_SPECIMEN)),
        concept_map("cdc-pathogen-to-snomed", "CDCPathogenToSNOMED", "病原體類別對應 SNOMED CT",
                    "NIDRS 病原體類別大項(MasterId)對應 SNOMED CT 生物體概念；實作者可於病原體檢驗結果 Observation.valueCodeableConcept 同時填寫 SNOMED CT 編碼。",
                    "cdc-pathogen", SCT, pairs(PATHOGEN)),
        concept_map("cdc-file-category-to-loinc", "CDCFileCategoryToLOINC", "病歷檔案類別對應 LOINC 文件類型",
                    "NIDRS 病歷檔案類別(FILE_CATEGORY)對應 LOINC 文件類型；實作者應於 DocumentReference.type 填寫對應之 LOINC 代碼(其他類別不填)。",
                    "cdc-file-category", LNC, [(k, v[0], v[1], "equivalent") for k, v in FILE_CATEGORY.items()]),
    ]
    OUT.write_text("\n".join(parts), encoding="utf-8")


if __name__ == "__main__":
    main()
