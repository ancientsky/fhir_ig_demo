Instance: nidrs-supplement-0749
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-腸病毒感染併發重症"
Description: "法定傳染病增補欄位-腸病毒感染併發重症(0749)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-0749"
* version = "0.1.0"
* name = "NIDRSSupplement0749"
* title = "法定傳染病增補欄位-腸病毒感染併發重症"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-腸病毒感染併發重症」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If 個案15歲以下 and 勾選\"主要症狀\".急性無力肢體麻痺症狀 then If 同時通報\"急性無力肢體麻痺\" or曾經通報\"急性無力肢體麻痺\" then 通報狀態＝可通報 Else ErrorMessage \"依據「急性無力肢體麻痺」通報定義，15歲以下孩童出現急性無力肢體麻痺現象時應通報，請協助同時通報「急性無力肢體麻痺」。\" End If End If If count(勾選\"疑似腸病毒感染併發重症通報條件\".選項) > 0 then 通報狀態＝可通報 Else 通報狀態＝不可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#0749 "腸病毒感染併發重症"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀"
* item[0].type = #group
* item[0].item[0].linkId = "display-1"
* item[0].item[0].text = "疑似腸病毒感染併發重症通報條件 (必填欄位) (1~3，可複選)"
* item[0].item[0].type = #display
* item[0].item[1].linkId = "S_0749_00001"
* item[0].item[1].text = "1.出現典型的手足口病或疱疹性咽峽炎，同時有肌躍型抽搐(myoclonic jerks)之症狀，或併發腦炎、急性肢體麻痺症候群、急性肝炎、心肌炎、急性心肌病變、心肺衰竭等嚴重病例。"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].linkId = "S_0749_00002"
* item[0].item[2].text = "2.無手足口病或疱疹性咽峽炎，但出現呼吸道感染症狀，伴有腦幹腦炎或急性無力脊髓炎，懷疑為腸病毒感染導致者。"
* item[0].item[2].type = #boolean
* item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[3].linkId = "S_0749_00003"
* item[0].item[3].text = "3.出生三個月內嬰兒，出現心肌炎、肝炎、腦炎、血小板下降、多發性器官衰竭等敗血症徵候，並排除細菌等其他常見病原感染者。"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].linkId = "section-2"
* item[1].text = "個案狀況維護與補充資料"
* item[1].type = #group
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "癒後(單選)"
* item[1].item[0].type = #group
* item[1].item[0].item[0].linkId = "S_Q007490005_A000000067"
* item[1].item[0].item[0].text = "住院中"
* item[1].item[0].item[0].type = #boolean
* item[1].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[1].linkId = "S_Q007490005_A000000068"
* item[1].item[0].item[1].text = "出院"
* item[1].item[0].item[1].type = #boolean
* item[1].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[2].linkId = "S_Q007490005_A000000069"
* item[1].item[0].item[2].text = "死亡"
* item[1].item[0].item[2].type = #boolean
* item[1].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選；備註：如有勾選『死亡』，則死亡日期必填"
* item[1].item[1].linkId = "S_Q007490006_A000000070"
* item[1].item[1].text = "死亡日期"
* item[1].item[1].type = #string
* item[1].item[1].maxLength = 10
* item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].extension[0].valueMarkdown = "答案值：String/10；備註：Ex:2021/01/01"
