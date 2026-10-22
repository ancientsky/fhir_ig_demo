// 表13 HISMsg03：通報單病歷資料傳送作業回應資料結構(HISMsg03)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: HISMsg03Model
Id: HISMsg03Model
Title: "通報單病歷資料傳送作業回應資料結構(HISMsg03)之資料模型"
Description: "NIDRS 表13 傳染病通報單病歷資料傳送作業結構表-回應資料結構(HISMsg03)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* REPORT_RESULT 1..1 BackboneElement "病歷資料傳送結果" "通報單病歷資料傳送結果(原規格說明欄記為「通報單修改結果」)。"
* REPORT_RESULT.STATUS 1..1 code "處理狀態" "處理狀態；SUCCESS:成功；FAILURE:失敗，失敗訊息請參考ERROR_LIST。原規格資料型態：Code。"
* REPORT_RESULT.STATUS ^example.label = "範例"
* REPORT_RESULT.STATUS ^example.valueCode = #SUCCESS
* REPORT_RESULT.RESULT_TIME 1..1 string "處理日期" "處理日期；格式 yyyyMMdd HH:mi:ss。原規格資料型態：Datetime。因原格式(yyyyMMdd HH:mi:ss)非 FHIR dateTime 格式，本模型以 string 表達。"
* REPORT_RESULT.RESULT_TIME ^example.label = "範例"
* REPORT_RESULT.RESULT_TIME ^example.valueString = "20250803 10:15:30"
* REPORT_RESULT.ERROR_LIST 0..* BackboneElement "錯誤清單" "失敗時，錯誤清單。"
* REPORT_RESULT.ERROR_LIST.ERROR_Code 1..1 string "錯誤代碼" "錯誤代碼。原規格資料型態：String/10。"
* REPORT_RESULT.ERROR_LIST.ERROR_Code ^maxLength = 10
* REPORT_RESULT.ERROR_LIST.ERROR_Code from CDCProcessingResult (extensible)
* REPORT_RESULT.ERROR_LIST.ERROR_Code ^example.label = "範例"
* REPORT_RESULT.ERROR_LIST.ERROR_Code ^example.valueString = "IDA3020002"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE 1..1 string "錯誤訊息" "錯誤訊息。原規格資料型態：String/2000。"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE ^maxLength = 2000
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE ^example.label = "範例"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE ^example.valueString = "通報單-個案資料：患者「身份證字號/護照號碼」必填寫"

Mapping: HISMsg03ModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "HISMsg03 JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: HISMsg03Model
Target: "http://hl7.org/fhir/R4"
* -> "Bundle-nidrs-response: Bundle；MessageHeader-nidrs-response: MessageHeader" "MessageHeader.eventCoding = CDCMessageEvent#HISMsg03"
* REPORT_RESULT -> "Bundle-nidrs-response: Bundle" "Bundle-nidrs-response 一則"
* REPORT_RESULT.STATUS -> "MessageHeader-nidrs-response: MessageHeader.response.code" "SUCCESS→ok；FAILURE→fatal-error"
* REPORT_RESULT.RESULT_TIME -> "Bundle-nidrs-response: Bundle.timestamp" "格式 yyyyMMdd HH:mi:ss 轉為 FHIR instant yyyy-MM-ddTHH:mm:ss+08:00(例：20250101 13:45:00→2025-01-01T13:45:00+08:00)"
* REPORT_RESULT.ERROR_LIST -> "OperationOutcome-nidrs: OperationOutcome.issue；MessageHeader-nidrs-response: MessageHeader.response.details" "每一筆錯誤對應一個 issue(severity = error)"
* REPORT_RESULT.ERROR_LIST.ERROR_Code -> "OperationOutcome-nidrs: OperationOutcome.issue.details.coding.code" "coding.system = CodeSystem cdc-processing-result；10 碼 = 項目代碼(6碼)+檢核代碼(4碼)，組成部分見 CDCProcessingResultPart；issue.code 依錯誤性質(必填→required、格式→value、重複通報→duplicate，其餘→processing)"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE -> "OperationOutcome-nidrs: OperationOutcome.issue.diagnostics" "直接對應；可同時填入 issue.details.text"
