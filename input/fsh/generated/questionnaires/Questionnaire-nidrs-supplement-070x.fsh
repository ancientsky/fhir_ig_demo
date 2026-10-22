Instance: nidrs-supplement-070x
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-急性病毒性肝炎未定型"
Description: "法定傳染病增補欄位-急性病毒性肝炎未定型(070x)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-070x"
* version = "0.1.0"
* name = "NIDRSSupplement070X"
* title = "法定傳染病增補欄位-急性病毒性肝炎未定型"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-急性病毒性肝炎未定型」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If 勾選 \" (1)血清學A型肝炎IgM抗體(IgM Anti-HAV)檢測\" or勾選\" (2)血清學B型肝炎IgM核心抗體(IgM anti-HBc) 檢測\" or勾選\" (3)血清學B型肝炎表面抗原(HBsAg) 檢測\" or勾選\" (4)急性病毒C型肝炎抗體(anti-HCV) 檢測\" then 通報狀態＝可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#070x "急性病毒性肝炎未定型"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "display-1"
* item[0].item[0].text = "(1)~(4)至少勾選一項，可複選"
* item[0].item[0].type = #display
* item[0].item[1].linkId = "S_Q0070X0001_A000000234"
* item[0].item[1].text = "(1)血清學A型肝炎IgM抗體(IgM Anti-HAV)檢測"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，下方欄位必選"
* item[0].item[2].linkId = "section-1.group-3"
* item[0].item[2].text = "(勾選1時， 需擇一填寫) (單選)"
* item[0].item[2].type = #group
* item[0].item[2].item[0].linkId = "S_Q0070x0001_A000000235"
* item[0].item[2].item[0].text = "陽性"
* item[0].item[2].item[0].type = #boolean
* item[0].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[1].linkId = "S_Q0070x0001_A000000236"
* item[0].item[2].item[1].text = "陰性"
* item[0].item[2].item[1].type = #boolean
* item[0].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[3].linkId = "S_Q0070X0004_A000000234"
* item[0].item[3].text = "(2)血清學B型肝炎IgM核心抗體(IgM anti-HBc) 檢測"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，下方欄位必選"
* item[0].item[4].linkId = "section-1.group-5"
* item[0].item[4].text = "(勾選2時， 需擇一填寫) (單選)"
* item[0].item[4].type = #group
* item[0].item[4].item[0].linkId = "S_Q0070x0004_A000000235"
* item[0].item[4].item[0].text = "陽性"
* item[0].item[4].item[0].type = #boolean
* item[0].item[4].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[4].item[1].linkId = "S_Q0070x0004_A000000236"
* item[0].item[4].item[1].text = "陰性"
* item[0].item[4].item[1].type = #boolean
* item[0].item[4].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[5].linkId = "S_Q0070X0007_A070XA0000"
* item[0].item[5].text = "(3)血清學B型肝炎表面抗原(HBsAg) 檢測"
* item[0].item[5].type = #boolean
* item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，下方欄位必選"
* item[0].item[6].linkId = "section-1.group-7"
* item[0].item[6].text = "(勾選3時， 需擇一填寫) (單選)"
* item[0].item[6].type = #group
* item[0].item[6].item[0].linkId = "S_Q0070x0007_A070xa0001"
* item[0].item[6].item[0].text = "陽性"
* item[0].item[6].item[0].type = #boolean
* item[0].item[6].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[6].item[1].linkId = "S_Q0070x0007_A000000236"
* item[0].item[6].item[1].text = "陰性"
* item[0].item[6].item[1].type = #boolean
* item[0].item[6].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[7].linkId = "S_Q0070X0010_A000000234"
* item[0].item[7].text = "(4)急性病毒C型肝炎抗體(anti-HCV) 檢測"
* item[0].item[7].type = #boolean
* item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[7].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，下方欄位必選"
* item[0].item[8].linkId = "section-1.group-9"
* item[0].item[8].text = "(勾選4時， 需擇一填寫) (單選)"
* item[0].item[8].type = #group
* item[0].item[8].item[0].linkId = "S_Q0070x0010_A000000235"
* item[0].item[8].item[0].text = "陽性"
* item[0].item[8].item[0].type = #boolean
* item[0].item[8].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[8].item[1].linkId = "S_Q0070x0010_A000000236"
* item[0].item[8].item[1].text = "陰性"
* item[0].item[8].item[1].type = #boolean
* item[0].item[8].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].linkId = "S_Q0070x0013_A000000048"
* item[0].item[9].text = "(5)急性病毒D、E型肝炎檢驗部分送疾病管制署確認"
* item[0].item[9].type = #boolean
* item[0].item[9].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[10].linkId = "S_Q0070x0014_A000000048"
* item[0].item[10].text = "(6)是否已排除排除藥物、中毒性肝炎、自體免疫性肝炎、酒精性肝炎、膽道疾病、心血管疾病（如鬱血性心衰竭、休克等）"
* item[0].item[10].type = #boolean
* item[0].item[10].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[10].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[11].linkId = "S_Q0070x0015_A070xa0002"
* item[0].item[11].text = "(7) ALT上升2.5倍以上"
* item[0].item[11].type = #boolean
* item[0].item[11].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[11].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[12].linkId = "S_070x_00001"
* item[0].item[12].text = "(8) 傳染病認可機構名稱"
* item[0].item[12].type = #boolean
* item[0].item[12].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[12].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，下方欄位必選"
* item[0].item[13].linkId = "section-1.group-14"
* item[0].item[13].text = "(勾選8時，醫事機構代碼必填)"
* item[0].item[13].type = #group
* item[0].item[13].item[0].linkId = "S_070x_00002"
* item[0].item[13].item[0].text = "醫事機構"
* item[0].item[13].item[0].type = #string
* item[0].item[13].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[13].item[0].extension[0].valueMarkdown = "答案值：代碼；備註：醫事機構代碼"
* item[0].item[13].item[1].linkId = "display-2"
* item[0].item[13].item[1].text = "血清學A型肝炎IgM抗體(IgM anti-HAV)、血清學B型肝炎IgM核心抗體(IgM anti-HBc)、 血清學C型肝炎病毒抗體(anti-HCV)檢測應由疾病管制署傳染病認可檢驗機構檢驗"
* item[0].item[13].item[1].type = #display
* item[0].item[14].linkId = "S_Q0070x0016_A000000063"
* item[0].item[14].text = "ALT 檢驗值"
* item[0].item[14].type = #integer
* item[0].item[14].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[14].extension[0].valueMarkdown = "答案值：Number"
