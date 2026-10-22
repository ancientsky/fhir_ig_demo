// ============================================================
// 範例4：通報單病歷資料傳送(EMRMsg03)－登革熱個案出院病摘
// 情境：範例1之登革熱個案(通報單號 1150123456789)於 2026-01-25 出院，
// 臺大醫院上傳出院病摘 PDF 檔案。原規格不傳送個案資料，故以個案證號
// (identifier)參照個案、以通報單號(identifier)參照通報單。
// ============================================================

Instance: docref-dengue-discharge
InstanceOf: DocumentReferenceNIDRS
Usage: #inline
Title: "通報單病歷資料-登革熱出院病摘"
Description: "病歷資料傳送範例：檔案類別 1 出院病摘、檔案類型 pdf(以 base64 編碼)，並以通報單號參照通報單。"
* status = #current
* type = $LNC#18842-5 "Discharge summary"
* category = CDCFileCategory#1 "出院病摘"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"
* date = "2026-01-25T16:40:00+08:00"
* author = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* custodian = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* description = "登革熱個案出院病摘"
* content.attachment.contentType = #application/pdf
* content.attachment.language = #zh-TW
* content.attachment.data = "JVBERi0xLjQKMSAwIG9iajw8L1R5cGUvQ2F0YWxvZy9QYWdlcyAyIDAgUj4+ZW5kb2JqCjIgMCBvYmo8PC9UeXBlL1BhZ2VzL0tpZHNbXS9Db3VudCAwPj5lbmRvYmoKdHJhaWxlcjw8L1Jvb3QgMSAwIFI+PgolJUVPRgo="
* content.attachment.title = "出院病摘_1150123456789_20260125.pdf"
* content.attachment.creation = "2026-01-25T16:30:00+08:00"
* context.period.start = "2026-01-14"
* context.period.end = "2026-01-25"
* context.related.type = "Condition"
* context.related.identifier.type = CDCIdentifierType#nidrs-report "NIDRS通報單號"
* context.related.identifier.system = $NIDRSReportId
* context.related.identifier.value = "1150123456789"
* context.related.display = "登革熱通報單 1150123456789"

Instance: mh-document
InstanceOf: MessageHeaderNIDRSDocument
Usage: #inline
Title: "通報單病歷資料傳送訊息表頭"
Description: "通報單病歷資料傳送作業(EMRMsg03)之訊息表頭範例。"
* eventCoding = CDCMessageEvent#EMRMsg03 "通報單病歷檔案上傳"
* destination[0].name = "疾病管制署傳染病通報系統"
* destination[0].endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* sender = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* source.name = "臺大醫院醫療資訊系統"
* source.endpoint = "https://his.ntuh.example.org.tw/nidrs"
* focus[0] = Reference(docref-dengue-discharge)

Instance: bundle-document
InstanceOf: BundleNIDRSDocument
Usage: #example
Title: "通報單病歷資料傳送訊息(EMRMsg03)"
Description: "通報單病歷資料傳送作業(EMRMsg03)範例：上傳登革熱個案(通報單號 1150123456789)之出院病摘 PDF。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140125165012789"
* type = #message
* timestamp = "2026-01-25T16:50:12.789+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-document"
* entry[0].resource = mh-document
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/DocumentReference/docref-dengue-discharge"
* entry[1].resource = docref-dengue-discharge
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Organization/org-ntuh"
* entry[2].resource = org-ntuh
