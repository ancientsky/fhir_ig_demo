CodeSystem: CDCResidenceType
Id: cdc-residence-type
Title: "CDC-NIDRS-非本國籍居民身分(居留)代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「居留代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #4 "外籍勞工"
* #5 "外籍人士"
* #6 "外籍配偶"
* #7 "大陸人士"
* #8 "大陸配偶"
* #9 "其他"
* #11 "未知"

ValueSet: CDCResidenceType
Id: cdc-residence-type
Title: "CDC-NIDRS-非本國籍居民身分(居留)代碼值集"
Description: "CDC-NIDRS-非本國籍居民身分(居留)代碼值集，包含代碼系統 CDCResidenceType 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCResidenceType
