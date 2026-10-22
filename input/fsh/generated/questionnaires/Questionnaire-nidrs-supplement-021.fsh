Instance: nidrs-supplement-021
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-兔熱病"
Description: "法定傳染病增補欄位-兔熱病(021)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-021"
* version = "0.1.0"
* name = "NIDRSSupplement021"
* title = "法定傳染病增補欄位-兔熱病"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第四類法定傳染病「法定傳染病增補欄位-兔熱病」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#021 "兔熱病"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "經醫院自行檢驗符合檢驗條件 (可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_021_00001"
* item[0].item[0].item[0].text = "(1)臨床檢體分子生物學核酸檢測陽性"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_021_00002"
* item[0].item[0].item[1].text = "(2)血清學抗體檢測陽性：恢復期血清較急性期血清抗體效價≧4倍上升"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_021_00003"
* item[0].item[0].item[2].text = "(3)臨床檢體中分離並鑑定出土拉倫法氏菌"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選本欄位，下方四欄位必勾選(單選)"
* item[0].item[1].linkId = "S_021_00004"
* item[0].item[1].text = "F.tularensis subsp. tularensis"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].linkId = "S_021_00005"
* item[0].item[2].text = "F.tularensis subsp. holarctica"
* item[0].item[2].type = #boolean
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[3].linkId = "S_021_00006"
* item[0].item[3].text = "F.tularensis subsp. mediasiatica"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[4].linkId = "S_021_00007"
* item[0].item[4].text = "F.tularensis subsp. novicida"
* item[0].item[4].type = #boolean
* item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
