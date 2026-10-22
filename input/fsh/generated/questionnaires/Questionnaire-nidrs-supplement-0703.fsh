Instance: nidrs-supplement-0703
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-急性病毒性B型肝炎"
Description: "法定傳染病增補欄位-急性病毒性B型肝炎(0703)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-0703"
* version = "0.1.0"
* name = "NIDRSSupplement0703"
* title = "法定傳染病增補欄位-急性病毒性B型肝炎"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-急性病毒性B型肝炎」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If勾選\"經醫師研判「診斷為急性B型肝炎，排除慢性肝炎急性發作且排除其他原因引起之肝功能異常發炎」\" and勾選\"血清學B型肝炎表面抗原(HBsAg)檢測\" then 通報狀態＝可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#0703 "急性病毒性B型肝炎"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "經醫師診斷「排除慢性肝炎急性發作或其他原因引起之肝功能異常發炎」 (必填欄位) (單選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_Q007030002_A000000048"
* item[0].item[0].item[0].text = "是"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_Q007030002_A000000049"
* item[0].item[0].item[1].text = "否"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_Q007030002_A000000050"
* item[0].item[0].item[2].text = "通報醫師研判為不明"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].linkId = "section-2"
* item[1].text = "通報時檢驗資料"
* item[1].type = #group
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "血清學B型肝炎表面抗原(HBsAg)檢測 (必填欄位) (單選)"
* item[1].item[0].type = #group
* item[1].item[0].item[0].linkId = "S_Q007030006_A0703a0001"
* item[1].item[0].item[0].text = "陽性"
* item[1].item[0].item[0].type = #boolean
* item[1].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[1].linkId = "S_Q007030006_A000000236"
* item[1].item[0].item[1].text = "陰性"
* item[1].item[0].item[1].type = #boolean
* item[1].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[2].linkId = "S_Q007030006_A000015102"
* item[1].item[0].item[2].text = "無檢驗"
* item[1].item[0].item[2].type = #boolean
* item[1].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[1].linkId = "S_0703_00001"
* item[1].item[1].text = "肝功能異常(ALT>=100IU/I)"
* item[1].item[1].type = #boolean
* item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].linkId = "S_Q007030013_A000000063"
* item[1].item[2].text = "ALT 檢驗值"
* item[1].item[2].type = #integer
* item[1].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].extension[0].valueMarkdown = "答案值：Number"
* item[2].linkId = "section-3"
* item[2].text = "個案狀況維護與補充資料"
* item[2].type = #group
* item[2].item[0].linkId = "section-3.group-1"
* item[2].item[0].text = "是否進行愛滋病毒篩檢(單選)"
* item[2].item[0].type = #group
* item[2].item[0].item[0].linkId = "S_0703_00002"
* item[2].item[0].item[0].text = "是"
* item[2].item[0].item[0].type = #boolean
* item[2].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[2].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：如勾是，則篩檢日期必填"
* item[2].item[0].item[1].linkId = "S_0703_00003"
* item[2].item[0].item[1].text = "否"
* item[2].item[0].item[1].type = #boolean
* item[2].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[2].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[2].item[1].linkId = "S_0703_00004"
* item[2].item[1].text = "篩檢日期"
* item[2].item[1].type = #date
* item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[2].item[1].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2023/01/01"
