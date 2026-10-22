Instance: nidrs-supplement-098
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-淋病"
Description: "法定傳染病增補欄位-淋病(098)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-098"
* version = "0.1.0"
* name = "NIDRSSupplement098"
* title = "法定傳染病增補欄位-淋病"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-淋病」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If count(勾選\"具備下列其中一種以上實驗室診斷\".選項) > 0) then 通報狀態＝可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#098 "淋病"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "具備下列其中一種以上實驗室診斷 (必填欄位) (可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_Q000980003_AS09800003"
* item[0].item[0].item[0].text = "細菌培養"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_Q000980004_AS09800004"
* item[0].item[0].item[1].text = "染色鏡檢"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_Q000980005_AS09800005"
* item[0].item[0].item[2].text = "PCR或其他檢驗方式偵測出淋菌抗原或基因"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].linkId = "section-1.group-2"
* item[0].item[1].text = "檢體種類 (單選)"
* item[0].item[1].type = #group
* item[0].item[1].item[0].linkId = "S_Q000980006_AS09800014"
* item[0].item[1].item[0].text = "尿液"
* item[0].item[1].item[0].type = #boolean
* item[0].item[1].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].item[1].linkId = "S_Q000980006_AS09800015"
* item[0].item[1].item[1].text = "尿道/子宮頸分泌物"
* item[0].item[1].item[1].type = #boolean
* item[0].item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].item[2].linkId = "S_098_00001"
* item[0].item[1].item[2].text = "陰道分泌物"
* item[0].item[1].item[2].type = #boolean
* item[0].item[1].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].item[3].linkId = "S_098_00002"
* item[0].item[1].item[3].text = "咽喉分泌物"
* item[0].item[1].item[3].type = #boolean
* item[0].item[1].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].item[4].linkId = "S_098_00003"
* item[0].item[1].item[4].text = "直腸分泌物"
* item[0].item[1].item[4].type = #boolean
* item[0].item[1].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].item[5].linkId = "S_098_00004"
* item[0].item[1].item[5].text = "結膜分泌物"
* item[0].item[1].item[5].type = #boolean
* item[0].item[1].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[1].item[6].linkId = "S_098_00005"
* item[0].item[1].item[6].text = "關節液"
* item[0].item[1].item[6].type = #boolean
* item[0].item[1].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].linkId = "S_098_00006"
* item[0].item[2].text = "檢驗單位"
* item[0].item[2].type = #string
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].extension[0].valueMarkdown = "答案值：代碼；備註：醫事機構代碼 (檢體請由淋病認可檢驗機構檢驗)"
* item[1].linkId = "section-2"
* item[1].text = "個案狀況維護與補充資料"
* item[1].type = #group
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "是否進行愛滋病毒篩檢(單選)"
* item[1].item[0].type = #group
* item[1].item[0].item[0].linkId = "S_Q000980010_AS09800017"
* item[1].item[0].item[0].text = "是"
* item[1].item[0].item[0].type = #boolean
* item[1].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選此項時，篩檢日期必填"
* item[1].item[0].item[1].linkId = "S_Q000980010_AS09800016"
* item[1].item[0].item[1].text = "否"
* item[1].item[0].item[1].type = #boolean
* item[1].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[1].linkId = "S_Q000980020_AS09800020"
* item[1].item[1].text = "篩檢日期"
* item[1].item[1].type = #date
* item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2021/01/01"
