// ============================================================
// 範例11：檢驗結果主動通知(PushSampleResult)
// 情境：範例9之送驗單(115011400000123)經疾管署檢驗，登革病毒 IgM 抗體陽性、
// real-time PCR 檢出登革病毒第二型(DENV-2)，綜合檢驗結果陽性，
// 疾管署於 2026-01-16 主動通知通報醫院(SampleResult)。
// ============================================================

Instance: obs-dengue-igm
InstanceOf: ObservationNIDRSAntibodyResult
Usage: #inline
Title: "血清學檢驗結果-登革病毒IgM抗體"
Description: "血清學檢驗結果(SampleAntibodyResult)範例：登革病毒 IgM 抗體 ELISA 陽性，效價 1:320，未四倍上升。"
* identifier[0].system = "https://lims.cdc.gov.tw/antibody-seq"
* identifier[0].value = "115011400000123-1"
* status = #final
* category[twcore] = $observation-category#laboratory
* code.coding[0].system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-antibody-method"
* code.coding[0].code = #DENV-IgM
* code.coding[0].display = "登革病毒IgM抗體(ELISA)"
* code.text = "登革病毒IgM抗體(ELISA)"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"
* effectiveDateTime = "2026-01-15"
* interpretation[0] = $TWIDIRTestResult#2 "陽性"
* component[titer].code = CDCNIDRSObservation#TITER "效價(Titer)"
* component[titer].valueString = "1:320"
* component[fourFoldRise].code = CDCNIDRSObservation#FOUR_FOLD_RISE "是否四倍上升"
* component[fourFoldRise].valueBoolean = false
* note[0].text = "急性期單一血清檢體。"

Instance: obs-dengue-pcr
InstanceOf: ObservationNIDRSPathogenResult
Usage: #inline
Title: "病原體檢驗結果-登革病毒real-time PCR"
Description: "病原體檢驗結果(SamplePathogenResult)範例：螢光定量聚合酶連鎖反應(real-time PCR)檢出登革病毒，次分型 DENV-2。"
* identifier[0].system = "https://lims.cdc.gov.tw/pathogen-seq"
* identifier[0].value = "115011400000123-1"
* status = #final
* category[twcore] = $observation-category#laboratory
* code = CDCPathogenMethod#02 "螢光定量聚合酶連鎖反應(real-time PCR)"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"
* effectiveDateTime = "2026-01-15"
* valueCodeableConcept = CDCPathogen#061 "登革病毒"
* interpretation[0] = $TWIDIRTestResult#2 "陽性"
* component[subtype].code = CDCNIDRSObservation#PATHOGEN_SUBTYPE "病原體次分型"
* component[subtype].valueCodeableConcept.text = "第二型(DENV-2)"

Instance: dr-dengue-sample-result
InstanceOf: DiagnosticReportNIDRSSampleResult
Usage: #inline
Title: "送驗單綜合檢驗結果-登革熱陽性"
Description: "檢驗結果主動通知範例：送驗單 115011400000123、通報單 1150123456789，送驗疾病 061 登革熱，綜合檢驗結果 2 陽性。"
* extension[report].valueReference.type = "Condition"
* extension[report].valueReference.identifier.type = CDCIdentifierType#nidrs-report "NIDRS通報單號"
* extension[report].valueReference.identifier.system = $NIDRSReportId
* extension[report].valueReference.identifier.value = "1150123456789"
* identifier[barcode].type = CDCIdentifierType#lims-barcode "送驗單編號"
* identifier[barcode].system = $LIMSBarcode
* identifier[barcode].value = "115011400000123"
* basedOn.type = "ServiceRequest"
* basedOn.identifier.type = CDCIdentifierType#lims-barcode "送驗單編號"
* basedOn.identifier.system = $LIMSBarcode
* basedOn.identifier.value = "115011400000123"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* code.coding[testDisease] = CDCTestDisease#061 "登革熱"
* code.text = "登革熱"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"
* effectiveDateTime = "2026-01-15"
* issued = "2026-01-16T15:00:00+08:00"
* performer[0].display = "衛生福利部疾病管制署"
* result[0] = Reference(obs-dengue-igm)
* result[1] = Reference(obs-dengue-pcr)
* conclusionCode[0] = $TWIDIRTestResult#2 "陽性"

Instance: mh-push-sample-result
InstanceOf: MessageHeaderNIDRSPushSampleResult
Usage: #inline
Title: "檢驗結果主動通知訊息表頭"
Description: "檢驗結果主動通知(PushSampleResult)之訊息表頭範例。"
* eventCoding = CDCMessageEvent#PushSampleResult "檢驗結果主動通知"
* destination[0].name = "臺大醫院醫療資訊系統"
* destination[0].endpoint = "https://his.ntuh.example.org.tw/nidrs/PushSampleResult"
* destination[0].receiver.identifier.system = $TWOrgId
* destination[0].receiver.identifier.value = "0401180014"
* destination[0].receiver.display = "國立臺灣大學醫學院附設醫院"
* source.name = "疾病管制署傳染病通報系統"
* source.endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* focus[0] = Reference(dr-dengue-sample-result)

Instance: bundle-push-sample-result
InstanceOf: BundleNIDRSPushSampleResult
Usage: #example
Title: "檢驗結果主動通知訊息(PushSampleResult)"
Description: "檢驗結果主動通知(PushSampleResult)範例：登革熱送驗單綜合檢驗結果陽性，含血清學檢驗結果與病原體檢驗結果各一筆。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140116150005500"
* type = #message
* timestamp = "2026-01-16T15:00:05.500+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-push-sample-result"
* entry[0].resource = mh-push-sample-result
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/DiagnosticReport/dr-dengue-sample-result"
* entry[1].resource = dr-dengue-sample-result
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-igm"
* entry[2].resource = obs-dengue-igm
* entry[3].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Observation/obs-dengue-pcr"
* entry[3].resource = obs-dengue-pcr
