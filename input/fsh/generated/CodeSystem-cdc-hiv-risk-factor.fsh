CodeSystem: CDCHIVRiskFactor
Id: cdc-hiv-risk-factor
Title: "CDC-NIDRS-HIV危險因子代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「危險因子代碼(HIV)」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* ^property[0].code = #comment
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#comment"
* ^property[0].description = "代碼表備註(代碼處理方式)"
* ^property[0].type = #string
* #1 "性行為"
* #2 "血友病"
* #3 "注射藥癮者(不含搖頭族"
  * ^property[0].code = #comment
  * ^property[0].valueString = "原為：靜脈毒隱者"
* #4 "接受輸血者"
* #5 "母子垂直感染"
* #9 "不詳"
* #99 "其他"

ValueSet: CDCHIVRiskFactor
Id: cdc-hiv-risk-factor
Title: "CDC-NIDRS-HIV危險因子代碼值集"
Description: "CDC-NIDRS-HIV危險因子代碼值集，包含代碼系統 CDCHIVRiskFactor 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCHIVRiskFactor
