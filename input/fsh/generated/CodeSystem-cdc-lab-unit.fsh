CodeSystem: CDCLabUnit
Id: cdc-lab-unit
Title: "CDC-NIDRS-指定送驗單位-疾管署單位代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「指定送驗單位_疾管署單位代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #15 "中區管制中心"
* #19 "南區實驗室(台南)"
* #20 "南區實驗室(高雄)"
* #21 "東區管制中心"
* #22 "檢體單一窗口"
* #23 "衛生局"
* #F "資源管理組"
* #G "研究檢驗及疫苗研製中心"
* #26 "南區管制中心"
* #27 "高屏區管制中心"

ValueSet: CDCLabUnit
Id: cdc-lab-unit
Title: "CDC-NIDRS-指定送驗單位-疾管署單位代碼值集"
Description: "CDC-NIDRS-指定送驗單位-疾管署單位代碼值集，包含代碼系統 CDCLabUnit 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCLabUnit
