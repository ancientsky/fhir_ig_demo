CodeSystem: CDCHIVDiagnosisDefinition
Id: cdc-hiv-diagnosis-definition
Title: "CDC-NIDRS-HIV確診定義代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「HIV確診定義代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。出生月齡定義：(通報單診斷年-個案出生年)*12 + (通報單診斷月-個案出生月) + 1。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* ^property[0].code = #comment
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#comment"
* ^property[0].description = "代碼表備註(代碼處理方式)"
* ^property[0].type = #string
* ^property[1].code = #applicable
* ^property[1].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-hiv-diagnosis-definition#applicable"
* ^property[1].description = "適用對象(出生月齡)"
* ^property[1].type = #string
* #1 "HIV-1/2抗體確認檢驗方法陽性"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "出生月齡 > 18"
* #2 "分子生物學核酸檢測(NAT)陽性(RTPCR)"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "出生月齡 > 18"
* #4 "出生通報母子垂直感染疑似個案"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "出生月齡 <= 18"
* #8 "分子生物學核酸檢測(NAT)陽性(DNAPCR)"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "出生月齡 <= 18"
* #16 "HIV抗原p24篩檢陽性，且進行中和試驗確認陽性"
  * ^property[0].code = #comment
  * ^property[0].valueString = "原出生月齡 > 1"
  * ^property[1].code = #applicable
  * ^property[1].valueString = "出生月齡 > 18"
* #32 "孕產婦快篩/初篩陽性"
  * ^property[0].code = #applicable
  * ^property[0].valueString = "出生月齡 > 18"

ValueSet: CDCHIVDiagnosisDefinition
Id: cdc-hiv-diagnosis-definition
Title: "CDC-NIDRS-HIV確診定義代碼值集"
Description: "CDC-NIDRS-HIV確診定義代碼值集，包含代碼系統 CDCHIVDiagnosisDefinition 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCHIVDiagnosisDefinition
