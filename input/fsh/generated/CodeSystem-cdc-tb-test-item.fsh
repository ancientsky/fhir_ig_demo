CodeSystem: CDCTBTestItem
Id: cdc-tb-test-item
Title: "CDC-NIDRS-結核病送驗項目代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「結核病送驗項目代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #0 "抹片"
* #1 "培養"
* #2 "菌種鑑定"
* #3 "一線藥敏"
* #4 "二線藥敏"
* #5 "MDR"
* #6 "群聚事件"
* #7 "分生檢測"
* #8 "分子快速檢測"
* #9 "IGRA"
* #10 "其他"

ValueSet: CDCTBTestItem
Id: cdc-tb-test-item
Title: "CDC-NIDRS-結核病送驗項目代碼值集"
Description: "CDC-NIDRS-結核病送驗項目代碼值集，包含代碼系統 CDCTBTestItem 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCTBTestItem
