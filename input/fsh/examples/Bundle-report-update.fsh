// ============================================================
// 範例3：通報單修改(EMRMsg02)－登革熱個案轉入加護病房
// 情境：範例1之登革熱個案(通報單號 1150123456789)於 2026-01-17 出現警示徵象
// 並發生血漿滲漏導致休克，轉入加護病房；臺大醫院以 EMR 修改通報單之
// 病患動向與疾病增補欄位(須填寫修改原因，不可填寫備註)。
// ============================================================

Instance: condition-dengue-update
InstanceOf: ConditionNIDRSUpdate
Usage: #example
Title: "通報疾病-登革熱(修改)"
Description: "修改通報單時之通報疾病範例：帶入原通報單號(REPORT_ID 1150123456789)，通報疾病維持登革熱(061)。"
* insert ExReportIdIdentifier(1150123456789)
* extension[hasSymptom].valueBoolean = true
* extension[noOnsetDate].valueBoolean = false
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#provisional
* category = $condition-category#encounter-diagnosis
* code.coding[cdcDisease] = CDCDisease#061 "登革熱"
* code.text = "登革熱"
* subject = Reference(patient-dengue) "張雅婷"
* onsetDateTime = "2026-01-10"
* recordedDate = "2026-01-14"
* asserter = Reference(prac-ntuh-doctor) "王志明"
* evidence[0].code[0] = CDCSymptom#133 "發燒"
* evidence[0].code[1] = CDCSymptom#181 "頭痛"
* evidence[0].code[2] = CDCSymptom#77 "後眼窩痛"
* evidence[0].code[3] = CDCSymptom#45 "肌肉痛"
* evidence[0].code[4] = CDCSymptom#24 "皮疹/紅疹/出疹"
* evidence[0].code[5] = CDCSymptom#162 "嘔吐"
* evidence[0].code[6] = CDCSymptom#23 "出血症狀"

Instance: encounter-dengue-icu
InstanceOf: EncounterNIDRS
Usage: #example
Title: "病患動向-入住加護病房"
Description: "病患動向範例：2026-01-14 入院，2026-01-17 首次入住加護病房(HOSPITALIZED_ICU、STAY_IN_ICU)。"
* extension[patientMovement].valueCodeableConcept = CDCPatientMovement#icu "入住加護病房"
* status = #in-progress
* class = $v3-ActCode#IMP "inpatient encounter"
* subject = Reference(patient-dengue) "張雅婷"
* period.start = "2026-01-14"
* serviceProvider = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* location[icu].location.display = "加護病房"
* location[icu].physicalType = CDCPatientMovement#icu "入住加護病房"
* location[icu].status = #active
* location[icu].period.start = "2026-01-17"

Instance: qr-dengue-supplement-update
InstanceOf: QuestionnaireResponseNIDRS
Usage: #example
Title: "登革熱增補欄位填答(修改)"
Description: "登革熱(061)疾病增補欄位修改範例：有警示徵象、NS1 快篩陽性，符合重症診斷條件(嚴重血漿滲漏導致休克)。"
* questionnaire = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-061"
* status = #completed
* subject = Reference(patient-dengue) "張雅婷"
* authored = "2026-01-17T14:20:00+08:00"
* author = Reference(role-ntuh-reporter) "林怡君"
* item[0].linkId = "section-1"
* item[0].text = "臨床症狀"
* item[0].item[0].linkId = "section-1.group-1"
* item[0].item[0].text = "警示徵象(單選)"
* item[0].item[0].item[0].linkId = "S_QN06111000_AN06111001"
* item[0].item[0].item[0].text = "有（符合以下任一項）"
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
* item[2].item[0].item[0].linkId = "S_QN06140000_AN06140001"
* item[2].item[0].item[0].text = "有"
* item[2].item[0].item[0].answer[0].valueBoolean = true
* item[2].item[1].linkId = "section-3.group-2"
* item[2].item[1].text = "(需選擇時，可複選)"
* item[2].item[1].item[0].linkId = "S_QN06141000_AN06141001"
* item[2].item[1].item[0].text = "嚴重血漿滲漏導致休克"
* item[2].item[1].item[0].answer[0].valueBoolean = true

Instance: comp-report-dengue-update
InstanceOf: CompositionNIDRSReportUpdate
Usage: #example
Title: "傳染病個案通報單-登革熱(修改)"
Description: "傳染病個案通報單修改範例：填寫修改原因(MODIFIED_REASON)，更新病患動向為入住加護病房並補充重症資料。"
* extension[phbReceivedDate].valueDate = "2026-01-14"
* extension[modifiedReason].valueString = "個案病情惡化，01/17 轉入加護病房，更新病患動向及重症診斷條件。"
* status = #final
* type = $LNC#55751-2 "Public health Case report"
* subject = Reference(patient-dengue) "張雅婷"
* encounter = Reference(encounter-dengue-icu)
* date = "2026-01-14T09:20:00+08:00"
* author = Reference(role-ntuh-reporter) "林怡君"
* title = "傳染病個案通報單"
* custodian = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* section[disease].title = "通報疾病"
* section[disease].code = $LNC#11450-4 "Problem list - Reported"
* section[disease].entry[0] = Reference(condition-dengue-update)
* section[patientMovement].title = "病患動向"
* section[patientMovement].code = $LNC#46240-8 "History of Hospitalizations+Outpatient visits Narrative"
* section[patientMovement].entry[0] = Reference(encounter-dengue-icu)
* section[epidemiology].title = "流行病學資料"
* section[epidemiology].code = $LNC#29762-2 "Social history Narrative"
* section[epidemiology].entry[occupation] = Reference(obs-dengue-occupation)
* section[epidemiology].entry[epiFlag][0] = Reference(obs-dengue-has-travel)
* section[epidemiology].entry[epiFlag][1] = Reference(obs-dengue-has-animal)
* section[epidemiology].entry[travel][0] = Reference(obs-dengue-travel-vn)
* section[epidemiology].entry[travel][1] = Reference(obs-dengue-travel-th)
* section[supplement].title = "疾病增補欄位"
* section[supplement].code = CDCReportSection#supplement "疾病增補欄位"
* section[supplement].entry[0] = Reference(qr-dengue-supplement-update)

Instance: mh-report-update
InstanceOf: MessageHeaderNIDRSReportUpdate
Usage: #example
Title: "通報單修改訊息表頭-登革熱"
Description: "通報單修改作業(EMRMsg02)之訊息表頭範例。"
* eventCoding = CDCMessageEvent#EMRMsg02 "通報單修改"
* destination[0].name = "疾病管制署傳染病通報系統"
* destination[0].endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* sender = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* source.name = "臺大醫院醫療資訊系統"
* source.endpoint = "https://his.ntuh.example.org.tw/nidrs"
* focus[0] = Reference(comp-report-dengue-update)

Instance: bundle-report-update
InstanceOf: BundleNIDRSReportUpdate
Usage: #example
Title: "通報單修改訊息-登革熱(EMRMsg02)"
Description: "通報單修改作業(EMRMsg02)範例：修改通報單 1150123456789，病患動向改為入住加護病房。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140117143005456"
* type = #message
* timestamp = "2026-01-17T14:30:05.456+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-report-update"
* entry[0].resource = mh-report-update
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Composition/comp-report-dengue-update"
* entry[1].resource = comp-report-dengue-update
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Patient/patient-dengue"
* entry[2].resource = patient-dengue
* entry[3].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Condition/condition-dengue-update"
* entry[3].resource = condition-dengue-update
* entry[4].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Encounter/encounter-dengue-icu"
* entry[4].resource = encounter-dengue-icu
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
* entry[14].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/QuestionnaireResponse/qr-dengue-supplement-update"
* entry[14].resource = qr-dengue-supplement-update
