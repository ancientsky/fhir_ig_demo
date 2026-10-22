// 表12 EMRMsg03：通報單病歷資料傳送作業傳送資料結構(EMRMsg03)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: EMRMsg03Model
Id: EMRMsg03Model
Title: "通報單病歷資料傳送作業傳送資料結構(EMRMsg03)之資料模型"
Description: "NIDRS 表12 傳染病通報單病歷資料傳送作業結構表-傳送資料結構(EMRMsg03)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* REPORT 1..1 BackboneElement "病歷資料" "通報單病歷資料。"
* REPORT.REPORT_ID 1..1 string "通報單號" "通報單號。原規格資料型態：String/13。"
* REPORT.REPORT_ID ^maxLength = 13
* REPORT.REPORT_ID ^example.label = "範例"
* REPORT.REPORT_ID ^example.valueString = "1140300012345"
* REPORT.HOSPITAL 1..1 string "通報醫院醫事機構代碼" "通報醫院醫事機構代碼。原規格資料型態：String/10。"
* REPORT.HOSPITAL ^maxLength = 10
* REPORT.HOSPITAL ^example.label = "範例"
* REPORT.HOSPITAL ^example.valueString = "0101090517"
* REPORT.FILE_NAME 1..1 string "病歷檔案名稱" "病歷檔案名稱。原規格資料型態：String/255。"
* REPORT.FILE_NAME ^maxLength = 255
* REPORT.FILE_NAME ^example.label = "範例"
* REPORT.FILE_NAME ^example.valueString = "出院病摘_20250810.pdf"
* REPORT.FILE_CATEGORY 1..1 code "檔案類別" "檔案類別；1:出院病摘、2:門診病歷、3:檢驗報告、4:醫療影像及報告、0:其他；若非前述檔案類型，則歸在0其他。原規格資料型態：Code。"
* REPORT.FILE_CATEGORY from CDCFileCategory (required)
* REPORT.FILE_CATEGORY ^example.label = "範例"
* REPORT.FILE_CATEGORY ^example.valueCode = #1
* REPORT.FILE_TYPE 1..1 code "檔案類型" "檔案類型；1:docx、2:pdf、3:odt。原規格資料型態：Code。"
* REPORT.FILE_TYPE ^example.label = "範例"
* REPORT.FILE_TYPE ^example.valueCode = #2
* REPORT.ANAMNESIS 1..1 string "病歷資料" "病歷資料，以base64編碼。原規格資料型態：String。"
* REPORT.ANAMNESIS ^example.label = "範例"
* REPORT.ANAMNESIS ^example.valueString = "JVBERi0xLjQK"

Mapping: EMRMsg03ModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "EMRMsg03 JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: EMRMsg03Model
Target: "http://hl7.org/fhir/R4"
* -> "Bundle-nidrs-document: Bundle；MessageHeader-nidrs-document: MessageHeader" "Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg03"
* REPORT -> "DocumentReference-nidrs: DocumentReference" "建立一筆 DocumentReference-nidrs"
* REPORT.REPORT_ID -> "DocumentReference-nidrs: DocumentReference.context.related.identifier.value" "context.related 以 identifier(system = nidrs-report-id)參照 Condition-nidrs-case-ref，Bundle 內不需附 Condition"
* REPORT.HOSPITAL -> "Organization-nidrs-hospital: Organization.identifier[hospitalCode].value；DocumentReference-nidrs: DocumentReference.custodian；MessageHeader-nidrs-document: MessageHeader.sender" "建立 Organization-nidrs-hospital(Bundle.entry[organization])，custodian 與 MessageHeader.sender 參照之"
* REPORT.FILE_NAME -> "DocumentReference-nidrs: DocumentReference.content.attachment.title" "直接對應"
* REPORT.FILE_CATEGORY -> "DocumentReference-nidrs: DocumentReference.category.coding.code" "system = CodeSystem cdc-file-category"
* REPORT.FILE_TYPE -> "DocumentReference-nidrs: DocumentReference.content.attachment.contentType" "轉為 MIME type：1→application/vnd.openxmlformats-officedocument.wordprocessingml.document；2→application/pdf；3→application/vnd.oasis.opendocument.text(ValueSet NIDRSFileMimeType)"
* REPORT.ANAMNESIS -> "DocumentReference-nidrs: DocumentReference.content.attachment.data" "base64 字串直接填入 base64Binary"
