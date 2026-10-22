CodeSystem: CDCAIDSClinicalSymptom
Id: cdc-aids-clinical-symptom
Title: "CDC-NIDRS-AIDS臨床症狀代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「AIDS臨床症狀代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* ^property[0].code = #applicable
* ^property[0].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-aids-clinical-symptom#applicable"
* ^property[0].description = "適用年齡限制"
* ^property[0].type = #string
* #1 "念珠菌症(支氣管、氣管、或肺)"
* #2 "淋巴瘤(免疫芽細胞)"
* #3 "念珠菌症(食道)"
* #4 "淋巴瘤(腦部之初發性)"
* #5 "珠狀孢子蟲病（散佈性或肺外部位）"
* #6 "散佈性或肺外部位禽型分枝桿菌群或堪薩斯分枝桿菌感染"
* #7 "隱球菌症（肺外）"
* #8 "肺結核"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "僅適用於年齡滿6歲（含）以上個案。(Only among adults, adolescents, and children aged ≥ 6 years.)\""
* #9 "隱孢子蟲症(慢性腸炎)(一個月以上)"
* #10 "肺外結核"
* #11 "巨細胞病毒症（肝臟、脾臟或淋巴結以外）"
* #12 "其他種類或未確定種類的分枝桿菌引起的散佈性或肺外部位感染"
* #13 "巨細胞病毒性視網膜炎"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "僅適用於年齡滿 1 個月後診斷之個案。(Onset at age ≥ 1 month.)"
* #15 "愛滋病毒性腦病變"
* #16 "肺囊蟲肺炎"
* #17 "單純性庖疹病毒感染：慢性潰瘍（一個月以上）或支氣管炎、肺炎及食道炎"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "僅適用於年齡滿 1 個月後診斷之個案。(Onset at age ≥ 1 month.)"
* #18 "進行性多發性白質腦病變"
* #20 "沙門氏菌血症(再發性)"
* #21 "組織胞漿菌症(散佈性或肺以外部位)"
* #22 "腦部弓蟲症"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "僅適用於年齡滿 1 個月後診斷之個案。(Onset at age ≥ 1 month.)"
* #23 "等孢子蟲症（慢性腸炎）（一個月以上）"
* #24 "HIV引起的消耗性症候群"
* #25 "卡波西氏肉瘤"
* #26 "侵犯性的子宮頸癌"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "僅適用於年齡滿6歲（含）以上個案。(Only among adults, adolescents, and children aged ≥ 6 years.)\""
* #27 "勃克氏淋巴瘤"
* #28 "一年之內復發的肺炎"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "僅適用於年齡滿6歲（含）以上個案。(Only among adults, adolescents, and children aged ≥ 6 years.)\""
* #29 "青黴菌感染（散佈性或肺外部位）"
* #30 "多重或復發的細菌感染*"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "僅適用於年齡 6 歲以下個案。(Only among children aged < 6 years.)"

ValueSet: CDCAIDSClinicalSymptom
Id: cdc-aids-clinical-symptom
Title: "CDC-NIDRS-AIDS臨床症狀代碼值集"
Description: "CDC-NIDRS-AIDS臨床症狀代碼值集，包含代碼系統 CDCAIDSClinicalSymptom 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCAIDSClinicalSymptom
