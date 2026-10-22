// ============================================================
// 範例7：通報單新增結果回覆(HISMsg01)－成功
// 範例1(訊息 mh-report-create-dengue)通報成功，疾管署回覆通報單號。
// ============================================================

Instance: condition-dengue-caseref
InstanceOf: ConditionNIDRSCaseRef
Usage: #inline
Title: "通報單清單-登革熱通報單 1150123456789"
Description: "通報成功回覆之通報單清單(REPORT_LIST)範例：通報單號(REPORT_ID)、通報疾病(DISEASE_ID)及個案證號(IDNO)。"
* insert ExReportIdIdentifier(1150123456789)
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#provisional
* category = $condition-category#encounter-diagnosis
* code = CDCDisease#061 "登革熱"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"

Instance: mh-response-report-success
InstanceOf: MessageHeaderNIDRSResponse
Usage: #inline
Title: "通報單新增結果訊息表頭-成功"
Description: "通報單新增結果(HISMsg01)成功之訊息表頭範例：response.identifier 為範例1請求訊息之 MessageHeader.id，處理狀態 ok(SUCCESS)。"
* eventCoding = CDCMessageEvent#HISMsg01 "通報單新增結果"
* destination[0].name = "臺大醫院醫療資訊系統"
* destination[0].endpoint = "https://his.ntuh.example.org.tw/nidrs"
* destination[0].receiver.identifier.system = $TWOrgId
* destination[0].receiver.identifier.value = "0401180014"
* destination[0].receiver.display = "國立臺灣大學醫學院附設醫院"
* source.name = "疾病管制署傳染病通報系統"
* source.endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* response.identifier = "mh-report-create-dengue"
* response.code = #ok
* focus[0] = Reference(condition-dengue-caseref)

Instance: bundle-response-report-success
InstanceOf: BundleNIDRSResponse
Usage: #example
Title: "通報單新增結果回覆-成功(HISMsg01)"
Description: "通報單新增結果(HISMsg01)成功範例：疾管署回覆範例1之登革熱通報單號 1150123456789；處理日期(RESULT_TIME)以 Bundle.timestamp 表達。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140114093018660"
* type = #message
* timestamp = "2026-01-14T09:30:18.660+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-response-report-success"
* entry[0].resource = mh-response-report-success
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Condition/condition-dengue-caseref"
* entry[1].resource = condition-dengue-caseref
