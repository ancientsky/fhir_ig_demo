// ============================================================
// 範例2：通報單新增(EMRMsg01)－登革熱大量通報(附錄五)
// 情境：2026 年 8 月臺南市本土登革熱疫情期間，成大醫院急診一次通報兩名
// NS1 快篩陽性個案，使用登革熱大量通報之縮減必填欄位(無連絡電話、無是否死亡、
// 無職業、無有無症狀)。一則訊息含兩筆通報單(REPORTS 多筆)。
// ============================================================

Instance: patient-dengue-bulk-1
InstanceOf: PatientNIDRSDengueBulk
Usage: #example
Title: "登革熱大量通報個案-許文彬"
Description: "登革熱大量通報個案範例(1)：本國籍男性，僅填寫手機，未填寫連絡電話與是否死亡。"
* insert ExIdCardNumber(D220876542)
* extension[nationality].extension[code].valueCodeableConcept = CDCCountry#158 "中華民國"
* extension[citizen].valueCoding = CDCCitizen#0 "本國籍"
* name[usual].use = #usual
* name[usual].text = "許文彬"
* gender = #male
* birthDate = "1978-11-02"
* telecom[mobile].system = #phone
* telecom[mobile].use = #mobile
* telecom[mobile].value = "0933-218765"
* address.use = #home
* address.extension[adminArea].extension[county].valueCoding = CDCCounty#67000 "台南市"
* address.extension[adminArea].extension[town].valueCoding = CDCTown#67000320 "台南市東區"
* address.extension[adminArea].extension[village].valueCoding = CDCVillage#67000320001 "台南市東區富裕里"
* address.text = "臺南市東區富裕里東寧路88巷12號"
* address.district = "臺南市"
* address.city = "東區"
* address.line = "東寧路88巷12號"
* address.country = "TW"

Instance: patient-dengue-bulk-2
InstanceOf: PatientNIDRSDengueBulk
Usage: #example
Title: "登革熱大量通報個案-阮氏蘭"
Description: "登革熱大量通報個案範例(2)：非本國籍(越南籍)外籍配偶，以居留證統一證號通報，並填寫姓名羅馬拼音與非本國籍居民身分。"
* identifier[residentNumber].use = #official
* identifier[residentNumber].type = $v2-0203#PRC
* identifier[residentNumber].system = $Immigration
* identifier[residentNumber].value = "E800123456"
* extension[nationality].extension[code].valueCodeableConcept = CDCCountry#704 "越南"
* extension[citizen].valueCoding = CDCCitizen#1 "非本國籍"
* extension[residenceType].valueCodeableConcept = CDCResidenceType#6 "外籍配偶"
* name[usual].use = #usual
* name[usual].text = "阮氏蘭"
* name[official].use = #official
* name[official].text = "NGUYEN THI LAN"
* name[official].family = "NGUYEN"
* name[official].given = "THI LAN"
* name[official].extension[representation].valueCode = #ABC
* gender = #female
* birthDate = "1990-04-21"
* telecom[mobile].system = #phone
* telecom[mobile].use = #mobile
* telecom[mobile].value = "0988-602413"
* address.use = #home
* address.extension[adminArea].extension[county].valueCoding = CDCCounty#67000 "台南市"
* address.extension[adminArea].extension[town].valueCoding = CDCTown#67000340 "台南市北區"
* address.extension[adminArea].extension[village].valueCoding = CDCVillage#67000340001 "台南市北區開元里"
* address.text = "臺南市北區開元里開元路156號3樓"
* address.district = "臺南市"
* address.city = "北區"
* address.line = "開元路156號3樓"
* address.country = "TW"

Instance: condition-dengue-bulk-1
InstanceOf: ConditionNIDRSDengueBulk
Usage: #example
Title: "通報疾病-登革熱大量通報(1)"
Description: "登革熱大量通報之通報疾病範例(1)：未填寫有無症狀，僅填寫主要症狀與發病日。"
* extension[noOnsetDate].valueBoolean = false
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#provisional
* category = $condition-category#encounter-diagnosis
* code.coding[cdcDisease] = CDCDisease#061 "登革熱"
* code.text = "登革熱"
* subject = Reference(patient-dengue-bulk-1) "許文彬"
* onsetDateTime = "2026-08-17"
* recordedDate = "2026-08-19"
* asserter = Reference(prac-ncku-doctor) "黃俊傑"
* evidence[0].code[0] = CDCSymptom#133 "發燒"
* evidence[0].code[1] = CDCSymptom#45 "肌肉痛"
* evidence[0].code[2] = CDCSymptom#189 "關節痛"

Instance: condition-dengue-bulk-2
InstanceOf: ConditionNIDRSDengueBulk
Usage: #example
Title: "通報疾病-登革熱大量通報(2)"
Description: "登革熱大量通報之通報疾病範例(2)：未填寫有無症狀與主要症狀，僅填寫發病日。"
* extension[noOnsetDate].valueBoolean = false
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#provisional
* category = $condition-category#encounter-diagnosis
* code.coding[cdcDisease] = CDCDisease#061 "登革熱"
* code.text = "登革熱"
* subject = Reference(patient-dengue-bulk-2) "阮氏蘭"
* onsetDateTime = "2026-08-18"
* recordedDate = "2026-08-19"
* asserter = Reference(prac-ncku-doctor) "黃俊傑"

Instance: obs-dengue-bulk-1-has-travel
InstanceOf: ObservationNIDRSEpiFlag
Usage: #example
Title: "旅遊史-無(大量通報個案1)"
Description: "登革熱大量通報個案(1)之流行病學資料：無旅遊史(HAS_TRAVEL_HISTORY=false)，研判為本土感染。"
* status = #final
* category = $observation-category#social-history
* code = CDCNIDRSObservation#HAS_TRAVEL_HISTORY "旅遊史"
* subject = Reference(patient-dengue-bulk-1) "許文彬"
* valueBoolean = false

Instance: obs-dengue-bulk-2-has-travel
InstanceOf: ObservationNIDRSEpiFlag
Usage: #example
Title: "旅遊史-無(大量通報個案2)"
Description: "登革熱大量通報個案(2)之流行病學資料：無旅遊史(HAS_TRAVEL_HISTORY=false)。"
* status = #final
* category = $observation-category#social-history
* code = CDCNIDRSObservation#HAS_TRAVEL_HISTORY "旅遊史"
* subject = Reference(patient-dengue-bulk-2) "阮氏蘭"
* valueBoolean = false

Instance: comp-report-dengue-bulk-1
InstanceOf: CompositionNIDRSReportDengueBulk
Usage: #example
Title: "傳染病個案通報單-登革熱大量通報(1)"
Description: "登革熱大量通報之通報單範例(1)：通報疾病區塊及旅遊史有無；未填寫職業。"
* extension[phbReceivedDate].valueDate = "2026-08-19"
* extension[note].valueString = "臺南市東區登革熱社區群聚期間急診通報，NS1 快篩陽性。"
* status = #final
* type = $LNC#55751-2 "Public health Case report"
* subject = Reference(patient-dengue-bulk-1) "許文彬"
* date = "2026-08-19T14:05:00+08:00"
* author = Reference(role-ncku-reporter) "陳淑芬"
* title = "傳染病個案通報單"
* custodian = Reference(org-ncku) "國立成功大學醫學院附設醫院"
* section[disease].title = "通報疾病"
* section[disease].code = $LNC#11450-4 "Problem list - Reported"
* section[disease].entry[0] = Reference(condition-dengue-bulk-1)
* section[epidemiology].title = "流行病學資料"
* section[epidemiology].code = $LNC#29762-2 "Social history Narrative"
* section[epidemiology].entry[epiFlag][0] = Reference(obs-dengue-bulk-1-has-travel)

Instance: comp-report-dengue-bulk-2
InstanceOf: CompositionNIDRSReportDengueBulk
Usage: #example
Title: "傳染病個案通報單-登革熱大量通報(2)"
Description: "登革熱大量通報之通報單範例(2)：通報疾病區塊及旅遊史有無；未填寫職業。"
* extension[phbReceivedDate].valueDate = "2026-08-19"
* status = #final
* type = $LNC#55751-2 "Public health Case report"
* subject = Reference(patient-dengue-bulk-2) "阮氏蘭"
* date = "2026-08-19T14:05:00+08:00"
* author = Reference(role-ncku-reporter) "陳淑芬"
* title = "傳染病個案通報單"
* custodian = Reference(org-ncku) "國立成功大學醫學院附設醫院"
* section[disease].title = "通報疾病"
* section[disease].code = $LNC#11450-4 "Problem list - Reported"
* section[disease].entry[0] = Reference(condition-dengue-bulk-2)
* section[epidemiology].title = "流行病學資料"
* section[epidemiology].code = $LNC#29762-2 "Social history Narrative"
* section[epidemiology].entry[epiFlag][0] = Reference(obs-dengue-bulk-2-has-travel)

Instance: mh-report-create-dengue-bulk
InstanceOf: MessageHeaderNIDRSReportCreate
Usage: #example
Title: "通報單新增訊息表頭-登革熱大量通報"
Description: "通報單新增作業(EMRMsg01)之訊息表頭範例：一次傳送兩筆登革熱大量通報單。"
* eventCoding = CDCMessageEvent#EMRMsg01 "通報單新增"
* destination[0].name = "疾病管制署傳染病通報系統"
* destination[0].endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* sender = Reference(org-ncku) "國立成功大學醫學院附設醫院"
* source.name = "成大醫院醫療資訊系統"
* source.endpoint = "https://his.ncku.example.org.tw/nidrs"
* focus[0] = Reference(comp-report-dengue-bulk-1)
* focus[1] = Reference(comp-report-dengue-bulk-2)

Instance: bundle-report-create-dengue-bulk
InstanceOf: BundleNIDRSReportCreate
Usage: #example
Title: "通報單新增訊息-登革熱大量通報(EMRMsg01)"
Description: "登革熱大量通報(附錄五)範例：成大醫院一則訊息通報兩名登革熱個案，使用登革熱大量通報之 Patient、Composition 與 Condition Profile。"
* identifier.system = $CDCBundleId
* identifier.value = "04210400110819141022456"
* type = #message
* timestamp = "2026-08-19T14:10:22.456+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-report-create-dengue-bulk"
* entry[0].resource = mh-report-create-dengue-bulk
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Composition/comp-report-dengue-bulk-1"
* entry[1].resource = comp-report-dengue-bulk-1
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Composition/comp-report-dengue-bulk-2"
* entry[2].resource = comp-report-dengue-bulk-2
* entry[3].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Patient/patient-dengue-bulk-1"
* entry[3].resource = patient-dengue-bulk-1
* entry[4].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Patient/patient-dengue-bulk-2"
* entry[4].resource = patient-dengue-bulk-2
* entry[5].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Condition/condition-dengue-bulk-1"
* entry[5].resource = condition-dengue-bulk-1
* entry[6].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Condition/condition-dengue-bulk-2"
* entry[6].resource = condition-dengue-bulk-2
* entry[7].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Organization/org-ncku"
* entry[7].resource = org-ncku
* entry[8].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Practitioner/prac-ncku-reporter"
* entry[8].resource = prac-ncku-reporter
* entry[9].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Practitioner/prac-ncku-doctor"
* entry[9].resource = prac-ncku-doctor
* entry[10].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/PractitionerRole/role-ncku-reporter"
* entry[10].resource = role-ncku-reporter
* entry[11].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-bulk-1-has-travel"
* entry[11].resource = obs-dengue-bulk-1-has-travel
* entry[12].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-bulk-2-has-travel"
* entry[12].resource = obs-dengue-bulk-2-has-travel
