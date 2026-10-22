以下為本IG依作業情境提供之訊息範例。每一範例皆為完整之訊息 Bundle(`Bundle.type = message`)，Bundle 內含 MessageHeader 及該訊息所需之所有 Resource；範例中之代碼連結皆為代碼系統連結。

> 範例中之人名、身分證統一編號、病歷號碼、聯絡電話、通報單號及送驗單編號等皆為虛構資料，醫事機構代碼僅作示範用途；範例之通報內容不代表任何真實個案。

### 通報單新增(EMRMsg01)

- [通報單新增訊息-登革熱](Bundle-bundle-report-create-dengue.html)：依據[通報單新增-Bundle NIDRS Report Create](StructureDefinition-Bundle-nidrs-report-create.html) Profile 呈現通報單位通報一名登革熱境外移入疑似個案之範例，包含通報單(Composition)、通報個案(Patient)、通報疾病(Condition)、病患動向(Encounter)、職業與旅遊史等流行病學資料(Observation)、登革熱疾病增補欄位(QuestionnaireResponse)及通報單位、登錄者、診斷醫師。
- [通報單新增訊息-登革熱大量通報](Bundle-bundle-report-create-dengue-bulk.html)：依據附錄五「登革熱大量通報必填欄位縮減說明」，以[登革熱大量通報-Composition](StructureDefinition-Composition-nidrs-report-dengue-bulk.html)、[Patient](StructureDefinition-Patient-nidrs-dengue-bulk.html)及[Condition](StructureDefinition-Condition-nidrs-dengue-bulk.html) Profile 呈現必填欄位縮減(連絡電話、是否死亡、職業、有無症狀為非必填)之通報範例。

### 通報單修改(EMRMsg02)

- [通報單修改訊息](Bundle-bundle-report-update.html)：依據[通報單修改-Bundle NIDRS Report Update](StructureDefinition-Bundle-nidrs-report-update.html) Profile 呈現修改一筆已成立通報單之範例；通報疾病帶入原通報單號，並填寫修改原因(MODIFIED_REASON)。

### 通報單病歷資料傳送(EMRMsg03)

- [通報單病歷資料傳送訊息](Bundle-bundle-document.html)：依據[通報單病歷資料傳送-Bundle NIDRS Document](StructureDefinition-Bundle-nidrs-document.html) Profile 呈現以通報單號參照通報單，上傳 base64 編碼病歷檔案(DocumentReference)之範例。

### 通報單送驗新增(EMRMsg04)

- [通報單送驗新增訊息-法傳送驗單](Bundle-bundle-sample.html)：依據[通報單送驗新增-Bundle NIDRS Sample](StructureDefinition-Bundle-nidrs-sample.html) Profile 呈現法傳送驗單(SAMPLE)之範例，包含送驗單(ServiceRequest)、檢體(Specimen)、送驗單位、送驗人員及指定收件單位。
- [通報單送驗新增訊息-法傳TB送驗單](Bundle-bundle-sample-tb.html)：依據[通報單送驗新增-Bundle NIDRS Sample](StructureDefinition-Bundle-nidrs-sample.html) Profile 呈現法傳TB送驗單(TB_SAMPLE)之範例，包含送驗項目、結核病檢體類別及 TB 送驗個案資料。

### 疾管署回覆(HISMsg01~HISMsg04)

- [通報單新增結果-成功](Bundle-bundle-response-report-success.html)：依據[疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html) Profile 呈現通報單新增成功(HISMsg01，STATUS=SUCCESS)之回覆，以 Condition 列出疾管署產生之通報單號、通報疾病及個案證號(REPORT_LIST)。
- [通報單新增結果-失敗](Bundle-bundle-response-report-failure.html)：呈現通報單新增失敗(STATUS=FAILURE)之回覆，以 OperationOutcome 列出錯誤代碼及錯誤訊息(ERROR_LIST)。
- [通報單送驗新增結果-成功](Bundle-bundle-response-sample-success.html)：呈現送驗新增成功(HISMsg04，Success=true)之回覆，以 ServiceRequest 與 Specimen 回傳送驗清單(ReturnData.SAMPLE)，包含系統編號之送驗單編號。

### 疾管署主動通知

- [研判結果主動通知](Bundle-bundle-push-determine-result.html)：依據[研判結果主動通知-Bundle NIDRS Push Determine Result](StructureDefinition-Bundle-nidrs-push-determine-result.html) Profile 呈現疾管署通知通報單位個案研判結果異動(PushDetermineResult)之範例。
- [檢驗結果主動通知](Bundle-bundle-push-sample-result.html)：依據[檢驗結果主動通知-Bundle NIDRS Push Sample Result](StructureDefinition-Bundle-nidrs-push-sample-result.html) Profile 呈現疾管署通知通報單位送驗單綜合檢驗結果(PushSampleResult)之範例，包含血清學及病原體檢驗結果。

### 其他範例

上述 Bundle 所含之個別 Resource(例如通報單位 Organization、通報單登錄者 Practitioner、通報個案 Patient)亦各自列於[全部構件](artifacts.html)之範例(Examples)區段，可直接檢視。
