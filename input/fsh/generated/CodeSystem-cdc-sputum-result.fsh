CodeSystem: CDCSputumResult
Id: cdc-sputum-result
Title: "CDC-NIDRS-痰檢驗結果代碼(TB、MDRTB)"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「痰檢驗結果代碼(TB、MDRTB)」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。同一代碼可能用於多個檢驗項目，本代碼系統以「檢驗項目|代碼」作為唯一代碼，並以 item 屬性記錄對應檢驗項目。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* ^property[0].code = #item
* ^property[0].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-sputum-result#item"
* ^property[0].description = "對應檢驗項目"
* ^property[0].type = #string
* #"痰塗片檢驗結果|+" "陽性1+"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰塗片檢驗結果|2+" "陽性2+"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰塗片檢驗結果|3+" "陽性3+"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰塗片檢驗結果|4+" "陽性4+"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰塗片檢驗結果|-" "陰性"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰塗片檢驗結果|L" "已驗未出"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰塗片檢驗結果|S" "Scanty"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰塗片檢驗結果|U" "未驗"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰塗片檢驗結果"
* #"痰培養檢驗結果|+" "陽性"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養檢驗結果"
* #"痰培養檢驗結果|-" "陰性"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養檢驗結果"
* #"痰培養檢驗結果|L" "已驗未出"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養檢驗結果"
* #"痰培養檢驗結果|P" "汙染"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養檢驗結果"
* #"痰培養檢驗結果|U" "未驗"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養檢驗結果"
* #"痰培養檢驗結果|Z" "其他"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養檢驗結果"
* #"痰培養鑑定結果|M" "MTBC"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養鑑定結果"
* #"痰培養鑑定結果|N" "NTM"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養鑑定結果"
* #"痰培養鑑定結果|B" "無法判斷"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養鑑定結果"
* #"痰培養鑑定結果|9" "其他"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養鑑定結果"
* #"痰培養鑑定結果|-" "MTBC陰性"
  * ^property[0].code = #item
  * ^property[0].valueString = "痰培養鑑定結果"

ValueSet: CDCSputumResult
Id: cdc-sputum-result
Title: "CDC-NIDRS-痰檢驗結果代碼(TB、MDRTB)值集"
Description: "CDC-NIDRS-痰檢驗結果代碼(TB、MDRTB)值集，包含代碼系統 CDCSputumResult 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCSputumResult
