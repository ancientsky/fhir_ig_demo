CodeSystem: CDCTBSpecimenType
Id: cdc-tb-specimen-type
Title: "CDC-NIDRS-結核病檢體類別代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「結核病檢體類別」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "血液"
* #14 "痰"
* #20 "腦脊髓液"
* #23 "胸水"
* #24 "氣管洗出液"
* #81 "陽性培養菌株"
* #99 "其他"
* #188 "病理切片"
* #205 "消化去污後痰"

ValueSet: CDCTBSpecimenType
Id: cdc-tb-specimen-type
Title: "CDC-NIDRS-結核病檢體類別代碼值集"
Description: "CDC-NIDRS-結核病檢體類別代碼值集，包含代碼系統 CDCTBSpecimenType 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCTBSpecimenType
