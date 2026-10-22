CodeSystem: CDCQuarantineSiteType
Id: cdc-quarantine-site-type
Title: "CDC-NIDRS-隔離處所類型代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「隔離處所類型」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* ^property[0].code = #inactive
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#inactive"
* ^property[0].description = "停用、刪除或移除之代碼"
* ^property[0].type = #boolean
* ^property[1].code = #comment
* ^property[1].uri = "http://hl7.org/fhir/concept-properties#comment"
* ^property[1].description = "代碼表備註(代碼處理方式)"
* ^property[1].type = #string
* #A "收治醫院"
* #B "集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
* #C "加強型防疫旅館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
* #99 "一般型防疫旅館、地方檢疫所、居家或其他指定隔離處所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"

ValueSet: CDCQuarantineSiteType
Id: cdc-quarantine-site-type
Title: "CDC-NIDRS-隔離處所類型代碼值集"
Description: "CDC-NIDRS-隔離處所類型代碼值集，包含代碼系統 CDCQuarantineSiteType 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCQuarantineSiteType
