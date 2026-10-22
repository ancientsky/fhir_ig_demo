Instance: nidrs-supplement-090
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-梅毒"
Description: "法定傳染病增補欄位-梅毒(090)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-090"
* version = "0.1.0"
* name = "NIDRSSupplement090"
* title = "法定傳染病增補欄位-梅毒"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-梅毒」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態 = 不可通報 If 勾選\"未曾接受梅毒治療或病史不清楚者\" then If (輸入(\"RPR\", \"VDRL\") and NOT 效價 = null and 效價值 = 2n) and (輸入(\"TPHA \", \" TPPA \") and NOT 效價 = null and 效價值 = 80*2n) or 勾選\"FTA-abs\" or 勾選\"TPLA(+)\" or 勾選\"EIA(+)\" or 勾選\"CIA(+)/CLIA(+)/CMIA(+)\") or 勾選\"ECLIA\" then 通報狀態 = 可通報 End If ElseIf count(勾選\"臨床檢體(病灶滲出液、組織等)以下列方法檢測出梅毒螺旋體\".選項) > 0 then 通報狀態 = 可通報 ElseIf \"CSF_VDRL(+)效價\" not null and 效價值 = 2n then 通報狀態 = 可通報 ElseIf count(勾選\"曾經接受梅毒治療者\".選項) > 0 then 通報狀態 = 可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#090 "梅毒"
* item[0].linkId = "section-1"
* item[0].text = "1、2、3、4必選一項(四擇一單選)"
* item[0].type = #group
* item[0].item[0].linkId = "S_ONEOFFOUR90_ONE"
* item[0].item[0].text = "1.未曾接受梅毒治療或病史不清楚者"
* item[0].item[0].type = #boolean
* item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者(1)~(2)皆為必填"
* item[0].item[1].linkId = "section-1.group-2"
* item[0].item[1].text = "(1) 血清學非特異性梅毒螺旋體試驗 (需填寫時，至少擇一填寫)"
* item[0].item[1].type = #group
* item[0].item[1].item[0].linkId = "S_QS09001030_AS09001030"
* item[0].item[1].item[0].text = "RPR(+)效價=1:"
* item[0].item[1].item[0].type = #integer
* item[0].item[1].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[0].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為2n"
* item[0].item[1].item[1].linkId = "S_QS09001040_AS09001040"
* item[0].item[1].item[1].text = "VDRL(+)效價=1:"
* item[0].item[1].item[1].type = #integer
* item[0].item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].item[1].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為2n"
* item[0].item[2].linkId = "section-1.group-3"
* item[0].item[2].text = "(2) 特異性梅毒螺旋體試驗 (需填寫時，至少擇一填寫)"
* item[0].item[2].type = #group
* item[0].item[2].item[0].linkId = "S_QS09001050_AS09001050"
* item[0].item[2].item[0].text = "TPHA效價=1:"
* item[0].item[2].item[0].type = #integer
* item[0].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[0].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為80*2n"
* item[0].item[2].item[1].linkId = "S_QS09001060_AS09001060"
* item[0].item[2].item[1].text = "TPPA效價=1:"
* item[0].item[2].item[1].type = #integer
* item[0].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[1].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為80*2n"
* item[0].item[2].item[2].linkId = "S_QS09001021_AS09001025"
* item[0].item[2].item[2].text = "TPLA(+)"
* item[0].item[2].item[2].type = #boolean
* item[0].item[2].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[3].linkId = "S_QS09001021_AS09001026"
* item[0].item[2].item[3].text = "EIA(+)"
* item[0].item[2].item[3].type = #boolean
* item[0].item[2].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[4].linkId = "S_QS09001021_AS09001027"
* item[0].item[2].item[4].text = "CIA(+)/CLIA(+) /CMIA(+)"
* item[0].item[2].item[4].type = #boolean
* item[0].item[2].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[5].linkId = "S_QS09001021_AS09001028"
* item[0].item[2].item[5].text = "FTA-abs(+)"
* item[0].item[2].item[5].type = #boolean
* item[0].item[2].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[6].linkId = "S_090_00002"
* item[0].item[2].item[6].text = "ECLIA"
* item[0].item[2].item[6].type = #boolean
* item[0].item[2].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[3].linkId = "S_ONEOFFOUR90_TWO"
* item[0].item[3].text = "2.臨床檢體（病灶滲出液、組織等）以下列方法檢測出梅毒螺旋體"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，請續填下方欄位"
* item[0].item[4].linkId = "section-1.group-5"
* item[0].item[4].text = "(可複選)"
* item[0].item[4].type = #group
* item[0].item[4].item[0].linkId = "S_QS09001010_AS09001011"
* item[0].item[4].item[0].text = "暗視野顯微鏡"
* item[0].item[4].item[0].type = #boolean
* item[0].item[4].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[4].item[1].linkId = "S_QS09001010_AS09001012"
* item[0].item[4].item[1].text = "螢光抗體檢驗"
* item[0].item[4].item[1].type = #boolean
* item[0].item[4].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[4].item[2].linkId = "S_QS09001010_AS09001013"
* item[0].item[4].item[2].text = "核酸檢驗"
* item[0].item[4].item[2].type = #boolean
* item[0].item[4].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[5].linkId = "S_ONEOFFOUR90_THREE"
* item[0].item[5].text = "3.腦脊髓液性病研究實驗室試驗"
* item[0].item[5].type = #boolean
* item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，請續填下方欄位"
* item[0].item[6].linkId = "S_QS09001070_AS09001070"
* item[0].item[6].text = "CSF-VDRL(+) 效價 =1:"
* item[0].item[6].type = #integer
* item[0].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].extension[0].valueMarkdown = "答案值：Number；備註：值必須為2n"
* item[0].item[7].linkId = "S_ONEOFFOUR90_FOUR"
* item[0].item[7].text = "4.曾經接受梅毒治療者"
* item[0].item[7].type = #boolean
* item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[7].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，請續填下方欄位"
* item[0].item[8].linkId = "section-1.group-9"
* item[0].item[8].text = "血清學非特異性梅毒螺旋體試驗: (可複選)"
* item[0].item[8].type = #group
* item[0].item[8].item[0].linkId = "S_QS09001080_AS09001081"
* item[0].item[8].item[0].text = "RPR效價≧4倍上升"
* item[0].item[8].item[0].type = #boolean
* item[0].item[8].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[8].item[1].linkId = "S_QS09001080_AS09001082"
* item[0].item[8].item[1].text = "VDRL效價≧4倍上升"
* item[0].item[8].item[1].type = #boolean
* item[0].item[8].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].linkId = "S_090_00001"
* item[0].item[9].text = "檢驗單位"
* item[0].item[9].type = #string
* item[0].item[9].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].extension[0].valueMarkdown = "答案值：代碼；備註：醫事機構代碼 (檢體請由梅毒認可檢驗機構檢驗)"
* item[1].linkId = "section-2"
* item[1].text = "個案狀況維護與補充資料"
* item[1].type = #group
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "是否進行愛滋病毒篩檢？(單選)"
* item[1].item[0].type = #group
* item[1].item[0].item[0].linkId = "S_QS09001090_AS09001091"
* item[1].item[0].item[0].text = "是"
* item[1].item[0].item[0].type = #boolean
* item[1].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選是時，篩檢日期必填"
* item[1].item[0].item[1].linkId = "S_QS09001090_AS09001092"
* item[1].item[0].item[1].text = "否"
* item[1].item[0].item[1].type = #boolean
* item[1].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選是時，篩檢日期必填"
* item[1].item[1].linkId = "S_QS09001100_AS09001100"
* item[1].item[1].text = "篩檢日期"
* item[1].item[1].type = #string
* item[1].item[1].maxLength = 10
* item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].extension[0].valueMarkdown = "答案值：String/10；備註：Ex:2021/01/01"
* item[1].item[2].linkId = "section-2.group-3"
* item[1].item[2].text = "個案是否懷孕？ (單選)"
* item[1].item[2].type = #group
* item[1].item[2].item[0].linkId = "S_QS09001110_AS09001111"
* item[1].item[2].item[0].text = "是"
* item[1].item[2].item[0].type = #boolean
* item[1].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：若通報個案為\"女性\"，此欄位必填 勾選是時，妊娠週數必填"
* item[1].item[2].item[1].linkId = "S_QS09001110_AS09001112"
* item[1].item[2].item[1].text = "否"
* item[1].item[2].item[1].type = #boolean
* item[1].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：若通報個案為\"女性\"，此欄位必填 勾選是時，妊娠週數必填"
* item[1].item[3].linkId = "S_QS09001120_AS09001120"
* item[1].item[3].text = "妊娠週數"
* item[1].item[3].type = #integer
* item[1].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].extension[0].valueMarkdown = "答案值：Number"
