// 表18 Report_Travel：通報單旅遊史(Report_Travel)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: ReportTravelModel
Id: ReportTravelModel
Title: "通報單旅遊史(Report_Travel)之資料模型"
Description: "NIDRS 表18 通報單旅遊史(Report_Travel)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* TRAVEL_TYPE 1..1 code "旅遊類型" "旅遊類型；代碼：0.國內旅遊, 1.國外旅遊史, 2.國外居住史。原規格資料型態：Code。"
* TRAVEL_TYPE from CDCTravelType (required)
* TRAVEL_TYPE ^example.label = "範例"
* TRAVEL_TYPE ^example.valueCode = #1
* TRAVEL_AREA 1..1 code "地區" "地區；當旅遊類型為 0 填寫縣市代碼；1、2 填寫國家代碼。原規格資料型態：Code。"
* TRAVEL_AREA from NIDRSTravelArea (required)
* TRAVEL_AREA ^example.label = "範例"
* TRAVEL_AREA ^example.valueCode = #392
* TRAVEL_AREA_OTHER 0..1 string "其他國家" "其他國家；國外旅遊史/國外居住史國家代碼選擇其他時，本欄位必填。原規格資料型態：String/100。"
* TRAVEL_AREA_OTHER ^maxLength = 100
* TRAVEL_SUB_AREA 0..1 string "次級行政區" "次級行政區；國外旅遊史/國外居住史，可選填。原規格資料型態：String/100。"
* TRAVEL_SUB_AREA ^maxLength = 100
* TRAVEL_SUB_AREA ^example.label = "範例"
* TRAVEL_SUB_AREA ^example.valueString = "東京"
* TRAVEL_DATE_FROM 1..1 string "開始時間" "開始時間 Ex.2021/01/01；旅遊類型為「國外居住史」時，此欄位為「離境居住國日期」；日期檢核請參考共同欄位檢核條件。原規格資料型態：String/10。日期以原格式字串表達。"
* TRAVEL_DATE_FROM ^maxLength = 10
* TRAVEL_DATE_FROM ^example.label = "範例"
* TRAVEL_DATE_FROM ^example.valueString = "2025/07/20"
* TRAVEL_DATE_TO 1..1 string "結束時間" "結束時間 Ex.2021/01/01；旅遊類型為「國外居住史」時，此欄位為「入境我國日期」。原規格資料型態：String/10。日期以原格式字串表達。"
* TRAVEL_DATE_TO ^maxLength = 10
* TRAVEL_DATE_TO ^example.label = "範例"
* TRAVEL_DATE_TO ^example.valueString = "2025/07/27"

Mapping: ReportTravelModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "Report_Travel JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: ReportTravelModel
Target: "http://hl7.org/fhir/R4"
* -> "Observation-nidrs-travel: Observation" "每一筆旅遊史建立一筆 Observation-nidrs-travel(code = LOINC 8691-8)"
* TRAVEL_TYPE -> "Observation-nidrs-travel: Observation.component[travelType].valueCodeableConcept.coding" "coding.system = CodeSystem cdc-travel-type"
* TRAVEL_AREA -> "Observation-nidrs-travel: Observation.valueCodeableConcept.coding" "TRAVEL_TYPE = 0→system = cdc-county；1、2→system = cdc-country(invariant nidrs-trv-1)"
* TRAVEL_AREA_OTHER -> "Observation-nidrs-travel: Observation.valueCodeableConcept.text" "置於同一 CodeableConcept 之 text"
* TRAVEL_SUB_AREA -> "Observation-nidrs-travel: Observation.component[subArea].valueString" "直接對應"
* TRAVEL_DATE_FROM -> "Observation-nidrs-travel: Observation.effectivePeriod.start" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
* TRAVEL_DATE_TO -> "Observation-nidrs-travel: Observation.effectivePeriod.end" "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
