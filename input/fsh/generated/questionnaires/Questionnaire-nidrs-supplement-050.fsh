Instance: nidrs-supplement-050
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-天花"
Description: "法定傳染病增補欄位-天花(050)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-050"
* version = "0.1.0"
* name = "NIDRSSupplement050"
* title = "法定傳染病增補欄位-天花"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第一類法定傳染病「法定傳染病增補欄位-天花」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#050 "天花"
* item[0].linkId = "section-1"
* item[0].text = "臨床條件"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "一、爆發流行前，同時符合下列條件：(可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_00050QC001_00050AC110"
* item[0].item[0].item[0].text = "(一)突然發燒38.3°C（101°F）以上。"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_00050QC001_00050AC120"
* item[0].item[0].item[1].text = "(二)接著會依序出現不同型態及進展一致的皮膚病灶如紅疹、丘疹、水泡或膿疱。"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_00050QC001_00050AC130"
* item[0].item[0].item[2].text = "(三)無其他明顯病因，能與水痘（VZV）做鑑別診斷。"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].linkId = "section-1.group-2"
* item[0].item[1].text = "二、爆發流行時：於發現第一例天花病例後，具有下列任一個條件： (可複選)"
* item[0].item[1].type = #group
* item[0].item[1].item[0].linkId = "S_00050QC002_00050AC210"
* item[0].item[1].item[0].text = "(一)發燒1至4天後出現皮疹，且演進的發展性皮疹。"
* item[0].item[1].item[0].type = #boolean
* item[0].item[1].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].item[1].linkId = "S_00050QC002_00050AC220"
* item[0].item[1].item[1].text = "(二)突然發燒38.3°C（101°F）以上；或並未出現符合臨床通報定義之症狀。"
* item[0].item[1].item[1].type = #boolean
* item[0].item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
