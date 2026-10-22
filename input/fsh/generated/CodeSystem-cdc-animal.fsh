CodeSystem: CDCAnimal
Id: cdc-animal
Title: "CDC-NIDRS-接觸動物種類代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「動物代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "羊"
* #2 "鼠"
* #3 "馬"
* #4 "雞"
* #5 "豬"
* #6 "猿猴"
* #7 "犬"
* #8 "牛"
* #9 "鹿"
* #10 "貓"
* #11 "鴨"
* #12 "鵝"
* #13 "鳥"
* #14 "鴿子"
* #15 "果子狸"
* #16 "水產動物"
* #17 "兔"
* #90 "其他"

ValueSet: CDCAnimal
Id: cdc-animal
Title: "CDC-NIDRS-接觸動物種類代碼值集"
Description: "CDC-NIDRS-接觸動物種類代碼值集，包含代碼系統 CDCAnimal 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCAnimal
