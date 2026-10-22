// 表16 Report_Common：通報單共同欄位(Report_Common)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: ReportCommonModel
Id: ReportCommonModel
Title: "通報單共同欄位(Report_Common)之資料模型"
Description: "NIDRS 電子病歷傳染病自動通報作業 2.0 表16 通報單共同欄位(Report_Common)之資料模型，用於 EMRMsg01 與 EMRMsg02 之 REPORT.REPORT。"
* ^version = "0.1.0"
* ^status = #draft
* REPORT 0..1 string "通報單號" "通報單號；修改通報單時此欄位必填。原規格資料型態：String/13。"
* REPORT ^maxLength = 13
* REPORT ^example.label = "範例"
* REPORT ^example.valueString = "1140300012345"
* HOSPITAL 1..1 string "通報單位醫事機構代碼" "通報單位醫事機構代碼。原規格資料型態：String/11。"
* HOSPITAL ^maxLength = 11
* HOSPITAL ^example.label = "範例"
* HOSPITAL ^example.valueString = "0101090517"
* HOSPITAL_NAME 1..1 string "通報單位名稱" "通報單位名稱。原規格資料型態：String/100。"
* HOSPITAL_NAME ^maxLength = 100
* HOSPITAL_NAME ^example.label = "範例"
* HOSPITAL_NAME ^example.valueString = "衛生福利部臺北醫院"
* HOSPITAL_ADDRESS 1..1 string "通報單位地址" "通報單位地址。原規格資料型態：String/100。"
* HOSPITAL_ADDRESS ^maxLength = 100
* HOSPITAL_ADDRESS ^example.label = "範例"
* HOSPITAL_ADDRESS ^example.valueString = "新北市新莊區思源路127號"
* REPORTER_NAME 1..1 string "通報單登錄者姓名" "通報單登錄者姓名。原規格資料型態：String/30。"
* REPORTER_NAME ^maxLength = 30
* REPORTER_NAME ^example.label = "範例"
* REPORTER_NAME ^example.valueString = "王小明"
* HOSPITAL_CONTACT 1..1 string "通報者聯絡電話" "通報者聯絡電話。原規格資料型態：String/100。"
* HOSPITAL_CONTACT ^maxLength = 100
* HOSPITAL_CONTACT ^example.label = "範例"
* HOSPITAL_CONTACT ^example.valueString = "02-22765566#1234"
* DIAGNOSTICIAN 1..1 string "診斷醫師" "診斷醫師。原規格資料型態：String/20。"
* DIAGNOSTICIAN ^maxLength = 20
* DIAGNOSTICIAN ^example.label = "範例"
* DIAGNOSTICIAN ^example.valueString = "林醫師"
* IDNO 1..1 string "個案證號" "身分證統一編號/外來人口之居留證統一證號、護照號碼；請優先填入身分證統一編號，如無法得知，始可填入居留證統一證號或護照號碼；倘無法取得上述3種證號時，請填入AA(本國新生兒，報告日期-出生日期<6個月)、BB(本國人士)或CC(外國人士)，由系統自動編碼流水證號(範例：AA11300001)；EMR增修通報單時填入AA、BB、CC，NIDRS網頁將呈現最後一次異動之證號，不會以AA、BB、CC覆蓋寫入或重新編碼流水證號。原規格資料型態：String/10。"
* IDNO ^maxLength = 10
* IDNO ^example.label = "範例"
* IDNO ^example.valueString = "A123456789"
* NAME 1..1 string "個案姓名" "個案姓名。原規格資料型態：String/200。"
* NAME ^maxLength = 200
* NAME ^example.label = "範例"
* NAME ^example.valueString = "陳大華"
* NAME_PINYIN 0..1 string "姓名羅馬拼音" "姓名羅馬拼音。原規格資料型態：String/200。"
* NAME_PINYIN ^maxLength = 200
* NAME_PINYIN ^example.label = "範例"
* NAME_PINYIN ^example.valueString = "CHEN DA-HUA"
* GENDER 0..1 code "性別" "性別 (F-女, M-男, X-第三性別)。原規格資料型態：Code。"
* GENDER from CDCGender (required)
* GENDER ^example.label = "範例"
* GENDER ^example.valueCode = #M
* BIRTHDAY 1..1 string "出生日期" "出生日期；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* BIRTHDAY ^maxLength = 10
* BIRTHDAY ^example.label = "範例"
* BIRTHDAY ^example.valueString = "1990/05/20"
* CITIZEN 0..1 integer "國籍" "國籍 (0-本國籍, 1-非本國籍)。原規格資料型態：Int。"
* CITIZEN ^example.label = "範例"
* CITIZEN ^example.valueInteger = 0
* NATIONALITY 0..1 code "國家" "國家(代碼：國家代碼)；若國籍為「本國籍」，僅可填158；若為「非本國籍」，不可填寫158，請填寫護照的發放國家；查無國家名稱時，請輸入其他，並填寫其他國家欄位。原規格資料型態：Code。"
* NATIONALITY from CDCCountry (required)
* NATIONALITY ^example.label = "範例"
* NATIONALITY ^example.valueCode = #158
* NATIONALITY_OTHER 0..1 string "其他國家" "其他國家；國家代碼填寫其他時必填。原規格資料型態：String/100。"
* NATIONALITY_OTHER ^maxLength = 100
* RESIDENCE_TYPE 0..1 string "非本國籍居民身份" "非本國籍居民身份(代碼：居留代碼)；「國籍」為本國籍時，「非本國籍居民身分」不可填寫。原規格資料型態：String/3。"
* RESIDENCE_TYPE ^maxLength = 3
* RESIDENCE_TYPE from CDCResidenceType (required)
* RESIDENCE_TYPE ^example.label = "範例"
* RESIDENCE_TYPE ^example.valueString = "4"
* RESIDENCE_TYPE_OTHER 0..1 string "非本國籍居民身份說明" "非本國籍居民身份說明；非本國籍居民身份填寫其他時必填。原規格資料型態：String/100。"
* RESIDENCE_TYPE_OTHER ^maxLength = 100
* RESIDENCE_COUNTY 1..1 code "居住縣市" "居住縣市(代碼：縣市代碼)。原規格資料型態：Code。"
* RESIDENCE_COUNTY from CDCCounty (required)
* RESIDENCE_COUNTY ^example.label = "範例"
* RESIDENCE_COUNTY ^example.valueCode = #65000
* RESIDENCE_TOWN 1..1 code "鄉鎮市區" "鄉鎮市區(代碼：縣市代碼:鄉鎮市區代碼)。原規格資料型態：Code。"
* RESIDENCE_TOWN from CDCTown (required)
* RESIDENCE_TOWN ^example.label = "範例"
* RESIDENCE_TOWN ^example.valueCode = #65000010
* RESIDENCE_VILLAGE 0..1 code "居住村里" "居住村里(代碼：縣市代碼:村里代碼)。原規格資料型態：Code。"
* RESIDENCE_VILLAGE from CDCVillage (required)
* RESIDENCE_VILLAGE ^example.label = "範例"
* RESIDENCE_VILLAGE ^example.valueCode = #65000010001
* ADDRESS 0..1 string "街道地址" "街道地址。原規格資料型態：String/150。"
* ADDRESS ^maxLength = 150
* ADDRESS ^example.label = "範例"
* ADDRESS ^example.valueString = "文化路一段100號"
* HAS_ORG 0..1 boolean "人口密集機構" "人口密集機構 (true-是, false-否)。原規格資料型態：Bool。"
* HAS_ORG ^example.label = "範例"
* HAS_ORG ^example.valueBoolean = false
* ORG_ID 0..1 code "機構類別" "機構類別(代碼：人口密集機構類別代碼)。原規格資料型態：Code。"
* ORG_ID from CDCDenseInstitution (required)
* ORG_ID ^example.label = "範例"
* ORG_ID ^example.valueCode = #2
* MARRIAGE 0..1 code "婚姻狀況" "婚姻狀況(代碼：婚姻狀況)。原規格資料型態：Code。"
* MARRIAGE from CDCMaritalStatus (required)
* MARRIAGE ^example.label = "範例"
* MARRIAGE ^example.valueCode = #2
* HOSPITALIZED_OUTPATIENT 0..1 boolean "病患動向_門診" "病患動向_門診 (true-是, false-否)。原規格資料型態：Bool。"
* HOSPITALIZED_OUTPATIENT ^example.label = "範例"
* HOSPITALIZED_OUTPATIENT ^example.valueBoolean = true
* HOSPITALIZED_EMERGENCY 0..1 boolean "病患動向_急診待床" "病患動向_急診待床 (true-是, false-否)。原規格資料型態：Bool。"
* HOSPITALIZED_GENERAL_WARD 0..1 boolean "病患動向_入住一般病房" "病患動向_入住一般病房 (true-是, false-否)；勾選是時，入住一般病房日必填。原規格資料型態：Bool。"
* HOSPITALIZED_ICU 0..1 boolean "病患動向_入住加護病房" "病患動向_入住加護病房 (true-是, false-否)；勾選是時，首次入住加護病房日必填、轉出加護病房日選填。原規格資料型態：Bool。"
* HOSPITALIZED_ISOLATION_ROOM 0..1 boolean "病患動向_入住隔離病房" "病患動向_入住隔離病房 (true-是, false-否)；勾選是時，首次入住隔離病房日必填、轉出隔離病房日選填。原規格資料型態：Bool。"
* HOSPITALIZED_DISCHARGED 0..1 boolean "病患動向_出院" "病患動向_出院 (true-是, false-否)；勾選是時，出院日必填。原規格資料型態：Bool。"
* HOSPITALIZED_TRANSFER 0..1 boolean "病患動向_轉院" "病患動向_轉院 (true-是, false-否)；勾選是時，轉至院所名稱必填、轉院日期必填。原規格資料型態：Bool。"
* HOSPITALIZED_NONE 0..1 boolean "病患動向_無就醫" "病患動向_無就醫。原規格資料型態：Bool。"
* STAY_IN_IW 0..1 string "首次入住隔離病房日" "首次入住隔離病房日；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* STAY_IN_IW ^maxLength = 10
* LEAVE_IW 0..1 string "轉出隔離病房日" "轉出隔離病房日；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* LEAVE_IW ^maxLength = 10
* STAY_IN_ICU 0..1 string "首次入住加護病房日" "首次入住加護病房日；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* STAY_IN_ICU ^maxLength = 10
* LEAVE_ICU 0..1 string "轉出加護病房日" "轉出加護病房日；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* LEAVE_ICU ^maxLength = 10
* HOSPITALIZED_DAY 0..1 string "入住一般病房日" "入住一般病房日；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* HOSPITALIZED_DAY ^maxLength = 10
* DISCHARGE 0..1 string "出院日" "出院日；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* DISCHARGE ^maxLength = 10
* TRANSFER_HOSPITAL 0..1 string "轉至院所名稱" "轉至院所名稱；醫事機構代碼。原規格資料型態：String/10。"
* TRANSFER_HOSPITAL ^maxLength = 10
* TRANSFER_DAY 0..1 string "轉院日期" "轉院日期；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* TRANSFER_DAY ^maxLength = 10
* DEATH 1..1 boolean "是否死亡" "是否死亡 (true-是, false-否)；本欄位勾選「是」，死亡日期必填。原規格資料型態：Bool。"
* DEATH ^example.label = "範例"
* DEATH ^example.valueBoolean = false
* DEATH_DAY 0..1 string "死亡日期" "死亡日期；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* DEATH_DAY ^maxLength = 10
* DEATH_REASON_A 0..1 string "死亡原因甲" "死亡原因甲。原規格資料型態：String/400。"
* DEATH_REASON_A ^maxLength = 400
* DEATH_REASON_B 0..1 string "死亡原因乙" "死亡原因乙。原規格資料型態：String/400。"
* DEATH_REASON_B ^maxLength = 400
* DEATH_REASON_C 0..1 string "死亡原因丙" "死亡原因丙。原規格資料型態：String/400。"
* DEATH_REASON_C ^maxLength = 400
* DEATH_REASON_D 0..1 string "死亡原因丁" "死亡原因丁。原規格資料型態：String/400。"
* DEATH_REASON_D ^maxLength = 400
* DEATH_REASON_OTHER 0..1 string "死亡原因其他" "死亡原因其他。原規格資料型態：String/400。"
* DEATH_REASON_OTHER ^maxLength = 400
* NOTE 0..1 string "備註" "備註；新增通報時可填寫，修改通報時不可填寫。原規格資料型態：String/250。"
* NOTE ^maxLength = 250
* MODIFIED_REASON 0..1 string "修改原因" "修改原因；修改通報時必填，新增通報時不可填寫。原規格資料型態：String/250。"
* MODIFIED_REASON ^maxLength = 250
* NO_SICK_DAY 0..1 boolean "無發病日" "無發病日。原規格資料型態：Bool。"
* NO_SICK_DAY ^example.label = "範例"
* NO_SICK_DAY ^example.valueBoolean = false
* SICK_DAY 0..1 string "發病日期" "發病日期；Ex.2021/01/01；有發病日時，本欄位必填，無發病日時，本欄不可填寫。原規格資料型態：String/10。日期以原格式字串表達。"
* SICK_DAY ^maxLength = 10
* SICK_DAY ^example.label = "範例"
* SICK_DAY ^example.valueString = "2025/08/01"
* DIAGNOSE_DAY 1..1 string "診斷日期" "診斷日期；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* DIAGNOSE_DAY ^maxLength = 10
* DIAGNOSE_DAY ^example.label = "範例"
* DIAGNOSE_DAY ^example.valueString = "2025/08/03"
* REPORTED_DAY 1..1 string "報告日期" "報告日期；Ex.2021/01/01；「報告日期」欄位填入值僅可為該通報單建檔日起算往前31天內(含)之日期。原規格資料型態：String/10。日期以原格式字串表達。"
* REPORTED_DAY ^maxLength = 10
* REPORTED_DAY ^example.label = "範例"
* REPORTED_DAY ^example.valueString = "2025/08/03"
* PHB_RECEIVED_DAY 1..1 string "衛生局收到日" "衛生局收到日；Ex.2021/01/01。原規格資料型態：String/10。日期以原格式字串表達。"
* PHB_RECEIVED_DAY ^maxLength = 10
* PHB_RECEIVED_DAY ^example.label = "範例"
* PHB_RECEIVED_DAY ^example.valueString = "2025/08/03"
* HAS_SYMPTOM 1..1 boolean "有無症狀" "有無症狀；通報結核病時，此欄位與主要症狀(DISEASE_SYMPTOM)不可填寫；若「有」症狀，「發病日」必填；若「無」症狀，「無發病日」需選擇True；若有症狀，請繼續填寫DISEASE_SYMPTOM。原規格資料型態：Bool。"
* HAS_SYMPTOM ^example.label = "範例"
* HAS_SYMPTOM ^example.valueBoolean = true
* OCCUPATION 1..1 code "職業" "職業(代碼：職業代碼)。原規格資料型態：Code。"
* OCCUPATION from CDCOccupation (required)
* OCCUPATION ^example.label = "範例"
* OCCUPATION ^example.valueCode = #3
* OCCUPATION_OTHER 0..1 string "詳細職業身分說明" "詳細職業身分說明；當職業選擇不詳，請於本欄說明。原規格資料型態：String/100。"
* OCCUPATION_OTHER ^maxLength = 100
* HAS_TRAVEL_HISTORY 1..1 boolean "旅遊史" "旅遊史 (true-有, false-無)；若有旅遊史，請繼續填寫旅遊史(TRAVEL)。原規格資料型態：Bool。"
* HAS_TRAVEL_HISTORY ^example.label = "範例"
* HAS_TRAVEL_HISTORY ^example.valueBoolean = false
* HAS_ANIMAL_HISTORY 0..1 boolean "動物接觸史" "動物接觸史 (true-有, false-無)；若有動物接觸史，請繼續填寫接觸動物史(ANIMAL)；德國麻疹、麻疹、急性病毒性D型肝炎、腸病毒感染併發重症不收集動物接觸史，若傳送將不檢核且不呈現於網頁。原規格資料型態：Bool。"
* EXPLORE_POSITIVE 0..1 boolean "與確定/極可能/可能病例曾有接觸或暴露共同感染源" "與確定/極可能/可能病例曾有接觸或暴露共同感染源。原規格資料型態：Bool。"
* EXPLORE_BODY_FLUID 0..1 boolean "具血體液接觸" "具血體液接觸。原規格資料型態：Bool。"
* EXPLORE_LAB 0..1 boolean "具實驗室暴露史" "具實驗室暴露史。原規格資料型態：Bool。"
* EXPLORE_POLLUTED_FOOD 0..1 boolean "曾食用受汙染的水或食物" "曾食用受汙染的水或食物。原規格資料型態：Bool。"
* EXPLORE_IATROGENIC 0..1 boolean "醫源型" "醫源型。原規格資料型態：Bool。"
* BIRTH_MOTHER_NAME 0..1 string "生母姓名" "生母姓名。原規格資料型態：String/200。"
* BIRTH_MOTHER_NAME ^maxLength = 200
* BIRTH_MOTHER_IDNO 0..1 string "生母證號" "生母身份證統一編號/外來人口之居留證統一證號。原規格資料型態：String/10。"
* BIRTH_MOTHER_IDNO ^maxLength = 10

Mapping: ReportCommonModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "Report_Common JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: ReportCommonModel
Target: "http://hl7.org/fhir/R4"
* -> "Composition-nidrs-report: Composition；Composition-nidrs-report-update: Composition；Patient-nidrs: Patient；Condition-nidrs: Condition；Encounter-nidrs: Encounter" "共同欄位分散對應至 Composition(通報單)、Patient(個案)、Condition(每一通報疾病)、Encounter(病患動向)、Observation(流行病學、死亡原因)、RelatedPerson(生母)、Organization/Practitioner/PractitionerRole(通報單位與人員)"
* REPORT -> "Condition-nidrs-update: Condition.identifier[reportId].value" "identifier.system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id；新增作業(EMRMsg01)通常不填(通報成功後由 HISMsg01 REPORT_LIST.REPORT_ID 回傳)；修改作業(EMRMsg02)必填，置於 Condition-nidrs-update(identifier[reportId] 1..1)"
* HOSPITAL -> "Organization-nidrs-hospital: Organization.identifier[hospitalCode].value；Composition-nidrs-report: Composition.custodian；PractitionerRole-nidrs: PractitionerRole.organization" "identifier.system = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw、type = v2-0203#PRN；同一 Organization 亦由 MessageHeader.sender 及 Encounter.serviceProvider 參照"
* HOSPITAL_NAME -> "Organization-nidrs-hospital: Organization.name" "直接對應"
* HOSPITAL_ADDRESS -> "Organization-nidrs-hospital: Organization.address.text" "直接對應"
* REPORTER_NAME -> "Practitioner-nidrs: Practitioner.name.text；Composition-nidrs-report: Composition.author" "建立 Practitioner(登錄者)及 PractitionerRole-nidrs(practitioner = 登錄者、organization = 通報單位)，Composition.author 參照該 PractitionerRole"
* HOSPITAL_CONTACT -> "PractitionerRole-nidrs: PractitionerRole.telecom.value" "telecom.system = phone"
* DIAGNOSTICIAN -> "Practitioner-nidrs: Practitioner.name.text；Condition-nidrs: Condition.asserter" "建立 Practitioner(診斷醫師)，每一筆通報疾病 Condition.asserter 皆參照之"
* IDNO -> "Patient-nidrs: Patient.identifier[idCardNumber|residentNumber|passportNumber|foreignPassport|nidrsTempId].value" "依證號種類擇一 slice：身分證統一編號→idCardNumber(system http://www.moi.gov.tw)；居留證統一證號→residentNumber(http://www.immigration.gov.tw)；中華民國護照→passportNumber(http://hl7.org/fhir/sid/passport-TWN)；外國護照→foreignPassport(http://hl7.org/fhir/sid/passport-{ISO 3166-1 alpha-3})；AA/BB/CC→nidrsTempId(use = temp、system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-temp-id)"
* NAME -> "Patient-nidrs: Patient.name[usual].text" "直接對應(name.use = usual)"
* NAME_PINYIN -> "Patient-nidrs: Patient.name[official].text" "name.use = official，並加上 iso21090-EN-representation 擴充(valueCode = ABC)"
* GENDER -> "Patient-nidrs: Patient.gender" "F→female、M→male、X→other(ConceptMap cdc-gender-to-administrative-gender)"
* BIRTHDAY -> "Patient-nidrs: Patient.birthDate" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* CITIZEN -> "Patient-nidrs: Patient.extension[citizen].valueCoding" "整數轉為代碼字串：0→CDCCitizen#0(本國籍)、1→CDCCitizen#1(非本國籍)"
* NATIONALITY -> "Patient-nidrs: Patient.extension[nationality].extension[code].valueCodeableConcept.coding" "coding.system = CodeSystem cdc-country；可依 ConceptMap cdc-country-to-iso3166 另加 ISO 3166 代碼"
* NATIONALITY_OTHER -> "Patient-nidrs: Patient.extension[nationality].extension[code].valueCodeableConcept.text" "與 NATIONALITY(其他)置於同一 CodeableConcept 之 text"
* RESIDENCE_TYPE -> "Patient-nidrs: Patient.extension[residenceType].valueCodeableConcept.coding" "coding.system = CodeSystem cdc-residence-type；本國籍時不可填寫(invariant nidrs-pat-3)"
* RESIDENCE_TYPE_OTHER -> "Patient-nidrs: Patient.extension[residenceType].valueCodeableConcept.text" "置於同一 CodeableConcept 之 text"
* RESIDENCE_COUNTY -> "Patient-nidrs: Patient.address.extension[adminArea].extension[county].valueCoding" "coding.system = CodeSystem cdc-county"
* RESIDENCE_TOWN -> "Patient-nidrs: Patient.address.extension[adminArea].extension[town].valueCoding" "coding.system = CodeSystem cdc-town"
* RESIDENCE_VILLAGE -> "Patient-nidrs: Patient.address.extension[adminArea].extension[village].valueCoding" "coding.system = CodeSystem cdc-village"
* ADDRESS -> "Patient-nidrs: Patient.address.text" "直接對應"
* HAS_ORG -> "Observation-nidrs-dense-institution: Observation.value[x]；Composition-nidrs-report: Composition.section[epidemiology].entry[denseInstitution]" "false→valueBoolean = false；true 且有 ORG_ID→valueCodeableConcept(機構類別)；true 但無 ORG_ID→valueBoolean = true"
* ORG_ID -> "Observation-nidrs-dense-institution: Observation.valueCodeableConcept.coding" "coding.system = CodeSystem cdc-dense-institution"
* MARRIAGE -> "Patient-nidrs: Patient.maritalStatus.coding" "填 CodeSystem cdc-marital-status 代碼，並建議依 ConceptMap cdc-marital-status-to-v3 加入 v3-MaritalStatus 代碼"
* HOSPITALIZED_OUTPATIENT -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept；Encounter-nidrs: Encounter.class" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#outpatient、Encounter.class = v3-ActCode#AMB；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* HOSPITALIZED_EMERGENCY -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept；Encounter-nidrs: Encounter.class" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#emergency、Encounter.class = v3-ActCode#EMER；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* HOSPITALIZED_GENERAL_WARD -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept；Encounter-nidrs: Encounter.class" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#general-ward、Encounter.class = v3-ActCode#IMP；入住一般病房日(HOSPITALIZED_DAY)必填(nidrs-enc-1)；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* HOSPITALIZED_ICU -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept；Encounter-nidrs: Encounter.location[icu]" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#icu、Encounter.class = v3-ActCode#IMP，並建立 location[icu](nidrs-enc-2)；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* HOSPITALIZED_ISOLATION_ROOM -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept；Encounter-nidrs: Encounter.location[isolationRoom]" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#isolation-room、Encounter.class = v3-ActCode#IMP，並建立 location[isolationRoom](nidrs-enc-2)；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* HOSPITALIZED_DISCHARGED -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept；Encounter-nidrs: Encounter.status" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#discharged、Encounter.status = finished；出院日(DISCHARGE)必填(nidrs-enc-3)；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* HOSPITALIZED_TRANSFER -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept；Encounter-nidrs: Encounter.hospitalization.dischargeDisposition" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#transfer、hospitalization.dischargeDisposition = discharge-disposition#other-hcf；轉至院所與轉院日期必填(nidrs-enc-4)；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* HOSPITALIZED_NONE -> "Encounter-nidrs: Encounter.extension[patientMovement].valueCodeableConcept" "true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#none；Encounter.class 為 FHIR 必填但無對應代碼(ConceptMap 為 unmatched)，建議於 class 加上 data-absent-reason 擴充(not-applicable)；false 或未填 → 不產生。原規格病患動向請擇一填寫"
* STAY_IN_IW -> "Encounter-nidrs: Encounter.location[isolationRoom].period.start" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* LEAVE_IW -> "Encounter-nidrs: Encounter.location[isolationRoom].period.end" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* STAY_IN_ICU -> "Encounter-nidrs: Encounter.location[icu].period.start" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* LEAVE_ICU -> "Encounter-nidrs: Encounter.location[icu].period.end" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* HOSPITALIZED_DAY -> "Encounter-nidrs: Encounter.period.start" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* DISCHARGE -> "Encounter-nidrs: Encounter.period.end" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* TRANSFER_HOSPITAL -> "Encounter-nidrs: Encounter.hospitalization.destination；Organization-nidrs-hospital: Organization.identifier[hospitalCode].value" "以醫事機構代碼建立(或參照)Organization-nidrs-hospital，hospitalization.destination 參照之"
* TRANSFER_DAY -> "Encounter-nidrs: Encounter.period.end" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* DEATH -> "Patient-nidrs: Patient.deceased[x]" "false→deceasedBoolean = false；true→改以 deceasedDateTime(= DEATH_DAY)表達，不使用 deceasedBoolean = true(invariant nidrs-pat-2)"
* DEATH_DAY -> "Patient-nidrs: Patient.deceasedDateTime" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* DEATH_REASON_A -> "Observation-nidrs-cause-of-death: Observation.component[reasonA].valueString；Composition-nidrs-report: Composition.section[death].entry" "有任一死亡原因時建立一筆死亡原因 Observation，並由 Composition.section[death] 參照"
* DEATH_REASON_B -> "Observation-nidrs-cause-of-death: Observation.component[reasonB].valueString" "同上"
* DEATH_REASON_C -> "Observation-nidrs-cause-of-death: Observation.component[reasonC].valueString" "同上"
* DEATH_REASON_D -> "Observation-nidrs-cause-of-death: Observation.component[reasonD].valueString" "同上"
* DEATH_REASON_OTHER -> "Observation-nidrs-cause-of-death: Observation.component[reasonOther].valueString" "同上"
* NOTE -> "Composition-nidrs-report: Composition.extension[note].valueString" "Composition-nidrs-report-update 之 extension[note] 為 0..0"
* MODIFIED_REASON -> "Composition-nidrs-report-update: Composition.extension[modifiedReason].valueString" "僅用於 Composition-nidrs-report-update(1..1)；Composition-nidrs-report 之 extension[modifiedReason] 為 0..0"
* NO_SICK_DAY -> "Condition-nidrs: Condition.extension[noOnsetDate].valueBoolean" "同一通報單之每一筆通報疾病 Condition 填入相同值；true 時不可填 onsetDateTime(nidrs-con-1)"
* SICK_DAY -> "Condition-nidrs: Condition.onsetDateTime" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)；複製至每一筆 Condition"
* DIAGNOSE_DAY -> "Condition-nidrs: Condition.recordedDate" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)；複製至每一筆 Condition"
* REPORTED_DAY -> "Composition-nidrs-report: Composition.date" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)(Composition.date 為 dateTime，可僅填日期)"
* PHB_RECEIVED_DAY -> "Composition-nidrs-report: Composition.extension[phbReceivedDate].valueDate" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* HAS_SYMPTOM -> "Condition-nidrs: Condition.extension[hasSymptom].valueBoolean" "複製至每一筆 Condition；相依檢核見 nidrs-con-2、nidrs-con-3"
* OCCUPATION -> "Observation-nidrs-occupation: Observation.valueCodeableConcept.coding；Composition-nidrs-report: Composition.section[epidemiology].entry[occupation]" "coding.system = CodeSystem cdc-occupation"
* OCCUPATION_OTHER -> "Observation-nidrs-occupation: Observation.valueCodeableConcept.text" "置於同一 CodeableConcept 之 text"
* HAS_TRAVEL_HISTORY -> "Observation-nidrs-epi-flag: Observation.valueBoolean；Composition-nidrs-report: Composition.section[epidemiology].entry[epiFlag]" "Observation.code = CDCNIDRSObservation#HAS_TRAVEL_HISTORY"
* HAS_ANIMAL_HISTORY -> "Observation-nidrs-epi-flag: Observation.valueBoolean" "Observation.code = CDCNIDRSObservation#HAS_ANIMAL_HISTORY"
* EXPLORE_POSITIVE -> "Observation-nidrs-epi-flag: Observation.valueBoolean" "Observation.code = CDCNIDRSObservation#EXPLORE_POSITIVE"
* EXPLORE_BODY_FLUID -> "Observation-nidrs-epi-flag: Observation.valueBoolean" "Observation.code = CDCNIDRSObservation#EXPLORE_BODY_FLUID"
* EXPLORE_LAB -> "Observation-nidrs-epi-flag: Observation.valueBoolean" "Observation.code = CDCNIDRSObservation#EXPLORE_LAB"
* EXPLORE_POLLUTED_FOOD -> "Observation-nidrs-epi-flag: Observation.valueBoolean" "Observation.code = CDCNIDRSObservation#EXPLORE_POLLUTED_FOOD"
* EXPLORE_IATROGENIC -> "Observation-nidrs-epi-flag: Observation.valueBoolean" "Observation.code = CDCNIDRSObservation#EXPLORE_IATROGENIC"
* BIRTH_MOTHER_NAME -> "RelatedPerson-nidrs-mother: RelatedPerson.name.text；Composition-nidrs-report: Composition.section[mother].entry" "relationship = v3-RoleCode#NMTH；RelatedPerson.patient 參照通報個案"
* BIRTH_MOTHER_IDNO -> "RelatedPerson-nidrs-mother: RelatedPerson.identifier.value" "identifier.system 依證號種類：身分證→http://www.moi.gov.tw；居留證→http://www.immigration.gov.tw"
