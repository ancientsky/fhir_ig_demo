CodeSystem: CDCDeathReason
Id: cdc-death-reason
Title: "CDC-NIDRS-個案死亡原因代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「死亡原因代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "直接原因"
* #2 "間接原因"
* #3 "其他"
* #4 "直接加間接"
* #5 "直接原因甲"
* #6 "直接原因乙"
* #7 "直接原因丙"

ValueSet: CDCDeathReason
Id: cdc-death-reason
Title: "CDC-NIDRS-個案死亡原因代碼值集"
Description: "CDC-NIDRS-個案死亡原因代碼值集，包含代碼系統 CDCDeathReason 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCDeathReason
