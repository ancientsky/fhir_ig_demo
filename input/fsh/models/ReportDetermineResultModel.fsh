// 表6 PushDetermineResult：研判結果主動通知(ReportDetermineResult)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: ReportDetermineResultModel
Id: ReportDetermineResultModel
Title: "研判結果主動通知(ReportDetermineResult)之資料模型"
Description: "NIDRS 表6 疾管署主動回饋個案研判結果至通報單位(Web Service PushDetermineResult，參數 ReportDetermineResult)之資料模型。原規格為 C# 類別定義，未列基數；本模型將識別欄位設為 1..1、其他參考型別(string、List)為選填，實值型別(int、bool、DateTime)不可為 null 故設為 1..1。"
* ^version = "0.1.0"
* ^status = #draft
* ReportId 1..1 string "通報單編號" "通報單編號。原規格資料型態：string。"
* ReportId ^example.label = "範例"
* ReportId ^example.valueString = "1140300012345"
* DiseaseId 0..1 string "通報疾病代碼" "通報疾病代碼。原規格資料型態：string。"
* DiseaseId from CDCDisease (required)
* DiseaseId ^example.label = "範例"
* DiseaseId ^example.valueString = "061"
* DetermineStatus 0..1 string "研判結果代碼" "研判結果代碼。原規格資料型態：string。"
* DetermineStatus from CDCDetermineStatus (required)
* DetermineStatus ^example.label = "範例"
* DetermineStatus ^example.valueString = "5"
* DetermineDate 0..1 string "研判時間" "研判時間(原規格未定義格式)。原規格資料型態：string。"
* IDNO 0..1 string "身分證號" "身分證號。原規格資料型態：string。"
* IDNO ^example.label = "範例"
* IDNO ^example.valueString = "A123456789"
* PHB_RECEIVED_DAY 0..1 string "衛生局收到日" "衛生局收到日(原規格未定義格式)。原規格資料型態：string。"
* CDC_RECEIVED_DATE 0..1 string "建檔日" "建檔日(原規格未定義格式)。原規格資料型態：string。"

Mapping: ReportDetermineResultModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "PushDetermineResult JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: ReportDetermineResultModel
Target: "http://hl7.org/fhir/R4"
* -> "Bundle-nidrs-push-determine-result: Bundle；MessageHeader-nidrs-push-determine-result: MessageHeader；Condition-nidrs-determine-result: Condition" "原為 Web Service PushDetermineResult(string jsonString)，回傳 Boolean(True 成功/False 失敗)；FHIR 以訊息 Bundle 傳送，MessageHeader.eventCoding = CDCMessageEvent#PushDetermineResult"
* ReportId -> "Condition-nidrs-determine-result: Condition.identifier[reportId].value" "system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id"
* DiseaseId -> "Condition-nidrs-determine-result: Condition.code.coding.code" "system = CodeSystem cdc-disease"
* DetermineStatus -> "Condition-nidrs-determine-result: Condition.extension[determineResult].extension[status].valueCodeableConcept.coding.code；Condition-nidrs-determine-result: Condition.verificationStatus" "system = CodeSystem cdc-determine-status；verificationStatus 依 ConceptMap cdc-determine-status-to-condition-ver-status 對應"
* DetermineDate -> "Condition-nidrs-determine-result: Condition.extension[determineResult].extension[date].valueDateTime" "轉為 FHIR dateTime(yyyy-MM-dd 或 yyyy-MM-ddTHH:mm:ss+08:00)"
* IDNO -> "Condition-nidrs-determine-result: Condition.subject.identifier.value" "subject 以 identifier 參照；system 依證號種類"
* PHB_RECEIVED_DAY -> "Condition-nidrs-determine-result: Condition.extension[phbReceivedDate].valueDate" "轉為 FHIR date(yyyy-MM-dd)"
* CDC_RECEIVED_DATE -> "Condition-nidrs-determine-result: Condition.extension[cdcReceivedDate].valueDate" "轉為 FHIR date(yyyy-MM-dd)"
