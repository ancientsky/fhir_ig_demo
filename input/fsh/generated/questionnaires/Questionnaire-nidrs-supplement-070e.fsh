Instance: nidrs-supplement-070e
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-急性病毒性E型肝炎"
Description: "法定傳染病增補欄位-急性病毒性E型肝炎(070e)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-070e"
* version = "0.1.0"
* name = "NIDRSSupplement070E"
* title = "法定傳染病增補欄位-急性病毒性E型肝炎"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-急性病毒性E型肝炎」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#070e "急性病毒性Ｅ型肝炎"
* item[0].linkId = "section-1"
* item[0].text = "臨床條件"
* item[0].type = #group
* item[0].item[0].linkId = "S_Q0070e0004_A070ea0001"
* item[0].item[0].text = "經醫師臨床診斷為急性病毒性肝炎，且需排除急性A、B、C型肝炎感染"
* item[0].item[0].type = #boolean
* item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].linkId = "section-2"
* item[1].text = "通報時檢驗資料"
* item[1].type = #group
* item[1].item[0].linkId = "S_070e_00001"
* item[1].item[0].text = "ALT上升"
* item[1].item[0].type = #boolean
* item[1].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[1].linkId = "S_Q0070e0002_A000000063"
* item[1].item[1].text = "ALT 檢驗值"
* item[1].item[1].type = #integer
* item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].extension[0].valueMarkdown = "答案值：Number"
