Instance: nidrs-supplement-055
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-麻疹"
Description: "法定傳染病增補欄位-麻疹(055)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-055"
* version = "0.1.0"
* name = "NIDRSSupplement055"
* title = "法定傳染病增補欄位-麻疹"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第二類法定傳染病「法定傳染病增補欄位-麻疹」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If 勾選\"1.出疹\" or 勾選\"2.發燒(耳溫或肛溫)高於38℃\" or (勾選\"3.具有下列三項條件任一者. and count(勾選選項) > 0) or (勾選\"4.其他\" and 輸入其他說明) then 通報狀態＝可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#055 "麻疹"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀"
* item[0].type = #group
* item[0].item[0].linkId = "display-1"
* item[0].item[0].text = "請確實檢視病人之臨床表現，同時詢問麻疹相關疫苗接種史及旅遊史，並自下列條件中勾選符合本次通報原因之項目 (1、2、3、4至少勾選一項，可複選)"
* item[0].item[0].type = #display
* item[0].item[1].linkId = "S_Q000550110_A000550110"
* item[0].item[1].text = "1.出疹"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，起始日期必填"
* item[0].item[2].linkId = "S_055_00001"
* item[0].item[2].text = "起始日期"
* item[0].item[2].type = #date
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2024/01/01"
* item[0].item[3].linkId = "S_Q000550210_A000550210"
* item[0].item[3].text = "2.發燒(耳溫或肛溫)高於38℃"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，起始日期必填"
* item[0].item[4].linkId = "S_055_00002"
* item[0].item[4].text = "起始日期"
* item[0].item[4].type = #date
* item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2024/01/01"
* item[0].item[5].linkId = "S_Q000550310_A000550310"
* item[0].item[5].text = "3.具有下列三項條件任一者："
* item[0].item[5].type = #boolean
* item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，(1)~(3)選項至少勾選一項"
* item[0].item[6].linkId = "section-1.group-7"
* item[0].item[6].text = "(需選擇時，可複選)"
* item[0].item[6].type = #group
* item[0].item[6].item[0].linkId = "S_Q000550321_A000550321"
* item[0].item[6].item[0].text = "(1)具有咳嗽、流鼻水或結膜炎(畏光、流淚水或眼睛發紅)三種症狀其中的一種"
* item[0].item[6].item[0].type = #boolean
* item[0].item[6].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[6].item[1].linkId = "S_Q000550322_A000550322"
* item[0].item[6].item[1].text = "(2)無麻疹相關疫苗接種史"
* item[0].item[6].item[1].type = #boolean
* item[0].item[6].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[6].item[2].linkId = "S_Q000550323_A000550323"
* item[0].item[6].item[2].text = "(3)發病前三週內，曾有麻疹流行地區旅遊史"
* item[0].item[6].item[2].type = #boolean
* item[0].item[6].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[7].linkId = "S_Q000550410_A000550410"
* item[0].item[7].text = "4.其他"
* item[0].item[7].type = #string
* item[0].item[7].maxLength = 200
* item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[7].extension[0].valueMarkdown = "答案值：String/200"
