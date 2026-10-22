Instance: nidrs-supplement-071T
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-狂犬病毒檢驗"
Description: "法定傳染病增補欄位-狂犬病毒檢驗(071T)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-071T"
* version = "0.1.0"
* name = "NIDRSSupplement071T"
* title = "法定傳染病增補欄位-狂犬病毒檢驗"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "重點監視項目「法定傳染病增補欄位-狂犬病毒檢驗」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#071T "狂犬病毒檢驗"
* item[0].linkId = "section-1"
* item[0].text = "個案狀況維護與補充資料"
* item[0].type = #group
* item[0].item[0].linkId = "S_071T_00001"
* item[0].item[0].text = "預定進行器官捐贈者"
* item[0].item[0].type = #boolean
* item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].linkId = "S_071T_00002"
* item[0].item[1].text = "曾經接受器官移植者"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，地點需填寫"
* item[0].item[2].linkId = "section-1.group-3"
* item[0].item[2].text = "(地點) (需填寫時，單選)"
* item[0].item[2].type = #group
* item[0].item[2].item[0].linkId = "S_071T_00003"
* item[0].item[2].item[0].text = "國內"
* item[0].item[2].item[0].type = #boolean
* item[0].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[1].linkId = "S_071T_00004"
* item[0].item[2].item[1].text = "國外"
* item[0].item[2].item[1].type = #boolean
* item[0].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，國家必填"
* item[0].item[3].linkId = "section-1.group-4"
* item[0].item[3].text = "(國家)"
* item[0].item[3].type = #group
* item[0].item[3].item[0].linkId = "S_071T_00005"
* item[0].item[3].item[0].text = "(選擇國家)"
* item[0].item[3].item[0].type = #string
* item[0].item[3].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].item[0].extension[0].valueMarkdown = "答案值：代碼；備註：國家代碼 選擇「OTH其他」者，其他國家必填"
* item[0].item[3].item[1].linkId = "S_071T_00006"
* item[0].item[3].item[1].text = "(其他國家)"
* item[0].item[3].item[1].type = #string
* item[0].item[3].item[1].maxLength = 200
* item[0].item[3].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].item[1].extension[0].valueMarkdown = "答案值：String/200"
