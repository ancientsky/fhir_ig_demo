Instance: nidrs-supplement-027
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-李斯特菌症"
Description: "法定傳染病增補欄位-李斯特菌症(027)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-027"
* version = "0.1.0"
* name = "NIDRSSupplement027"
* title = "法定傳染病增補欄位-李斯特菌症"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第四類法定傳染病「法定傳染病增補欄位-李斯特菌症」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#027 "李斯特菌症"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "經醫院自行檢驗符合檢驗條件："
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_027_00001"
* item[0].item[0].item[0].text = "分離並鑑定出李斯特菌 (正常無菌部位(如血液、腦脊髓液等)；流產或死胎之胎盤或胎兒組織(如羊水、胎便、腸胃道內容物等))"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
