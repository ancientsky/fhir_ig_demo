// 表17 Report_ContactInfo：通報單聯絡資料(Report_ContactInfo)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: ReportContactInfoModel
Id: ReportContactInfoModel
Title: "通報單聯絡資料(Report_ContactInfo)之資料模型"
Description: "NIDRS 表17 通報單聯絡資料(Report_ContactInfo)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* CONTACT_TYPE 1..1 code "聯絡資料類型" "0:連絡電話/1:手機；連絡電話、手機皆必填。原規格資料型態：Code。"
* CONTACT_TYPE ^example.label = "範例"
* CONTACT_TYPE ^example.valueCode = #1
* CONTACT_VALUE 1..1 string "聯絡資料內容" "聯絡電話或手機號碼。原規格資料型態：String/100。"
* CONTACT_VALUE ^maxLength = 100
* CONTACT_VALUE ^example.label = "範例"
* CONTACT_VALUE ^example.valueString = "0912345678"

Mapping: ReportContactInfoModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "Report_ContactInfo JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: ReportContactInfoModel
Target: "http://hl7.org/fhir/R4"
* -> "Patient-nidrs: Patient.telecom" "每一筆聯絡資料對應一個 ContactPoint"
* CONTACT_TYPE -> "Patient-nidrs: Patient.telecom[phone|mobile]" "0(連絡電話)→telecom[phone](system = phone、use = home)；1(手機)→telecom[mobile](system = phone、use = mobile)；ConceptMap cdc-contact-type-to-contactpoint"
* CONTACT_VALUE -> "Patient-nidrs: Patient.telecom[phone|mobile].value" "直接對應；若無請填「無」"
