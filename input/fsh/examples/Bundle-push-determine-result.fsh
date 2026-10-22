// ============================================================
// 範例10：研判結果主動通知(PushDetermineResult)
// 情境：範例1之登革熱通報單(1150123456789)於 2026-01-20 經疾管署研判為
// 確定病例(30)，疾管署主動通知通報醫院(ReportDetermineResult)。
// ============================================================

Instance: condition-dengue-determined
InstanceOf: ConditionNIDRSDetermineResult
Usage: #inline
Title: "研判結果-登革熱確定病例"
Description: "研判結果主動通知範例：通報單號 1150123456789，研判結果 30 確定病例，研判時間 2026-01-20，衛生局收到日與建檔日 2026-01-14。"
* insert ExReportIdIdentifier(1150123456789)
* extension[determineResult].extension[status].valueCodeableConcept = CDCDetermineStatus#30 "確定病例"
* extension[determineResult].extension[date].valueDateTime = "2026-01-20T16:45:00+08:00"
* extension[phbReceivedDate].valueDate = "2026-01-14"
* extension[cdcReceivedDate].valueDate = "2026-01-14"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = $condition-category#encounter-diagnosis
* code = CDCDisease#061 "登革熱"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"

Instance: mh-push-determine-result
InstanceOf: MessageHeaderNIDRSPushDetermineResult
Usage: #inline
Title: "研判結果主動通知訊息表頭"
Description: "研判結果主動通知(PushDetermineResult)之訊息表頭範例。"
* eventCoding = CDCMessageEvent#PushDetermineResult "研判結果主動通知"
* destination[0].name = "臺大醫院醫療資訊系統"
* destination[0].endpoint = "https://his.ntuh.example.org.tw/nidrs/PushDetermineResult"
* destination[0].receiver.identifier.system = $TWOrgId
* destination[0].receiver.identifier.value = "0401180014"
* destination[0].receiver.display = "國立臺灣大學醫學院附設醫院"
* source.name = "疾病管制署傳染病通報系統"
* source.endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* focus[0] = Reference(condition-dengue-determined)

Instance: bundle-push-determine-result
InstanceOf: BundleNIDRSPushDetermineResult
Usage: #example
Title: "研判結果主動通知訊息(PushDetermineResult)"
Description: "研判結果主動通知(PushDetermineResult)範例：登革熱通報單 1150123456789 研判為確定病例。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140120164530120"
* type = #message
* timestamp = "2026-01-20T16:45:30.120+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-push-determine-result"
* entry[0].resource = mh-push-determine-result
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Condition/condition-dengue-determined"
* entry[1].resource = condition-dengue-determined
