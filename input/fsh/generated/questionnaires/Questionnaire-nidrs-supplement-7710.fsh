Instance: nidrs-supplement-7710
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-先天性德國麻疹症候群"
Description: "法定傳染病增補欄位-先天性德國麻疹症候群(7710)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-7710"
* version = "0.1.0"
* name = "NIDRSSupplement7710"
* title = "法定傳染病增補欄位-先天性德國麻疹症候群"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-先天性德國麻疹症候群」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 無"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#7710 "先天性德國麻疹症候群"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "此為病例調查表之臨床症狀部分 (可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_Q077100001_A000000025"
* item[0].item[0].item[0].text = "1.先天性白內障(congenital cataracts)"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_Q077100001_A000000026"
* item[0].item[0].item[1].text = "2.先天性青光眼(congenital glaucoma)"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_Q077100001_A000000027"
* item[0].item[0].item[2].text = "3.先天性心臟病(congenital heart disease)"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[3].linkId = "S_Q077100002_A000000028"
* item[0].item[0].item[3].text = "3-1.開放性心臟導管"
* item[0].item[0].item[3].type = #boolean
* item[0].item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：未勾選3者，3-1、3-2不可勾選"
* item[0].item[0].item[4].linkId = "S_Q077100002_A000000029"
* item[0].item[0].item[4].text = "3-2.肺動脈瓣狹窄"
* item[0].item[0].item[4].type = #boolean
* item[0].item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[4].extension[0].valueMarkdown = "答案值：1=勾選；備註：未勾選3者，3-1、3-2不可勾選"
* item[0].item[0].item[5].linkId = "S_Q077100001_A000000030"
* item[0].item[0].item[5].text = "4.聽力障礙(hearing loss)"
* item[0].item[0].item[5].type = #boolean
* item[0].item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[6].linkId = "S_Q077100001_A000000031"
* item[0].item[0].item[6].text = "5.色素性視網膜病(pigmentary retinopathy)"
* item[0].item[0].item[6].type = #boolean
* item[0].item[0].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[7].linkId = "S_Q077100001_A000000032"
* item[0].item[0].item[7].text = "6.血小板數量過低(low platelet count)"
* item[0].item[0].item[7].type = #boolean
* item[0].item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[7].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[8].linkId = "S_Q077100001_A000000033"
* item[0].item[0].item[8].text = "7.其他異常"
* item[0].item[0].item[8].type = #boolean
* item[0].item[0].item[8].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[8].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[9].linkId = "S_Q077100001_A000000034"
* item[0].item[0].item[9].text = "8.閉塞性黃疸(jaundice)(24小時內發生)"
* item[0].item[0].item[9].type = #boolean
* item[0].item[0].item[9].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[9].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[10].linkId = "S_Q077100001_A000000035"
* item[0].item[0].item[10].text = "9.紫斑(purpura)"
* item[0].item[0].item[10].type = #boolean
* item[0].item[0].item[10].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[10].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[11].linkId = "S_Q077100001_A000000036"
* item[0].item[0].item[11].text = "10.長骨放射線透度異常(long bone radiolucencies)"
* item[0].item[0].item[11].type = #boolean
* item[0].item[0].item[11].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[11].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[12].linkId = "S_Q077100001_A000000037"
* item[0].item[0].item[12].text = "11.腦膜腦炎(meningoencephaliis)"
* item[0].item[0].item[12].type = #boolean
* item[0].item[0].item[12].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[12].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[13].linkId = "S_Q077100001_A000000038"
* item[0].item[0].item[13].text = "12.脾腫大(enlarged spleen)"
* item[0].item[0].item[13].type = #boolean
* item[0].item[0].item[13].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[13].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[14].linkId = "S_Q077100001_A000000039"
* item[0].item[0].item[14].text = "13.小腦症(microcephaly)"
* item[0].item[0].item[14].type = #boolean
* item[0].item[0].item[14].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[14].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[15].linkId = "S_Q077100001_A000000040"
* item[0].item[0].item[15].text = "14.心智發育遲緩(mental retardation)"
* item[0].item[0].item[15].type = #boolean
* item[0].item[0].item[15].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[15].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[16].linkId = "S_Q077100001_A000000041"
* item[0].item[0].item[16].text = "15.肝腫大(enlarged liver)"
* item[0].item[0].item[16].type = #boolean
* item[0].item[0].item[16].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[16].extension[0].valueMarkdown = "答案值：1=勾選"
