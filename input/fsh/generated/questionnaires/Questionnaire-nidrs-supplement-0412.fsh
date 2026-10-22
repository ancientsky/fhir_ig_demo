Instance: nidrs-supplement-0412
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-侵襲性肺炎鏈球菌感染症"
Description: "法定傳染病增補欄位-侵襲性肺炎鏈球菌感染症(0412)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-0412"
* version = "0.1.0"
* name = "NIDRSSupplement0412"
* title = "法定傳染病增補欄位-侵襲性肺炎鏈球菌感染症"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第四類法定傳染病「法定傳染病增補欄位-侵襲性肺炎鏈球菌感染症」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If count(勾選\"醫院自行檢驗結果\".選項）> 0 then If勾選\"個案是否具有潛在疾病\".是 then If勾選\" 1. 免疫健全者\" and count(勾選\"1. 免疫健全者\".選項) > 0 then 通報狀態＝可通報 Else 通報狀態＝不可通報 Return EndIf If勾選\" 2. 脾臟功能缺損\" and Count(勾選\"2. 脾臟功能缺損\".選項) > 0 then 通報狀態＝可通報 Else 通報狀態＝不可通報 Return EndIf If勾選\" 3. 免疫功能缺損者\" and count(勾選\"3. 免疫功能缺損者\".選項) > 0 then 通報狀態＝可通報 Else 通報狀態＝不可通報 Return EndIf If勾選\" 4. 其他重大疾病\" and 輸入(4. 其他重大疾病.說明) then 通報狀態＝可通報 Else 通報狀態＝不可通報 Return EndIf ElseIf勾選\"個案是否具有潛在疾病\".否 then 通報狀態＝可通報 End If End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#0412 "侵襲性肺炎鏈球菌感染症"
* item[0].linkId = "section-1"
* item[0].text = "通報時檢驗資料"
* item[0].type = #group
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "醫院自行檢驗結果：自下列何種採檢部位培養出肺炎鏈球菌(Streptococcus pneumoniae) (必填欄位) (可複選)"
* item[0].item[0].type = #group
* item[0].item[0].item[0].linkId = "S_Q004120002_A004120010"
* item[0].item[0].item[0].text = "血液"
* item[0].item[0].item[0].type = #boolean
* item[0].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[1].linkId = "S_Q004120002_A004120011"
* item[0].item[0].item[1].text = "肋膜液"
* item[0].item[0].item[1].type = #boolean
* item[0].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[2].linkId = "S_Q004120002_A004120012"
* item[0].item[0].item[2].text = "腦脊髓液"
* item[0].item[0].item[2].type = #boolean
* item[0].item[0].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[3].linkId = "S_Q004120002_A004120013"
* item[0].item[0].item[3].text = "關節液"
* item[0].item[0].item[3].type = #boolean
* item[0].item[0].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[4].linkId = "S_Q004120002_A004120014"
* item[0].item[0].item[4].text = "骨髓"
* item[0].item[0].item[4].type = #boolean
* item[0].item[0].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[5].linkId = "S_Q004120002_A004120015"
* item[0].item[0].item[5].text = "心包膜"
* item[0].item[0].item[5].type = #boolean
* item[0].item[0].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[6].linkId = "S_Q004120002_A004120016"
* item[0].item[0].item[6].text = "腹膜液"
* item[0].item[0].item[6].type = #boolean
* item[0].item[0].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[0].item[0].item[7].linkId = "S_Q004120002_A004120017"
* item[0].item[0].item[7].text = "其他正常無菌組織"
* item[0].item[0].item[7].type = #boolean
* item[0].item[0].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[7].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選此項者，其他正常無菌組織輸入內容必填"
* item[0].item[0].item[8].linkId = "S_Q004120012_A004120027"
* item[0].item[0].item[8].text = "(其他正常無菌組織輸入內容)"
* item[0].item[0].item[8].type = #string
* item[0].item[0].item[8].maxLength = 200
* item[0].item[0].item[8].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[8].extension[0].valueMarkdown = "答案值：String/200"
* item[0].item[0].item[9].linkId = "S_Q004120004_A000000064"
* item[0].item[0].item[9].text = "採檢日期 (必填欄位)"
* item[0].item[0].item[9].type = #date
* item[0].item[0].item[9].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[9].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2021/01/01"
* item[0].item[0].item[10].linkId = "S_Q004120005_A000000064"
* item[0].item[0].item[10].text = "檢驗結果報告日期 (必填欄位)"
* item[0].item[0].item[10].type = #date
* item[0].item[0].item[10].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[0].item[0].item[10].extension[0].valueMarkdown = "答案值：String/10；備註：Ex.2021/01/01"
* item[1].linkId = "section-2"
* item[1].text = "流行病學資料"
* item[1].type = #group
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "個案是否具有潛在疾病(單選) (必填欄位)"
* item[1].item[0].type = #group
* item[1].item[0].item[0].linkId = "S_Q004120009_A000007148"
* item[1].item[0].item[0].text = "否"
* item[1].item[0].item[0].type = #boolean
* item[1].item[0].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[1].linkId = "S_Q004120009_A004120028"
* item[1].item[0].item[1].text = "是，請勾選下列疾病：（可複選）"
* item[1].item[0].item[1].type = #boolean
* item[1].item[0].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[0].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[0].item[2].linkId = "display-1"
* item[1].item[0].item[2].text = "勾選\"是\"者1.免疫健全者、2.脾臟功能缺損、3.免疫功能缺損者、4.其他重大疾病，選項至少勾選一項，可複選"
* item[1].item[0].item[2].type = #display
* item[1].item[1].linkId = "S_Q004120101_A004120101"
* item[1].item[1].text = "1.免疫健全者(Immunocompetent persons)"
* item[1].item[1].type = #boolean
* item[1].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[1].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選此項者，下列(1)~(8)至少應勾選一項"
* item[1].item[2].linkId = "section-2.group-3"
* item[1].item[2].text = "(需填寫時，可複選)"
* item[1].item[2].type = #group
* item[1].item[2].item[0].linkId = "S_Q004120110_A004120110"
* item[1].item[2].item[0].text = "(1)慢性心臟疾病(Chronic heart disease)：含先天發紺性心臟病及心臟衰竭，但高血壓除外"
* item[1].item[2].item[0].type = #boolean
* item[1].item[2].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[1].linkId = "S_Q004120111_A004120111"
* item[1].item[2].item[1].text = "(2)慢性肺臟病(Chronic lung disease，但氣喘除外)"
* item[1].item[2].item[1].type = #boolean
* item[1].item[2].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[2].linkId = "S_Q004120112_A004120112"
* item[1].item[2].item[2].text = "(3)糖尿病(Diabetes mellitus)"
* item[1].item[2].item[2].type = #boolean
* item[1].item[2].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[3].linkId = "S_Q004120113_A004120113"
* item[1].item[2].item[3].text = "(4)腦脊髓液滲漏(Cerebrospinal fluid leaks)"
* item[1].item[2].item[3].type = #boolean
* item[1].item[2].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[4].linkId = "S_Q004120114_A004120114"
* item[1].item[2].item[4].text = "(5)人工耳植入者(Cochlear implant)"
* item[1].item[2].item[4].type = #boolean
* item[1].item[2].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[5].linkId = "S_Q004120115_A004120115"
* item[1].item[2].item[5].text = "(6)酗酒(Alcoholism)"
* item[1].item[2].item[5].type = #boolean
* item[1].item[2].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[6].linkId = "S_Q004120116_A004120116"
* item[1].item[2].item[6].text = "(7)慢性肝病，包含肝硬化(Chronic liver disease, including cirrhosis)"
* item[1].item[2].item[6].type = #boolean
* item[1].item[2].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[2].item[7].linkId = "S_Q004120117_A004120117"
* item[1].item[2].item[7].text = "(8)抽煙(Cigarette smoking)"
* item[1].item[2].item[7].type = #boolean
* item[1].item[2].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[2].item[7].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[3].linkId = "S_Q004120102_A004120102"
* item[1].item[3].text = "2.脾臟功能缺損(Persons with functional or anatomic asplenia)"
* item[1].item[3].type = #boolean
* item[1].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[3].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選此項者，下列(1)~(2)至少應勾選一項"
* item[1].item[4].linkId = "section-2.group-5"
* item[1].item[4].text = "(需填寫時，可複選)"
* item[1].item[4].type = #group
* item[1].item[4].item[0].linkId = "S_Q004120120_A004120120"
* item[1].item[4].item[0].text = "(1)先天性或後天性無脾，脾功能失調，或脾切除(Congenital or acquired asplenia, splenic dysfunction, or splenectomy)"
* item[1].item[4].item[0].type = #boolean
* item[1].item[4].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[4].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[4].item[1].linkId = "S_Q004120121_A004120121"
* item[1].item[4].item[1].text = "(2)鐮刀型紅血球疾病及血紅素病(Sickle cell disease and other hemoglobinopathies)"
* item[1].item[4].item[1].type = #boolean
* item[1].item[4].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[4].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[5].linkId = "S_Q004120103_A004120103"
* item[1].item[5].text = "3.免疫功能缺損者(Immunocompromised persons)"
* item[1].item[5].type = #boolean
* item[1].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[5].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選此項者，下列(1)~(10)至少應勾選一項"
* item[1].item[6].linkId = "section-2.group-7"
* item[1].item[6].text = "(需填寫時，可複選)"
* item[1].item[6].type = #group
* item[1].item[6].item[0].linkId = "S_Q004120130_A004120130"
* item[1].item[6].item[0].text = "(1)先天性免疫功能不全(Congenital immunodeficiencies)"
* item[1].item[6].item[0].type = #boolean
* item[1].item[6].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[0].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[1].linkId = "S_Q004120131_A004120131"
* item[1].item[6].item[1].text = "(2)後天性免疫功能不全及HIV感染(Acquired immunodeficiencies and HIV infection)"
* item[1].item[6].item[1].type = #boolean
* item[1].item[6].item[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[1].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[2].linkId = "S_Q004120132_A004120132"
* item[1].item[6].item[2].text = "(3)慢性腎病變（包含腎病症候群）(Chronic renal failure, including nephrotic syndrome)"
* item[1].item[6].item[2].type = #boolean
* item[1].item[6].item[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[2].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[3].linkId = "S_Q004120133_A004120133"
* item[1].item[6].item[3].text = "(4)白血病(Leukemias)"
* item[1].item[6].item[3].type = #boolean
* item[1].item[6].item[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[3].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[4].linkId = "S_Q004120134_A004120134"
* item[1].item[6].item[4].text = "(5)淋巴瘤(Lymphomas)"
* item[1].item[6].item[4].type = #boolean
* item[1].item[6].item[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[4].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[5].linkId = "S_Q004120135_A004120135"
* item[1].item[6].item[5].text = "(6)霍奇金病(Hodgkin disease)"
* item[1].item[6].item[5].type = #boolean
* item[1].item[6].item[5].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[5].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[6].linkId = "S_Q004120136_A004120136"
* item[1].item[6].item[6].text = "(7)廣泛惡性腫瘤(Generalized malignancy)"
* item[1].item[6].item[6].type = #boolean
* item[1].item[6].item[6].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[6].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[7].linkId = "S_Q004120137_A004120137"
* item[1].item[6].item[7].text = "(8)使用免疫抑製藥物治療的疾病(含長期全身性皮質類固醇或放射治療)"
* item[1].item[6].item[7].type = #boolean
* item[1].item[6].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[7].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[8].linkId = "S_Q004120138_A004120138"
* item[1].item[6].item[8].text = "(9)器官移植(Solid organ transplantation)"
* item[1].item[6].item[8].type = #boolean
* item[1].item[6].item[8].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[8].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[6].item[9].linkId = "S_Q004120139_A004120139"
* item[1].item[6].item[9].text = "(10)多發性骨髓瘤(Multiple myeloma)"
* item[1].item[6].item[9].type = #boolean
* item[1].item[6].item[9].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[6].item[9].extension[0].valueMarkdown = "答案值：1=勾選"
* item[1].item[7].linkId = "S_Q004120040_A004120022"
* item[1].item[7].text = "4.其他重大疾病"
* item[1].item[7].type = #boolean
* item[1].item[7].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[7].extension[0].valueMarkdown = "答案值：1=勾選；備註：勾選者，下方欄位必填"
* item[1].item[8].linkId = "S_Q004120014_A004120027"
* item[1].item[8].text = "(輸入內容)"
* item[1].item[8].type = #string
* item[1].item[8].maxLength = 200
* item[1].item[8].extension[0].url = "http://hl7.org/fhir/StructureDefinition/designNote"
* item[1].item[8].extension[0].valueMarkdown = "答案值：String/200；備註：請描述"
