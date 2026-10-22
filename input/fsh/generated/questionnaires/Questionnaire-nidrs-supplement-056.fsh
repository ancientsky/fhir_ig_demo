Instance: nidrs-supplement-056
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-德國麻疹"
Description: "法定傳染病增補欄位-德國麻疹(056)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-056"
* version = "0.1.0"
* name = "NIDRSSupplement056"
* title = "法定傳染病增補欄位-德國麻疹"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第二類法定傳染病「法定傳染病增補欄位-德國麻疹」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#056 "德國麻疹"
* item[0].linkId = "section-1"
* item[0].text = "此為病例調查表之臨床症狀部分(可複選)"
* item[0].type = #group
* item[0].item[0].linkId = "S_Q000560001_A000000022"
* item[0].item[0].text = "全身出現斑丘疹(maculopapular rash)"
* item[0].item[0].type = #boolean
* item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].linkId = "S_Q000560001_A000000007"
* item[0].item[1].text = "發燒(fever)"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].linkId = "S_Q000560001_A000000008"
* item[0].item[2].text = "結膜炎(conjunctivitis)"
* item[0].item[2].type = #boolean
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[3].linkId = "S_Q000560001_A000000023"
* item[0].item[3].text = "關節炎(arthritis)"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[4].linkId = "S_Q000560001_A000000024"
* item[0].item[4].text = "頸部淋巴腺腫大(lymphadenopathy)"
* item[0].item[4].type = #boolean
* item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
