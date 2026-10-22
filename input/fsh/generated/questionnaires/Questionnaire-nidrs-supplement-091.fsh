Instance: nidrs-supplement-091
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-先天性梅毒"
Description: "法定傳染病增補欄位-先天性梅毒(091)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-091"
* version = "0.1.0"
* name = "NIDRSSupplement091"
* title = "法定傳染病增補欄位-先天性梅毒"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-先天性梅毒」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態 = 不可通報 If (通報日期 - 出生日期).月 < 24 then If 勾選通報時檢驗資料\" 1.特異性梅毒螺旋體試驗\" then If (輸入(\"TPHA \", \" TPPA \") and NOT 效價 = null and 效價值 = 80*2n) or 勾選\"FTA-abs\" or 勾選\"TPLA(+)\" or 勾選\"EIA(+)\" or 勾選\"CIA(+)/CLIA(+)/CMIA(+)\" or 勾選\"ECLIA\" then 通報狀態 = 可通報 Else 通報狀態 = 不可通報 return End If End If If勾選通報時檢驗資料\" 2.非特異性梅毒螺旋體試驗\" then If輸入(\"RPR\", \"VDRL\") and NOT 效價 = null and 效價值 = 2n then 通報狀態 = 可通報 Else 通報狀態 = 不可通報 return End If End If If 勾選通報時檢驗資料\"3.臨床檢體（病灶滲出液、組織、胎盤、臍帶、屍體、鼻腔分泌物等）以下列方法檢測出梅毒螺旋體\" then 通報狀態 = 可通報 End If If勾選通報時檢驗資料\" 4.血清學特異性梅毒螺旋體 IgM 試驗\" then 通報狀態 = 可通報 End If If勾選通報時檢驗資料\" 5.腦脊髓液性病研究實驗室試驗\" then If輸入CSF-VDRL(+) and NOT 效價 = null and 效價值 = 2n then 通報狀態 = 可通報 Else 通報狀態 = 不可通報 return End If End If If 其生母為梅毒個案，但生產時尚未治療、治療狀況不明或已接受治療，但RPR/VDRL效價尚未呈現4倍以上下降勾選「否」或「不詳」 and count(勾選\"通報時檢驗資料\") > 1 then 通報狀態 = 可通報 Else 通報狀態 = 不可通報 return End If If 輸入個案生母資料(姓名與證號) then 通報狀態 = 可通報 Else 通報狀態 = 不可通報 return End If End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#091 "先天性梅毒"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "display-1"
* item[0].item[0].text = "檢驗條件 若個案生母資料之「其生母為梅毒個案，但生產時未治療、尚未完成治療、治療狀況不明或已接受治療， 但RPR/VDRL效價尚未呈現4倍以上下降」勾選否或不詳者，此題必填，可複選。 1~5 (可複選)"
* item[0].item[0].type = #display
* item[0].item[1].linkId = "S_ONEOFFIVE91_ONE"
* item[0].item[1].text = "1. 特異性梅毒螺旋體試驗"
* item[0].item[1].type = #boolean
* item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，請續填下方欄位"
* item[0].item[2].linkId = "section-1.group-3"
* item[0].item[2].text = "(需選擇時，可複選)"
* item[0].item[2].type = #group
* item[0].item[2].item[0].linkId = "S_QS09100060_AS09100060"
* item[0].item[2].item[0].text = "TPHA=1:"
* item[0].item[2].item[0].type = #integer
* item[0].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[0].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為80*2n"
* item[0].item[2].item[1].linkId = "S_QS09100070_AS09100070"
* item[0].item[2].item[1].text = "TPPA=1:"
* item[0].item[2].item[1].type = #integer
* item[0].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[1].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為80*2n"
* item[0].item[2].item[2].linkId = "S_QS09100050_AS09100056"
* item[0].item[2].item[2].text = "FTA-abs(+)"
* item[0].item[2].item[2].type = #boolean
* item[0].item[2].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[3].linkId = "S_QS09100050_AS09100053"
* item[0].item[2].item[3].text = "TPLA(+)"
* item[0].item[2].item[3].type = #boolean
* item[0].item[2].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[4].linkId = "S_QS09100050_AS09100054"
* item[0].item[2].item[4].text = "EIA(+)"
* item[0].item[2].item[4].type = #boolean
* item[0].item[2].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[5].linkId = "S_QS09100050_AS09100055"
* item[0].item[2].item[5].text = "CIA(+)/CLIA(+)/CMIA(+)"
* item[0].item[2].item[5].type = #boolean
* item[0].item[2].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[2].item[6].linkId = "S_091_00002"
* item[0].item[2].item[6].text = "ECLIA"
* item[0].item[2].item[6].type = #boolean
* item[0].item[2].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[2].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[3].linkId = "S_ONEOFFIVE91_TWO"
* item[0].item[3].text = "2. 非特異性梅毒螺旋體試驗"
* item[0].item[3].type = #boolean
* item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，請續填下方欄位"
* item[0].item[4].linkId = "S_QS09100090_AS09100090"
* item[0].item[4].text = "RPR(+)效價=1:"
* item[0].item[4].type = #integer
* item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[4].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為2n"
* item[0].item[5].linkId = "S_QS09100100_AS09100100"
* item[0].item[5].text = "VDRL(+)效價=1:"
* item[0].item[5].type = #integer
* item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[5].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為2n"
* item[0].item[6].linkId = "S_ONEOFFIVE91_THREE"
* item[0].item[6].text = "3. 臨床檢體（病灶滲出液、組織、胎盤、臍帶、屍體、鼻腔分泌物等）以下列方法檢測出梅毒螺旋體"
* item[0].item[6].type = #boolean
* item[0].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[6].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，請續填下方欄位"
* item[0].item[7].linkId = "section-1.group-8"
* item[0].item[7].text = "(需選擇時，可複選)"
* item[0].item[7].type = #group
* item[0].item[7].item[0].linkId = "S_QS09100030_AS09100031"
* item[0].item[7].item[0].text = "暗視野顯微鏡"
* item[0].item[7].item[0].type = #boolean
* item[0].item[7].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[7].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[7].item[1].linkId = "S_QS09100030_AS09100032"
* item[0].item[7].item[1].text = "螢光抗體檢驗"
* item[0].item[7].item[1].type = #boolean
* item[0].item[7].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[7].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[7].item[2].linkId = "S_QS09100030_AS09100033"
* item[0].item[7].item[2].text = "核酸檢驗"
* item[0].item[7].item[2].type = #boolean
* item[0].item[7].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[7].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[8].linkId = "S_ONEOFFIVE91_FOUR"
* item[0].item[8].text = "4. 血清學特異性梅毒螺旋體 IgM 試驗"
* item[0].item[8].type = #boolean
* item[0].item[8].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[8].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，請續填下方欄位"
* item[0].item[9].linkId = "section-1.group-10"
* item[0].item[9].text = "(需選擇時，可複選)"
* item[0].item[9].type = #group
* item[0].item[9].item[0].linkId = "S_QS09100040_AS09100041"
* item[0].item[9].item[0].text = "IgM EIA(+)"
* item[0].item[9].item[0].type = #boolean
* item[0].item[9].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[9].item[1].linkId = "S_QS09100040_AS09100042"
* item[0].item[9].item[1].text = "IgM FTA-abs(+)"
* item[0].item[9].item[1].type = #boolean
* item[0].item[9].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[9].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[10].linkId = "S_ONEOFFIVE91_FIVE"
* item[0].item[10].text = "5. 腦脊髓液性病研究實驗室試驗"
* item[0].item[10].type = #boolean
* item[0].item[10].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[10].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選時，請續填下方欄位"
* item[0].item[11].linkId = "S_QS09100110_AS09100110"
* item[0].item[11].text = "CSF-VDRL(+)效價=1:"
* item[0].item[11].type = #integer
* item[0].item[11].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[11].extension[0].valueMarkdown = "答案值：Number；備註：若輸入，值必須為2n"
* item[0].item[12].linkId = "section-1.group-13"
* item[0].item[12].text = "個案腦脊髓液細胞計數和生化檢查異常情形(單選)"
* item[0].item[12].type = #group
* item[0].item[12].item[0].linkId = "S_QS09100150_AS09100151"
* item[0].item[12].item[0].text = "年齡未滿1個月： >15 WBC/microL, protein > 120 mg/dL"
* item[0].item[12].item[0].type = #boolean
* item[0].item[12].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[12].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[12].item[1].linkId = "S_QS09100150_AS09100152"
* item[0].item[12].item[1].text = "年齡1個月以上： >5 WBC/microL, protein > 40 mg/dL"
* item[0].item[12].item[1].type = #boolean
* item[0].item[12].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[12].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[12].item[2].linkId = "S_QS09100150_AS09100153"
* item[0].item[12].item[2].text = "皆不符合"
* item[0].item[12].item[2].type = #boolean
* item[0].item[12].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[12].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[13].linkId = "S_091_00001"
* item[0].item[13].text = "檢驗單位"
* item[0].item[13].type = #string
* item[0].item[13].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[13].extension[0].valueMarkdown = "答案值：代碼；備註：醫事機構代碼 (檢體請由先天性梅毒認可檢驗機構檢驗)"
* item[1].linkId = "section-2"
* item[1].text = "個案生母資料"
* item[1].type = #group
* item[1].item[0].linkId = "S_QS09100120_AS09100120"
* item[1].item[0].text = "生母姓名 (必填欄位)"
* item[1].item[0].type = #string
* item[1].item[0].maxLength = 200
* item[1].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].extension[0].valueMarkdown = "答案值：String/200；備註：本欄位資料會回填共同欄位"
* item[1].item[1].linkId = "S_QS09100130_AS09100130"
* item[1].item[1].text = "生母身份證統一編號/外來人口之居留證統一證號 (必填欄位)"
* item[1].item[1].type = #string
* item[1].item[1].maxLength = 200
* item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].extension[0].valueMarkdown = "答案值：String/200；備註：本欄位資料會回填共同欄位"
* item[1].item[2].linkId = "section-2.group-3"
* item[1].item[2].text = "其生母為梅毒個案，但生產時尚未治療、治療狀況不明或已接受治療，但RPR/VDRL效價尚未呈現4倍以上下降(單選)"
* item[1].item[2].type = #group
* item[1].item[2].item[0].linkId = "S_QS09100010_AS09100011"
* item[1].item[2].item[0].text = "是"
* item[1].item[2].item[0].type = #boolean
* item[1].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[0].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選「否」或「不詳」者，通報時檢驗資料： 1、2、3、4、5至少勾選一項，可複選"
* item[1].item[2].item[1].linkId = "S_QS09100010_AS09100012"
* item[1].item[2].item[1].text = "否"
* item[1].item[2].item[1].type = #boolean
* item[1].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選「否」或「不詳」者，通報時檢驗資料： 1、2、3、4、5至少勾選一項，可複選"
* item[1].item[2].item[2].linkId = "S_QS09100010_AS09100013"
* item[1].item[2].item[2].text = "不詳"
* item[1].item[2].item[2].type = #boolean
* item[1].item[2].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[2].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選「否」或「不詳」者，通報時檢驗資料： 1、2、3、4、5至少勾選一項，可複選"
* item[1].item[3].linkId = "section-2.group-4"
* item[1].item[3].text = "其生母之梅毒病史不清楚(單選)"
* item[1].item[3].type = #group
* item[1].item[3].item[0].linkId = "S_QS09100020_AS09100021"
* item[1].item[3].item[0].text = "是"
* item[1].item[3].item[0].type = #boolean
* item[1].item[3].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[3].item[1].linkId = "S_QS09100020_AS09100022"
* item[1].item[3].item[1].text = "否"
* item[1].item[3].item[1].type = #boolean
* item[1].item[3].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[3].item[2].linkId = "S_QS09100020_AS09100023"
* item[1].item[3].item[2].text = "不詳"
* item[1].item[3].item[2].type = #boolean
* item[1].item[3].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[4].linkId = "section-2.group-5"
* item[1].item[4].text = "個案血清學非特異性梅毒螺旋體試驗(RPR或VDRL)，效價是否大於母親生產時效價之四倍以上(單選)"
* item[1].item[4].type = #group
* item[1].item[4].item[0].linkId = "S_QS09100140_AS09100141"
* item[1].item[4].item[0].text = "是"
* item[1].item[4].item[0].type = #boolean
* item[1].item[4].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[4].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[4].item[1].linkId = "S_QS09100140_AS09100142"
* item[1].item[4].item[1].text = "否"
* item[1].item[4].item[1].type = #boolean
* item[1].item[4].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[4].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[4].item[2].linkId = "S_QS09100140_AS09100143"
* item[1].item[4].item[2].text = "不詳"
* item[1].item[4].item[2].type = #boolean
* item[1].item[4].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[4].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
