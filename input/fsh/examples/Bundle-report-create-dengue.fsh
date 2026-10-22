// ============================================================
// 範例1：通報單新增(EMRMsg01)－登革熱(061)境外移入個案
// 情境：張雅婷(虛構)於 2025/12/28~2026/01/08 赴越南、泰國旅遊，
// 返國後 01/10 發燒、頭痛、後眼窩痛、肌肉痛及皮疹，01/14 至臺大醫院就醫，
// NS1 快篩陽性，收治一般病房並通報登革熱。
// ============================================================

Instance: patient-dengue
InstanceOf: PatientNIDRS
Usage: #inline
Title: "通報個案-張雅婷(登革熱)"
Description: "登革熱通報個案範例：本國籍女性，具身分證統一編號、連絡電話與手機、居住地址(含縣市/鄉鎮市區/村里代碼)。"
* insert ExIdCardNumber(A223456781)
* identifier[medicalRecord].use = #official
* identifier[medicalRecord].type = $v2-0203#MR
* identifier[medicalRecord].system = "https://www.ntuh.gov.tw/mrn"
* identifier[medicalRecord].value = "7654321"
* extension[nationality].extension[code].valueCodeableConcept = CDCCountry#158 "中華民國"
* extension[citizen].valueCoding = CDCCitizen#0 "本國籍"
* active = true
* name[usual].use = #usual
* name[usual].text = "張雅婷"
* name[official].use = #official
* name[official].text = "CHANG, YA-TING"
* name[official].family = "CHANG"
* name[official].given = "YA-TING"
* name[official].extension[representation].valueCode = #ABC
* gender = #female
* birthDate = "1992-05-18"
* telecom[phone].system = #phone
* telecom[phone].use = #home
* telecom[phone].value = "02-27001234"
* telecom[mobile].system = #phone
* telecom[mobile].use = #mobile
* telecom[mobile].value = "0912-345678"
* address.use = #home
* address.extension[adminArea].extension[county].valueCoding = CDCCounty#63000 "台北市"
* address.extension[adminArea].extension[town].valueCoding = CDCTown#63000030 "台北市大安區"
* address.extension[adminArea].extension[village].valueCoding = CDCVillage#63000030001 "台北市大安區德安里"
* address.text = "臺北市大安區德安里復興南路一段390號5樓"
* address.district = "臺北市"
* address.city = "大安區"
* address.line = "復興南路一段390號5樓"
* address.country = "TW"
* maritalStatus.coding[0] = CDCMaritalStatus#1 "未婚"
* maritalStatus.coding[1] = $v3-MaritalStatus#U "unmarried"
* deceasedBoolean = false

Instance: condition-dengue
InstanceOf: ConditionNIDRS
Usage: #inline
Title: "通報疾病-登革熱(新增)"
Description: "通報疾病範例：登革熱(061)，發病日 2026-01-10、診斷日 2026-01-14，有症狀(發燒、頭痛、後眼窩痛、肌肉痛、皮疹)。"
* extension[hasSymptom].valueBoolean = true
* extension[noOnsetDate].valueBoolean = false
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#provisional
* category = $condition-category#encounter-diagnosis
* code.coding[cdcDisease] = CDCDisease#061 "登革熱"
* code.coding[sct] = $SCT#38362002 "Dengue"
* code.text = "登革熱"
* subject = Reference(patient-dengue) "張雅婷"
* onsetDateTime = "2026-01-10"
* recordedDate = "2026-01-14"
* asserter = Reference(prac-ntuh-doctor) "王志明"
* evidence[0].code[0] = CDCSymptom#133 "發燒"
* evidence[0].code[0].coding[1] = $SCT#386661006 "Fever"
* evidence[0].code[1] = CDCSymptom#181 "頭痛"
* evidence[0].code[1].coding[1] = $SCT#25064002 "Headache"
* evidence[0].code[2] = CDCSymptom#77 "後眼窩痛"
* evidence[0].code[3] = CDCSymptom#45 "肌肉痛"
* evidence[0].code[3].coding[1] = $SCT#68962001 "Muscle pain"
* evidence[0].code[4] = CDCSymptom#24 "皮疹/紅疹/出疹"
* evidence[0].code[4].coding[1] = $SCT#271807003 "Eruption of skin"

Instance: encounter-dengue
InstanceOf: EncounterNIDRS
Usage: #inline
Title: "病患動向-入住一般病房"
Description: "病患動向範例：2026-01-14 入住一般病房(HOSPITALIZED_GENERAL_WARD、HOSPITALIZED_DAY)。"
* extension[patientMovement].valueCodeableConcept = CDCPatientMovement#general-ward "入住一般病房"
* status = #in-progress
* class = $v3-ActCode#IMP "inpatient encounter"
* subject = Reference(patient-dengue) "張雅婷"
* period.start = "2026-01-14"
* serviceProvider = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"

Instance: obs-dengue-occupation
InstanceOf: ObservationNIDRSOccupation
Usage: #inline
Title: "職業-商業及行政專業人員"
Description: "通報個案職業(OCCUPATION)範例。"
* status = #final
* category = $observation-category#social-history
* code = $LNC#85658-3 "Occupation [Type]"
* subject = Reference(patient-dengue) "張雅婷"
* valueCodeableConcept = CDCOccupation#56 "商業及行政專業人員"
* valueCodeableConcept.text = "貿易公司行政專員"

Instance: obs-dengue-has-travel
InstanceOf: ObservationNIDRSEpiFlag
Usage: #inline
Title: "旅遊史-有"
Description: "流行病學資料範例：有旅遊史(HAS_TRAVEL_HISTORY=true)。"
* status = #final
* category = $observation-category#social-history
* code = CDCNIDRSObservation#HAS_TRAVEL_HISTORY "旅遊史"
* subject = Reference(patient-dengue) "張雅婷"
* valueBoolean = true

Instance: obs-dengue-has-animal
InstanceOf: ObservationNIDRSEpiFlag
Usage: #inline
Title: "動物接觸史-無"
Description: "流行病學資料範例：無動物接觸史(HAS_ANIMAL_HISTORY=false)。"
* status = #final
* category = $observation-category#social-history
* code = CDCNIDRSObservation#HAS_ANIMAL_HISTORY "動物接觸史"
* subject = Reference(patient-dengue) "張雅婷"
* valueBoolean = false

Instance: obs-dengue-travel-vn
InstanceOf: ObservationNIDRSTravel
Usage: #inline
Title: "旅遊史明細-越南"
Description: "旅遊史(Report_Travel)範例：國外旅遊史，越南胡志明市，2025-12-28 至 2026-01-03。"
* status = #final
* category = $observation-category#social-history
* code = $LNC#8691-8 "History of Travel"
* subject = Reference(patient-dengue) "張雅婷"
* effectivePeriod.start = "2025-12-28"
* effectivePeriod.end = "2026-01-03"
* valueCodeableConcept = CDCCountry#704 "越南"
* component[travelType].code = CDCNIDRSObservation#TRAVEL_TYPE "旅遊類型"
* component[travelType].valueCodeableConcept = CDCTravelType#1 "國外旅遊史"
* component[subArea].code = CDCNIDRSObservation#TRAVEL_SUB_AREA "次級行政區"
* component[subArea].valueString = "胡志明市"

Instance: obs-dengue-travel-th
InstanceOf: ObservationNIDRSTravel
Usage: #inline
Title: "旅遊史明細-泰國"
Description: "旅遊史(Report_Travel)範例：國外旅遊史，泰國曼谷，2026-01-03 至 2026-01-08(入境我國)。"
* status = #final
* category = $observation-category#social-history
* code = $LNC#8691-8 "History of Travel"
* subject = Reference(patient-dengue) "張雅婷"
* effectivePeriod.start = "2026-01-03"
* effectivePeriod.end = "2026-01-08"
* valueCodeableConcept = CDCCountry#764 "泰國"
* component[travelType].code = CDCNIDRSObservation#TRAVEL_TYPE "旅遊類型"
* component[travelType].valueCodeableConcept = CDCTravelType#1 "國外旅遊史"
* component[subArea].code = CDCNIDRSObservation#TRAVEL_SUB_AREA "次級行政區"
* component[subArea].valueString = "曼谷"

Instance: qr-dengue-supplement
InstanceOf: QuestionnaireResponseNIDRS
Usage: #inline
Title: "登革熱增補欄位填答(新增)"
Description: "登革熱(061)疾病增補欄位(DISEASE_FIELD)範例：無警示徵象、NS1 快篩陽性(採檢日 2026-01-14)、無重症診斷條件。"
* questionnaire = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-061"
* status = #completed
* subject = Reference(patient-dengue) "張雅婷"
* authored = "2026-01-14T09:15:00+08:00"
* author = Reference(role-ntuh-reporter) "林怡君"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀"
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "警示徵象(單選)"
* item[0].item[0].item[0].linkId = "S_QN06111000_AN06111002"
* item[0].item[0].item[0].text = "無"
* item[0].item[0].item[0].answer[0].valueBoolean = true
* item[1].linkId = "section-2"
* item[1].text = "通報時檢驗資料"
* item[1].item[0].linkId = "section-2.group-1"
* item[1].item[0].text = "登革熱快速檢驗結果(單選)"
* item[1].item[0].item[0].linkId = "S_QN061000a0_AN061000a1"
* item[1].item[0].item[0].text = "NS1陽性"
* item[1].item[0].item[0].answer[0].valueBoolean = true
* item[1].item[0].item[1].linkId = "S_061_00001"
* item[1].item[0].item[1].text = "採檢日"
* item[1].item[0].item[1].answer[0].valueDate = "2026-01-14"
* item[2].linkId = "section-3"
* item[2].text = "個案狀況維護與補充資料"
* item[2].item[0].linkId = "section-3.group-1"
* item[2].item[0].text = "重症診斷條件 (單選)"
* item[2].item[0].item[0].linkId = "S_QN06140000_AN06140002"
* item[2].item[0].item[0].text = "無"
* item[2].item[0].item[0].answer[0].valueBoolean = true

Instance: comp-report-dengue
InstanceOf: CompositionNIDRSReport
Usage: #inline
Title: "傳染病個案通報單-登革熱(新增)"
Description: "傳染病個案通報單(REPORT)範例：登革熱境外移入疑似個案，包含通報疾病、病患動向、流行病學資料及疾病增補欄位。"
* extension[phbReceivedDate].valueDate = "2026-01-14"
* extension[note].valueString = "個案 12/28-01/08 赴越南、泰國旅遊，返國後發燒，NS1 快篩陽性。"
* status = #final
* type = $LNC#55751-2 "Public health Case report"
* subject = Reference(patient-dengue) "張雅婷"
* encounter = Reference(encounter-dengue)
* date = "2026-01-14T09:20:00+08:00"
* author = Reference(role-ntuh-reporter) "林怡君"
* title = "傳染病個案通報單"
* custodian = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* section[disease].title = "通報疾病"
* section[disease].code = $LNC#11450-4 "Problem list - Reported"
* section[disease].entry[0] = Reference(condition-dengue)
* section[patientMovement].title = "病患動向"
* section[patientMovement].code = $LNC#46240-8 "History of Hospitalizations+Outpatient visits Narrative"
* section[patientMovement].entry[0] = Reference(encounter-dengue)
* section[epidemiology].title = "流行病學資料"
* section[epidemiology].code = $LNC#29762-2 "Social history Narrative"
* section[epidemiology].entry[occupation] = Reference(obs-dengue-occupation)
* section[epidemiology].entry[epiFlag][0] = Reference(obs-dengue-has-travel)
* section[epidemiology].entry[epiFlag][1] = Reference(obs-dengue-has-animal)
* section[epidemiology].entry[travel][0] = Reference(obs-dengue-travel-vn)
* section[epidemiology].entry[travel][1] = Reference(obs-dengue-travel-th)
* section[supplement].title = "疾病增補欄位"
* section[supplement].code = CDCReportSection#supplement "疾病增補欄位"
* section[supplement].entry[0] = Reference(qr-dengue-supplement)

Instance: mh-report-create-dengue
InstanceOf: MessageHeaderNIDRSReportCreate
Usage: #inline
Title: "通報單新增訊息表頭-登革熱"
Description: "通報單新增作業(EMRMsg01)之訊息表頭範例。"
* eventCoding = CDCMessageEvent#EMRMsg01 "通報單新增"
* destination[0].name = "疾病管制署傳染病通報系統"
* destination[0].endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* sender = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* source.name = "臺大醫院醫療資訊系統"
* source.endpoint = "https://his.ntuh.example.org.tw/nidrs"
* focus[0] = Reference(comp-report-dengue)

Instance: bundle-report-create-dengue
InstanceOf: BundleNIDRSReportCreate
Usage: #example
Title: "通報單新增訊息-登革熱(EMRMsg01)"
Description: "通報單新增作業(EMRMsg01)範例：臺大醫院通報一名自越南、泰國返國之登革熱疑似個案。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140114093015123"
* type = #message
* timestamp = "2026-01-14T09:30:15.123+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-report-create-dengue"
* entry[0].resource = mh-report-create-dengue
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Composition/comp-report-dengue"
* entry[1].resource = comp-report-dengue
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Patient/patient-dengue"
* entry[2].resource = patient-dengue
* entry[3].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Condition/condition-dengue"
* entry[3].resource = condition-dengue
* entry[4].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Encounter/encounter-dengue"
* entry[4].resource = encounter-dengue
* entry[5].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Organization/org-ntuh"
* entry[5].resource = org-ntuh
* entry[6].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Practitioner/prac-ntuh-reporter"
* entry[6].resource = prac-ntuh-reporter
* entry[7].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Practitioner/prac-ntuh-doctor"
* entry[7].resource = prac-ntuh-doctor
* entry[8].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/PractitionerRole/role-ntuh-reporter"
* entry[8].resource = role-ntuh-reporter
* entry[9].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-occupation"
* entry[9].resource = obs-dengue-occupation
* entry[10].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-has-travel"
* entry[10].resource = obs-dengue-has-travel
* entry[11].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-has-animal"
* entry[11].resource = obs-dengue-has-animal
* entry[12].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-travel-vn"
* entry[12].resource = obs-dengue-travel-vn
* entry[13].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-travel-th"
* entry[13].resource = obs-dengue-travel-th
* entry[14].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/QuestionnaireResponse/qr-dengue-supplement"
* entry[14].resource = qr-dengue-supplement
