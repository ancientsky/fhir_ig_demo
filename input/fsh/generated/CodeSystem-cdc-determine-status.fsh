CodeSystem: CDCDetermineStatus
Id: cdc-determine-status
Title: "CDC-NIDRS-研判結果代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「研判結果代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
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
* #0 "尚無研判結果"
* #1 "陰性"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #2 "不明"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #3 "檢驗中"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #4 "檢驗結果陽性，病名尚無法研判"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #5 "陽性"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #6 "未確定，需再採檢"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #7 "以前曾經感染或接種疫苗"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #8 "排除"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #9 "未知"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #10 "疑似病例"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #11 "可能病例"
* #12 "未決"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #13 "待審"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #15 "簡單通報疾病不需研判"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #16 "確定，不列入統計"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #19 "不明(審查)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #20 "舊案復發不列入統計"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #21 "以前曾感染並已產生抗體"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #22 "極可能病例"
* #23 "陽性(大於15歲)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #24 "調查病例"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #25 "小兒麻痺症確定病例"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #26 "AFP確定病例"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #27 "已驗出其它病原"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #28 "確診"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #29 "以前曾經感染"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #98 "其他"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #30 "確定病例"
* #31 "不符合疾病分類"
* #32 "檢出法傳病原體"
* #33 "未檢出法傳病原體"
* #34 "無檢驗結果"

ValueSet: CDCDetermineStatus
Id: cdc-determine-status
Title: "CDC-NIDRS-研判結果代碼值集"
Description: "CDC-NIDRS-研判結果代碼值集，包含代碼系統 CDCDetermineStatus 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCDetermineStatus
