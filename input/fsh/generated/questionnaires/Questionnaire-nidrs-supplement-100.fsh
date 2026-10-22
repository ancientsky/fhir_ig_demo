Instance: nidrs-supplement-100
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-鉤端螺旋體病"
Description: "法定傳染病增補欄位-鉤端螺旋體病(100)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-100"
* version = "0.1.0"
* name = "NIDRSSupplement100"
* title = "法定傳染病增補欄位-鉤端螺旋體病"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第四類法定傳染病「法定傳染病增補欄位-鉤端螺旋體病」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If 勾選(\"接觸動物\"或\"野外活動\"或\"污染的環境\") and (發病日 - 勾選項目所填寫的日期) <= 30天 then 通報狀態＝可通報 Else 通報狀態＝不可通報"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#100 "鉤端螺旋體病"
* item[0].linkId = "section-1"
* item[0].text = "接觸史(可複選)"
* item[0].type = #group
* item[0].item[0].linkId = "S_Q010000021_AS01000001"
* item[0].item[0].text = "接觸動物"
* item[0].item[0].type = #boolean
* item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，日期為必填"
* item[0].item[1].linkId = "S_Q010000022_AS01000002"
* item[0].item[1].text = "日期"
* item[0].item[1].type = #date
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2021/01/01"
* item[0].item[2].linkId = "S_Q010000023_AS01000003"
* item[0].item[2].text = "野外活動"
* item[0].item[2].type = #boolean
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，日期為必填"
* item[0].item[3].linkId = "S_Q010000024_AS01000004"
* item[0].item[3].text = "日期"
* item[0].item[3].type = #date
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2021/01/01"
* item[0].item[4].linkId = "S_Q010000025_AS01000005"
* item[0].item[4].text = "污染的環境"
* item[0].item[4].type = #boolean
* item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，日期為必填"
* item[0].item[5].linkId = "S_Q010000026_AS01000006"
* item[0].item[5].text = "日期"
* item[0].item[5].type = #date
* item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[5].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2021/01/01"
