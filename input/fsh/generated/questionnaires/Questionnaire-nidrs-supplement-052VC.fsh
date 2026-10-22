Instance: nidrs-supplement-052VC
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-水痘併發症"
Description: "法定傳染病增補欄位-水痘併發症(052VC)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-052VC"
* version = "0.1.0"
* name = "NIDRSSupplement052Vc"
* title = "法定傳染病增補欄位-水痘併發症"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第四類法定傳染病「法定傳染病增補欄位-水痘併發症」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If 勾選\"主要症狀. 急性發作，出現符合水痘表現之皮疹\" then If 勾選\"是否為先天性水痘症候群(Congential Varicella Syndrome)通報\".否 then 通報狀態＝可通報 ElseIf勾選\"是否為先天性水痘症候群(Congential Varicella Syndrome)通報\".是 then If count(勾選\"病人(新生兒)，請確認是否有下列危險因子\".選項) > 0 then 通報狀態＝可通報 End If End If If 勾選\"死亡\"或\"一般病房、加護病房、隔離病房\" and count(高危險群組) = 0 then 通報狀態＝不可通報 End If End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#052VC "水痘併發症"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "醫院實驗室自行診斷依據 (可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_QS052VC010_AS052VC015"
* item[0].item[0].item[0].text = "血清 VZV IgM陽性"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_QS052VC010_AS052VC016"
* item[0].item[0].item[1].text = "血清 VZV IgG於急性期與恢復期，抗體顯著上升"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_QS052VC010_AS052VC017"
* item[0].item[0].item[2].text = "臨床檢體PCR陽性"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，檢體來源必填"
* item[0].item[0].item[3].linkId = "S_QS052VC013_AS052VC020"
* item[0].item[0].item[3].text = "檢體來源："
* item[0].item[0].item[3].type = #string
* item[0].item[0].item[3].maxLength = 200
* item[0].item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[3].extension[0].valueMarkdown = "答案值：String/200"
* item[1].linkId = "section-2"
* item[1].text = "流行病學資料"
* item[1].type = #group
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "個案如為住院或死亡，請確認是否為以下高危險族群? (個案如為住院或死亡時，高危險族群必填其一。) (可複選)"
* item[1].item[0].type = #group
* item[1].item[0].item[0].linkId = "S_QS052VC005_AS052VC008"
* item[1].item[0].item[0].text = "孕婦"
* item[1].item[0].item[0].type = #boolean
* item[1].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[1].linkId = "S_QS052VC005_AS052VC009"
* item[1].item[0].item[1].text = "小於1歲之嬰兒"
* item[1].item[0].item[1].type = #boolean
* item[1].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[2].linkId = "S_QS052VC005_AS052VC027"
* item[1].item[0].item[2].text = "成人"
* item[1].item[0].item[2].type = #boolean
* item[1].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[3].linkId = "S_QS052VC005_AS052VC010"
* item[1].item[0].item[3].text = "免疫缺陷或低下者，病名"
* item[1].item[0].item[3].type = #boolean
* item[1].item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選此項者，病名必填"
* item[1].item[0].item[4].linkId = "S_QS052VC008_AS052VC013"
* item[1].item[0].item[4].text = "(病名)"
* item[1].item[0].item[4].type = #string
* item[1].item[0].item[4].maxLength = 200
* item[1].item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[4].extension[0].valueMarkdown = "答案值：String/200"
* item[1].item[0].item[5].linkId = "S_QS052VC006_AS052VC011"
* item[1].item[0].item[5].text = "其他"
* item[1].item[0].item[5].type = #boolean
* item[1].item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，其他輸入內容必填"
* item[1].item[0].item[6].linkId = "S_QS052VC009_AS052VC014"
* item[1].item[0].item[6].text = "(其他輸入內容)"
* item[1].item[0].item[6].type = #string
* item[1].item[0].item[6].maxLength = 200
* item[1].item[0].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[6].extension[0].valueMarkdown = "答案值：String/200"
* item[1].item[0].item[7].linkId = "S_QS052VC020_AS052VC028"
* item[1].item[0].item[7].text = "並非高危險族群"
* item[1].item[0].item[7].type = #boolean
* item[1].item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[7].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[1].linkId = "section-2.group-2"
* item[1].item[1].text = "是否為先天性水痘症候群(Congential Varicella Syndrome)通報 (必填欄位) (單選)"
* item[1].item[1].type = #group
* item[1].item[1].item[0].linkId = "S_QS052VC001_A000007147"
* item[1].item[1].item[0].text = "是"
* item[1].item[1].item[0].type = #boolean
* item[1].item[1].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選是者，病人(新生兒)，請確認是否有下列危險因子必選。"
* item[1].item[1].item[1].linkId = "S_QS052VC001_A000007148"
* item[1].item[1].item[1].text = "否"
* item[1].item[1].item[1].type = #boolean
* item[1].item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選是者，病人(新生兒)，請確認是否有下列危險因子必選。"
* item[1].item[2].linkId = "section-2.group-3"
* item[1].item[2].text = "病人(新生兒)，請確認是否有下列危險因子。 (需填寫時，可複選)"
* item[1].item[2].type = #group
* item[1].item[2].item[0].linkId = "S_QS052VC003_AS052VC003"
* item[1].item[2].item[0].text = "母親於孕期曾感染水痘"
* item[1].item[2].item[0].type = #boolean
* item[1].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[1].linkId = "S_QS052VC003_AS052VC004"
* item[1].item[2].item[1].text = "母親於孕期曾接觸水痘患者"
* item[1].item[2].item[1].type = #boolean
* item[1].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[2].linkId = "S_QS052VC003_AS052VC005"
* item[1].item[2].item[2].text = "出生缺陷或其他懷疑原因"
* item[1].item[2].item[2].type = #boolean
* item[1].item[2].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[2].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，其他懷疑原因必填"
* item[1].item[2].item[3].linkId = "S_QS052VC007_AS052VC012"
* item[1].item[2].item[3].text = "(其他懷疑原因)"
* item[1].item[2].item[3].type = #string
* item[1].item[2].item[3].maxLength = 200
* item[1].item[2].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[3].extension[0].valueMarkdown = "答案值：String/200"
* item[1].item[2].item[4].linkId = "S_QS052VC019_AS052VC026"
* item[1].item[2].item[4].text = "無上述危險因子"
* item[1].item[2].item[4].type = #boolean
* item[1].item[2].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
