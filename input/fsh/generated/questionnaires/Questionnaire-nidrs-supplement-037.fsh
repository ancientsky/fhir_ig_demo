Instance: nidrs-supplement-037
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-破傷風"
Description: "法定傳染病增補欄位-破傷風(037)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-037"
* version = "0.1.0"
* name = "NIDRSSupplement037"
* title = "法定傳染病增補欄位-破傷風"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-破傷風」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#037 "破傷風"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀(可複選)"
* item[0].type = #group
* item[0].item[0].linkId = "S_Q000370001_A000000042"
* item[0].item[0].text = "全身肌肉僵直(rigidity of muscles)"
* item[0].item[0].type = #boolean
* item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].linkId = "S_Q000370001_A000000043"
* item[0].item[1].text = "牙關緊閉(trismus)"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].linkId = "S_Q000370001_A000000044"
* item[0].item[2].text = "痙攣(spasm or convulsion)"
* item[0].item[2].type = #boolean
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[3].linkId = "S_Q000370001_A000000045"
* item[0].item[3].text = "角弓反張(optisthotonus)"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[4].linkId = "S_Q000370001_A000000048"
* item[0].item[4].text = "痛性之肌肉收縮（最初在咬肌及頸部肌肉，而後為軀幹肌肉）"
* item[0].item[4].type = #boolean
* item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[5].linkId = "S_Q000370001_A000000049"
* item[0].item[5].text = "臉部表情出現「痙笑」（risus sardonicus）"
* item[0].item[5].type = #boolean
* item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[6].linkId = "S_Q000370001_A000000046"
* item[0].item[6].text = "其他症狀"
* item[0].item[6].type = #boolean
* item[0].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，下方欄位為必填"
* item[0].item[7].linkId = "S_Q000370002_A000000047"
* item[0].item[7].text = "其他症狀(說明)"
* item[0].item[7].type = #string
* item[0].item[7].maxLength = 200
* item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[7].extension[0].valueMarkdown = "答案值：String/200"
* item[0].item[8].linkId = "section-1.group-9"
* item[0].item[8].text = "是否有傷口 (單選)"
* item[0].item[8].type = #group
* item[0].item[8].item[0].linkId = "S_Q000370003_A000000048"
* item[0].item[8].item[0].text = "是"
* item[0].item[8].item[0].type = #boolean
* item[0].item[8].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[8].item[1].linkId = "S_Q000370003_A000000049"
* item[0].item[8].item[1].text = "否"
* item[0].item[8].item[1].type = #boolean
* item[0].item[8].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[8].item[2].linkId = "S_Q000370003_A000000050"
* item[0].item[8].item[2].text = "不知"
* item[0].item[8].item[2].type = #boolean
* item[0].item[8].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].linkId = "section-1.group-10"
* item[0].item[9].text = "傷口種類 (可複選)"
* item[0].item[9].type = #group
* item[0].item[9].item[0].linkId = "S_Q000370004_A000000051"
* item[0].item[9].item[0].text = "穿刺傷"
* item[0].item[9].item[0].type = #boolean
* item[0].item[9].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[1].linkId = "S_Q000370004_A000000052"
* item[0].item[9].item[1].text = "割傷"
* item[0].item[9].item[1].type = #boolean
* item[0].item[9].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[2].linkId = "S_Q000370004_A000000053"
* item[0].item[9].item[2].text = "擦傷"
* item[0].item[9].item[2].type = #boolean
* item[0].item[9].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[3].linkId = "S_Q000370004_A000000054"
* item[0].item[9].item[3].text = "灼/燙傷"
* item[0].item[9].item[3].type = #boolean
* item[0].item[9].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[4].linkId = "S_Q000370004_A000000055"
* item[0].item[9].item[4].text = "褥瘡"
* item[0].item[9].item[4].type = #boolean
* item[0].item[9].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[5].linkId = "S_Q000370004_A000000056"
* item[0].item[9].item[5].text = "動物咬傷"
* item[0].item[9].item[5].type = #boolean
* item[0].item[9].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[6].linkId = "S_Q000370004_A000000057"
* item[0].item[9].item[6].text = "未說明傷口種類"
* item[0].item[9].item[6].type = #boolean
* item[0].item[9].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[7].linkId = "S_Q000370005_A000000059"
* item[0].item[9].item[7].text = "其他症狀"
* item[0].item[9].item[7].type = #string
* item[0].item[9].item[7].maxLength = 200
* item[0].item[9].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[7].extension[0].valueMarkdown = "答案值：String/200；備註：請描述"
