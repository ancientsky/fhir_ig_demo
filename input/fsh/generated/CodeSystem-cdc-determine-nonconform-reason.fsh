CodeSystem: CDCDetermineNonconformReason
Id: cdc-determine-nonconform-reason
Title: "CDC-NIDRS-研判結果「不符合疾病分類」細項代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「研判結果代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。本代碼系統為研判結果代碼 31「不符合疾病分類」之細項。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "陰性"
* #2 "不明"
* #3 "以前曾經感染或接種疫苗"
* #4 "排除"
* #5 "疑似病例"
* #6 "已驗出其它病原"
* #7 "急性初期感染"
* #8 "不符合通報定義"
* #9 "原檢體複驗陰性"
* #99 "其他"

ValueSet: CDCDetermineNonconformReason
Id: cdc-determine-nonconform-reason
Title: "CDC-NIDRS-研判結果「不符合疾病分類」細項代碼值集"
Description: "CDC-NIDRS-研判結果「不符合疾病分類」細項代碼值集，包含代碼系統 CDCDetermineNonconformReason 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCDetermineNonconformReason
