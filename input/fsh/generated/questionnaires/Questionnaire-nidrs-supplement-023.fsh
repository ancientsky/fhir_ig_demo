Instance: nidrs-supplement-023
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-布氏桿菌病"
Description: "法定傳染病增補欄位-布氏桿菌病(023)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-023"
* version = "0.1.0"
* name = "NIDRSSupplement023"
* title = "法定傳染病增補欄位-布氏桿菌病"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第四類法定傳染病「法定傳染病增補欄位-布氏桿菌病」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If \"旅遊期間有無食用下列食品\"勾選\"有\" and (勾選\"牛奶或羊奶\" or勾選\"未煮熟的牛肉或羊肉\" or勾選\"起司或乳酪\" or (勾選\"其他\" 且 \"其他註明(輸入內容)\"有值)) then 通報狀態＝可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#023 "布氏桿菌病"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "醫院自行檢驗資料 (可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_Q002300002_A002300002"
* item[0].item[0].item[0].text = "臨床檢體分離出Brucella species"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_Q002300004_A002300004"
* item[0].item[0].item[1].text = "血清學抗體檢測陽性"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].linkId = "section-2"
* item[1].text = "流行病學資料"
* item[1].type = #group
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "職業為獸醫從業人員(單選)"
* item[1].item[0].type = #group
* item[1].item[0].item[0].linkId = "S_Q002300017_YES"
* item[1].item[0].item[0].text = "是"
* item[1].item[0].item[0].type = #boolean
* item[1].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[1].linkId = "S_Q002300017_NO"
* item[1].item[0].item[1].text = "否"
* item[1].item[0].item[1].type = #boolean
* item[1].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[1].linkId = "section-2.group-2"
* item[1].item[1].text = "職業為動物實驗室人員(單選)"
* item[1].item[1].type = #group
* item[1].item[1].item[0].linkId = "S_Q002300018_YES"
* item[1].item[1].item[0].text = "是"
* item[1].item[1].item[0].type = #boolean
* item[1].item[1].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[1].item[1].linkId = "S_Q002300018_NO"
* item[1].item[1].item[1].text = "否"
* item[1].item[1].item[1].type = #boolean
* item[1].item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].linkId = "section-2.group-3"
* item[1].item[2].text = "旅遊期間有無食用下列食品(單選)"
* item[1].item[2].type = #group
* item[1].item[2].item[0].linkId = "S_Q002300015_A002300022"
* item[1].item[2].item[0].text = "無"
* item[1].item[2].item[0].type = #boolean
* item[1].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[1].linkId = "S_Q002300015_A002300021"
* item[1].item[2].item[1].text = "有"
* item[1].item[2].item[1].type = #boolean
* item[1].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，以下四項必選"
* item[1].item[3].linkId = "section-2.group-4"
* item[1].item[3].text = "(需選擇時，可複選)"
* item[1].item[3].type = #group
* item[1].item[3].item[0].linkId = "S_Q002300015_A002300023"
* item[1].item[3].item[0].text = "牛奶或羊奶"
* item[1].item[3].item[0].type = #boolean
* item[1].item[3].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[3].item[1].linkId = "S_Q002300015_A002300024"
* item[1].item[3].item[1].text = "未煮熟的牛肉或羊肉"
* item[1].item[3].item[1].type = #boolean
* item[1].item[3].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[3].item[2].linkId = "S_Q002300015_A002300025"
* item[1].item[3].item[2].text = "起司或乳酪"
* item[1].item[3].item[2].type = #boolean
* item[1].item[3].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[3].item[3].linkId = "S_Q002300015_A002300026"
* item[1].item[3].item[3].text = "其他"
* item[1].item[3].item[3].type = #boolean
* item[1].item[3].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，下方欄位必填"
* item[1].item[3].item[4].linkId = "S_Q002300016_A002300027"
* item[1].item[3].item[4].text = "(輸入內容)"
* item[1].item[3].item[4].type = #string
* item[1].item[3].item[4].maxLength = 200
* item[1].item[3].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[4].extension[0].valueMarkdown = "答案值：String/200；備註：請描述"
