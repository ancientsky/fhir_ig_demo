Instance: nidrs-supplement-MPXV
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-M痘"
Description: "法定傳染病增補欄位-M痘(MPXV)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-MPXV"
* version = "0.1.0"
* name = "NIDRSSupplementMpxv"
* title = "法定傳染病增補欄位-M痘"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第二類法定傳染病「法定傳染病增補欄位-M痘」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#MPXV "猴痘M痘"
* item[0].linkId = "section-1"
* item[0].text = "個案狀況維護與補充資料"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "是否進行愛滋病毒篩檢 (單選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_MPXV_00001"
* item[0].item[0].item[0].text = "是"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：如勾是，則篩檢日期必填"
* item[0].item[0].item[1].linkId = "S_MPXV_00002"
* item[0].item[0].item[1].text = "否"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].linkId = "S_MPXV_00003"
* item[0].item[1].text = "篩檢日期"
* item[0].item[1].type = #date
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2024/01/01"
