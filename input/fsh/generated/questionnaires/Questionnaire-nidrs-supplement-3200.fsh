Instance: nidrs-supplement-3200
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-侵襲性b型嗜血桿菌感染症"
Description: "法定傳染病增補欄位-侵襲性b型嗜血桿菌感染症(3200)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-3200"
* version = "0.1.0"
* name = "NIDRSSupplement3200"
* title = "法定傳染病增補欄位-侵襲性b型嗜血桿菌感染症"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-侵襲性b型嗜血桿菌感染症」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If count(勾選\"臨床診斷\".選項) > 0 or 輸入其他症狀then 通報狀態＝可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#3200 "侵襲性b型嗜血桿菌感染症"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "臨床診斷 (必填欄位) (可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_Q032000001_A032000001"
* item[0].item[0].item[0].text = "腦膜炎"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_Q032000001_A032000002"
* item[0].item[0].item[1].text = "菌血症"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_Q032000001_A032000003"
* item[0].item[0].item[2].text = "肺炎"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[3].linkId = "S_Q032000001_A032000004"
* item[0].item[0].item[3].text = "蜂窩組織炎"
* item[0].item[0].item[3].type = #boolean
* item[0].item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[4].linkId = "S_Q032000001_A032000005"
* item[0].item[0].item[4].text = "敗血性關節炎"
* item[0].item[0].item[4].type = #boolean
* item[0].item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[5].linkId = "S_Q032000001_A032000006"
* item[0].item[0].item[5].text = "骨髓炎"
* item[0].item[0].item[5].type = #boolean
* item[0].item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[6].linkId = "S_Q032000001_A032000007"
* item[0].item[0].item[6].text = "會厭炎"
* item[0].item[0].item[6].type = #boolean
* item[0].item[0].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[7].linkId = "S_Q032000002_A032000009"
* item[0].item[0].item[7].text = "其他症狀"
* item[0].item[0].item[7].type = #string
* item[0].item[0].item[7].maxLength = 200
* item[0].item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[7].extension[0].valueMarkdown = "答案值：String/200"
