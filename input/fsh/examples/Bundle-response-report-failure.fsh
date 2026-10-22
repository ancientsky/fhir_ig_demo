// ============================================================
// 範例8：通報單新增結果回覆(HISMsg01)－失敗
// 另一則通報單新增訊息因未填寫個案證號而失敗，疾管署回覆錯誤清單(ERROR_LIST)。
// ============================================================

Instance: oo-report-failure
InstanceOf: OperationOutcomeNIDRS
Usage: #example
Title: "錯誤清單-個案證號未填寫"
Description: "通報單新增失敗之錯誤清單(ERROR_LIST)範例：錯誤代碼 IDA3020002(通報單-個案資料：患者「身份證字號/護照號碼」必填寫)。"
* issue[0].severity = #error
* issue[0].code = #required
* issue[0].details = CDCProcessingResult#IDA3020002 "通報單-個案資料：患者「身份證字號/護照號碼」必填寫"
* issue[0].diagnostics = "通報單-個案資料：患者「身份證字號/護照號碼」必填寫"
* issue[0].expression[0] = "Bundle.entry[2].resource.identifier"

Instance: mh-response-report-failure
InstanceOf: MessageHeaderNIDRSResponse
Usage: #example
Title: "通報單新增結果訊息表頭-失敗"
Description: "通報單新增結果(HISMsg01)失敗之訊息表頭範例：處理狀態 fatal-error(FAILURE)，錯誤清單見 response.details。"
* eventCoding = CDCMessageEvent#HISMsg01 "通報單新增結果"
* destination[0].name = "臺大醫院醫療資訊系統"
* destination[0].endpoint = "https://his.ntuh.example.org.tw/nidrs"
* destination[0].receiver.identifier.system = $TWOrgId
* destination[0].receiver.identifier.value = "0401180014"
* destination[0].receiver.display = "國立臺灣大學醫學院附設醫院"
* source.name = "疾病管制署傳染病通報系統"
* source.endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* response.identifier = "mh-report-create-0114101500"
* response.code = #fatal-error
* response.details = Reference(oo-report-failure)

Instance: bundle-response-report-failure
InstanceOf: BundleNIDRSResponse
Usage: #example
Title: "通報單新增結果回覆-失敗(HISMsg01)"
Description: "通報單新增結果(HISMsg01)失敗範例：通報單位送出之通報單新增訊息(MessageHeader.id 為 mh-report-create-0114101500，未附於本 IG)未填寫個案證號，疾管署回覆錯誤代碼 IDA3020002。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140114101502310"
* type = #message
* timestamp = "2026-01-14T10:15:02.310+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-response-report-failure"
* entry[0].resource = mh-response-report-failure
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/OperationOutcome/oo-report-failure"
* entry[1].resource = oo-report-failure
