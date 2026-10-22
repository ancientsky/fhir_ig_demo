// 表11 HISMsg02：通報單修改作業回應資料結構(HISMsg02)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: HISMsg02Model
Id: HISMsg02Model
Title: "通報單修改作業回應資料結構(HISMsg02)之資料模型"
Description: "NIDRS 表11 傳染病通報單修改作業結構表-回應資料結構(HISMsg02)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* REPORT_RESULT 1..1 BackboneElement "通報單修改結果" "通報單修改結果。"
* REPORT_RESULT.STATUS 1..1 code "處理狀態" "處理狀態；SUCCESS:成功(成立通報單號請參考REPORT_LIST)；FAILURE:失敗，失敗訊息請參考ERROR_LIST。原規格資料型態：Code。"
* REPORT_RESULT.STATUS ^example.label = "範例"
* REPORT_RESULT.STATUS ^example.valueCode = #SUCCESS
* REPORT_RESULT.RESULT_TIME 1..1 string "處理日期" "處理日期；格式 yyyyMMdd HH:mi:ss。原規格資料型態：Datetime。因原格式(yyyyMMdd HH:mi:ss)非 FHIR dateTime 格式，本模型以 string 表達。"
* REPORT_RESULT.RESULT_TIME ^example.label = "範例"
* REPORT_RESULT.RESULT_TIME ^example.valueString = "20250803 10:15:30"
* REPORT_RESULT.REPORT_LIST 0..* BackboneElement "通報單清單" "成功時，通報單清單。"
* REPORT_RESULT.REPORT_LIST.REPORT_ID 1..1 string "通報單號" "通報單號。原規格資料型態：String/13。"
* REPORT_RESULT.REPORT_LIST.REPORT_ID ^maxLength = 13
* REPORT_RESULT.REPORT_LIST.REPORT_ID ^example.label = "範例"
* REPORT_RESULT.REPORT_LIST.REPORT_ID ^example.valueString = "1140300012345"
* REPORT_RESULT.REPORT_LIST.DISEASE_ID 1..1 string "通報疾病" "通報疾病。原規格資料型態：String/10。"
* REPORT_RESULT.REPORT_LIST.DISEASE_ID ^maxLength = 10
* REPORT_RESULT.REPORT_LIST.DISEASE_ID from CDCDisease (required)
* REPORT_RESULT.REPORT_LIST.DISEASE_ID ^example.label = "範例"
* REPORT_RESULT.REPORT_LIST.DISEASE_ID ^example.valueString = "061"
* REPORT_RESULT.REPORT_LIST.IDNO 1..1 string "個案證號" "個案證號(NIDRS 自動編碼者回傳流水證號)。原規格資料型態：String/10。"
* REPORT_RESULT.REPORT_LIST.IDNO ^maxLength = 10
* REPORT_RESULT.REPORT_LIST.IDNO ^example.label = "範例"
* REPORT_RESULT.REPORT_LIST.IDNO ^example.valueString = "A123456789"
* REPORT_RESULT.ERROR_LIST 0..* BackboneElement "錯誤清單" "失敗時，錯誤清單。"
* REPORT_RESULT.ERROR_LIST.ERROR_Code 1..1 string "錯誤代碼" "錯誤代碼。原規格資料型態：String/10。"
* REPORT_RESULT.ERROR_LIST.ERROR_Code ^maxLength = 10
* REPORT_RESULT.ERROR_LIST.ERROR_Code from CDCProcessingResult (extensible)
* REPORT_RESULT.ERROR_LIST.ERROR_Code ^example.label = "範例"
* REPORT_RESULT.ERROR_LIST.ERROR_Code ^example.valueString = "IDA3020002"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE 1..1 string "錯誤訊息" "錯誤訊息。原規格資料型態：String/2000。"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE ^maxLength = 2000
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE ^example.label = "範例"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE ^example.valueString = "個案資料-身分證統一編號必填"

Mapping: HISMsg02ModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "HISMsg02 JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: HISMsg02Model
Target: "http://hl7.org/fhir/R4"
* -> "Bundle-nidrs-response: Bundle；MessageHeader-nidrs-response: MessageHeader" "MessageHeader.eventCoding = CDCMessageEvent#HISMsg02"
* REPORT_RESULT -> "Bundle-nidrs-response: Bundle" "Bundle-nidrs-response 一則"
* REPORT_RESULT.STATUS -> "MessageHeader-nidrs-response: MessageHeader.response.code" "SUCCESS→response.code = ok；FAILURE→response.code = fatal-error"
* REPORT_RESULT.RESULT_TIME -> "Bundle-nidrs-response: Bundle.timestamp" "格式 yyyyMMdd HH:mi:ss 轉為 FHIR instant yyyy-MM-ddTHH:mm:ss+08:00(例：20250101 13:45:00→2025-01-01T13:45:00+08:00)"
* REPORT_RESULT.REPORT_LIST -> "Condition-nidrs-case-ref: Condition；Bundle-nidrs-response: Bundle.entry[condition]；MessageHeader-nidrs-response: MessageHeader.focus" "每一筆(每一通報疾病)建立一筆 Condition-nidrs-case-ref"
* REPORT_RESULT.REPORT_LIST.REPORT_ID -> "Condition-nidrs-case-ref: Condition.identifier[reportId].value" "system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id"
* REPORT_RESULT.REPORT_LIST.DISEASE_ID -> "Condition-nidrs-case-ref: Condition.code.coding.code" "system = CodeSystem cdc-disease"
* REPORT_RESULT.REPORT_LIST.IDNO -> "Condition-nidrs-case-ref: Condition.subject.identifier.value" "subject 以 identifier 參照(logical reference)；system 依證號種類同 Patient-nidrs.identifier，AA/BB/CC 自動編碼者使用 nidrs-temp-id"
* REPORT_RESULT.ERROR_LIST -> "OperationOutcome-nidrs: OperationOutcome.issue；MessageHeader-nidrs-response: MessageHeader.response.details" "每一筆錯誤對應一個 issue(severity = error)"
* REPORT_RESULT.ERROR_LIST.ERROR_Code -> "OperationOutcome-nidrs: OperationOutcome.issue.details.coding.code" "coding.system = CodeSystem cdc-processing-result；10 碼 = 項目代碼(6碼)+檢核代碼(4碼)，組成部分見 CDCProcessingResultPart；issue.code 依錯誤性質(必填→required、格式→value、重複通報→duplicate，其餘→processing)"
* REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE -> "OperationOutcome-nidrs: OperationOutcome.issue.diagnostics" "直接對應；可同時填入 issue.details.text"
