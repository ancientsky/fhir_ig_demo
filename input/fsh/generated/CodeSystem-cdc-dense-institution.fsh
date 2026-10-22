CodeSystem: CDCDenseInstitution
Id: cdc-dense-institution
Title: "CDC-NIDRS-人口密集機構類別代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「人口密集機構類別代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
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
* #1 "老人安養"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #2 "護理之家"
* #3 "身心障礙福利"
* #4 "托嬰中心"
* #5 "康復之家"
* #6 "少年福利"
* #7 "矯正機關"
* #8 "育幼院"
* #9 "收容或暫置中心"
* #10 "榮譽國民之家"

ValueSet: CDCDenseInstitution
Id: cdc-dense-institution
Title: "CDC-NIDRS-人口密集機構類別代碼值集"
Description: "CDC-NIDRS-人口密集機構類別代碼值集，包含代碼系統 CDCDenseInstitution 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCDenseInstitution
