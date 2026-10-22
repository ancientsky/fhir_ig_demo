CodeSystem: CDCMaritalStatus
Id: cdc-marital-status
Title: "CDC-NIDRS-婚姻狀況代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「婚姻代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "未婚"
* #2 "已婚"
* #3 "喪偶"
* #4 "離婚"
* #5 "分居"
* #9 "未知"

ValueSet: CDCMaritalStatus
Id: cdc-marital-status
Title: "CDC-NIDRS-婚姻狀況代碼值集"
Description: "CDC-NIDRS-婚姻狀況代碼值集，包含代碼系統 CDCMaritalStatus 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCMaritalStatus
