CodeSystem: CDCProcessingResultPart
Id: cdc-processing-result-part
Title: "CDC-NIDRS-處理結果代碼組成(項目代碼及檢核代碼)"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「處理結果」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #IDA301 "通報單-醫院資料"
* #IDA302 "通報單-個案資料"
* #IDA303 "通報單-病歷採檢與相關日期"
* #IDA304 "通報單-流行病學相關因子"
* #IDA305 "通報單-主要症狀"
* #IDA306 "通報單-通報疾病及附加資訊"
* #IDA311 "查詢通報單研判結果"
* #"3{disease}" "疾病增補資料"
* #0001 "代碼檢核：{欄位}必須為{清單}"
* #0002 "必填檢核：{欄位}必填寫"
* #0003 "長度檢核：{欄位}長度超過{長度}欄位長度"
* #0004 "數字檢核：{欄位}必須為數字"
* #0005 "數字檢核：{欄位}必須為數字(包含小數點)"
* #0006 "時間檢核：{欄位}時間格式不正確"
* #0007 "時間檢核：{欄位}時間時間不能大於今天 | {欄位}時間格式不正確"
* #0101 "連動檢核：{連動檢查錯誤}"

ValueSet: CDCProcessingResultPart
Id: cdc-processing-result-part
Title: "CDC-NIDRS-處理結果代碼組成(項目代碼及檢核代碼)值集"
Description: "CDC-NIDRS-處理結果代碼組成(項目代碼及檢核代碼)值集，包含代碼系統 CDCProcessingResultPart 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCProcessingResultPart
