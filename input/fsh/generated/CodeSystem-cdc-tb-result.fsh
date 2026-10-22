CodeSystem: CDCTBResult
Id: cdc-tb-result
Title: "CDC-NIDRS-結核病檢驗結果代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「結核病檢驗結果代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。同一代碼可能用於多個檢驗項目，本代碼系統以「檢驗項目|代碼」作為唯一代碼，並以 item 屬性記錄對應檢驗項目。"
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
* ^property[2].code = #item
* ^property[2].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-tb-result#item"
* ^property[2].description = "對應檢驗項目"
* ^property[2].type = #string
* #"病理報告結果|D N" "疑似"
  * ^property[0].code = #comment
  * ^property[0].valueString = "v1.33調整"
  * ^property[1].code = #item
  * ^property[1].valueString = "病理報告結果"
* #"病理報告結果|L" "已驗未出"
  * ^property[0].code = #item
  * ^property[0].valueString = "病理報告結果"
* #"病理報告結果|N" "排除"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "v1.33刪除"
  * ^property[2].code = #item
  * ^property[2].valueString = "病理報告結果"
* #"病理報告結果|Y" "肺外結核"
  * ^property[0].code = #comment
  * ^property[0].valueString = "v1.33新增"
  * ^property[1].code = #item
  * ^property[1].valueString = "病理報告結果"
* #"病理報告結果|P" "肺內結核"
  * ^property[0].code = #comment
  * ^property[0].valueString = "v1.33新增"
  * ^property[1].code = #item
  * ^property[1].valueString = "病理報告結果"
* #"塗片結果|+" "陽性1+"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"塗片結果|2+" "陽性2+"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"塗片結果|3+" "陽性3+"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"塗片結果|4+" "陽性4+"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"塗片結果|-" "陰性"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"塗片結果|L" "已驗未出"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"塗片結果|S" "Scanty"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"塗片結果|U" "未驗"
  * ^property[0].code = #item
  * ^property[0].valueString = "塗片結果"
* #"PCR結果|+" "陽性"
  * ^property[0].code = #item
  * ^property[0].valueString = "PCR結果"
* #"PCR結果|-" "陰性"
  * ^property[0].code = #item
  * ^property[0].valueString = "PCR結果"
* #"PCR結果|L" "已驗未出"
  * ^property[0].code = #item
  * ^property[0].valueString = "PCR結果"
* #"PCR結果|U" "未驗"
  * ^property[0].code = #item
  * ^property[0].valueString = "PCR結果"
* #"培養結果|+" "陽性"
  * ^property[0].code = #item
  * ^property[0].valueString = "培養結果"
* #"培養結果|-" "陰性"
  * ^property[0].code = #item
  * ^property[0].valueString = "培養結果"
* #"培養結果|L" "已驗未出"
  * ^property[0].code = #item
  * ^property[0].valueString = "培養結果"
* #"培養結果|P" "汙染"
  * ^property[0].code = #item
  * ^property[0].valueString = "培養結果"
* #"培養結果|U" "未驗"
  * ^property[0].code = #item
  * ^property[0].valueString = "培養結果"
* #"培養結果|Z" "其他"
  * ^property[0].code = #item
  * ^property[0].valueString = "培養結果"
* #"菌種鑑定結果|M" "MTBC"
  * ^property[0].code = #item
  * ^property[0].valueString = "菌種鑑定結果"
* #"菌種鑑定結果|N" "NTM"
  * ^property[0].code = #item
  * ^property[0].valueString = "菌種鑑定結果"
* #"菌種鑑定結果|B" "無法判定"
  * ^property[0].code = #item
  * ^property[0].valueString = "菌種鑑定結果"
* #"菌種鑑定結果|9" "其他"
  * ^property[0].code = #item
  * ^property[0].valueString = "菌種鑑定結果"
* #"菌種鑑定結果|-" "MTBC陰性"
  * ^property[0].code = #item
  * ^property[0].valueString = "菌種鑑定結果"

ValueSet: CDCTBResult
Id: cdc-tb-result
Title: "CDC-NIDRS-結核病檢驗結果代碼值集"
Description: "CDC-NIDRS-結核病檢驗結果代碼值集，包含代碼系統 CDCTBResult 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCTBResult
