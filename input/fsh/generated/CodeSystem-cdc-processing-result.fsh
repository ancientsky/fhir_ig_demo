CodeSystem: CDCProcessingResult
Id: cdc-processing-result
Title: "CDC-NIDRS-處理結果(錯誤)代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「處理結果」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。處理結果代碼 10 碼，由「項目代碼(6碼)」加「檢核代碼(4碼)」組成，例如 IDA3020002 = 通報單-個案資料(IDA302) + 必填檢核(0002)。本代碼系統收錄特殊處理代碼、各疾病通報檢核代碼與參考範例中之完整代碼；組成用之項目代碼與檢核代碼另見 CDCProcessingResultPart。"
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
* #SUCCESS "成功(STATUS)"
* #FAILURE "失敗(STATUS)"
* #IDA0000001 "通報成功{(補正)} | 查詢成功"
* #IDA0000002 "系統錯誤：請洽詢廠商協助；{錯誤訊息}"
* #IDA0000003 "系統訊息-電子簽章；電子簽章驗證失敗。{錯誤訊息}"
* #IDA0000004 "系統訊息-電子簽章；電子簽章解析失敗：無憑證。{錯誤訊息}"
* #IDA0000005 "系統訊息-電子簽章：未簽章。{錯誤訊息}"
* #IDA0000006 "重複通報：醫院({醫院名稱})，今天已通報過個案({ID})，疾病({疾病代碼})，通報單號({通報單號})"
* #IDA0000007 "疾病禁止通報：疾病({疾病代碼})已設定為為不允許通報"
* #LIMS000001 "通報成功"
* #LIMS000002 "通報失敗"
* #3007491001 "依據「急性無力肢體麻痺」通報定義，15歲以下孩童出現急性無力肢體麻痺現象時應通報，請協助同時通報「急性無力肢體麻痺」"
  * ^property[0].code = #comment
  * ^property[0].valueString = "若醫院端未處理同時通報多疾病功能，請先通報「急性無力肢體麻痺(小兒麻痺症監視指標) 」完成後，再通報「腸病毒感染併發重症」； 若醫院端可處理同時通報多疾病功能，請同時通報「急性無力肢體麻痺(小兒麻痺症監視指標)」與「腸病毒感染併發重症」。"
* #3NFluA1001 "依據「新型A型流感」通報定義，通報「新型A型流感」請協助同時通報「嚴重特殊傳染性肺炎」"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18刪除；(2023/3/27停用)；若醫院端未處理同時通報多疾病功能，請先通報「嚴重特殊傳染性肺炎」完成後，再通報「新型A型流感」； 若醫院端可處理同時通報多疾病功能，請同時通報「嚴重特殊傳染性肺炎」與「新型A型流感」。"
* #3000101001 "此証號之TB通報為重複通報"
  * ^property[0].code = #comment
  * ^property[0].valueString = "此証號已有指定醫院通報，並且等待指定醫院補正資料中，無需通報。"
* #3000101002 "此証號之TB通報為追管中個案"
  * ^property[0].code = #comment
  * ^property[0].valueString = "此証號為TB追管中個案，無需通報。"
* #3000421001 "通報單-AIDS資訊：此個案通報疾病AIDS，但未曾通報過疾病HIV。請先完成疾病HIV之通報。"
  * ^property[0].code = #comment
  * ^property[0].valueString = "若醫院端未處理同時通報多疾病功能，請先通報「HIV」完成後，再通報「AIDS」； 若醫院端可處理同時通報多疾病功能，請同時通報「HIV」與「AIDS」。"
* #IDA3010003 "通報單-醫院資料：「通報單位代碼」必填寫"
* #IDA3010002 "通報單-醫院資料：「診斷醫師」必填寫"
* #IDA3020002 "通報單-個案資料：患者「身份證字號/護照號碼」必填寫"
* #IDA3020003 "通報單-個案資料：「縣市」必填寫"
* #IDA3030101 "通報單-病歷採檢與相關日期：「發病日」不可大於「診斷日」"
* #IDA3030002 "通報單-病歷採檢與相關日期：「診斷日」必填寫"
* #IDA3030006 "通報單-病歷採檢與相關日期：「死亡日期」時間格式不正確"
* #IDA3040003 "通報單-流行病學相關因子：「是否有旅遊史」必填寫"
* #IDA3040002 "通報單-流行病學相關因子：「旅遊開始日期」必填寫"
* #IDA3040101 "通報單-流行病學相關因子：「接觸動物」必填"
* #30SARS0002 "「發病前10日，具有下列任一個條件」為必勾選其中一項。"
* #3000610101 "勾選「其他器官損傷」則「其他描述」必填寫"
* #3000900101 "「是否進行愛滋病毒篩檢：」為『有』或『是』時，則「篩檢日期」必填寫"
* #3000980002 "「B. 具備一種以上淋病雙球菌實驗室診斷：」為必勾選。"
* #30487a0101 "「抗病毒藥物開立」為『有』或『是』時，則「開立日」必填寫"
* #30487a0002 "「慢性疾病病史及相關危險因子：有、無」為必勾選其中一項。"
* #319CoV0002 "「慢性疾病病史：」為必勾選。"

ValueSet: CDCProcessingResult
Id: cdc-processing-result
Title: "CDC-NIDRS-處理結果(錯誤)代碼值集"
Description: "CDC-NIDRS-處理結果(錯誤)代碼值集，包含代碼系統 CDCProcessingResult 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCProcessingResult
