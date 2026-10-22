本頁說明「NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書」V1.42 第二章「系統描述」與第三章「功能流程」之內容，以及各項功能在本IG中所對應之 FHIR 訊息。原規格之 JSON 欄位與 FHIR 資料項目之逐欄對應請參考[欄位對應(JSON→FHIR)](mapping.html)。

> 本頁中標示為 **【本IG建議】** 或 **【假設】** 之內容為本非官方示範IG之設計，原工作說明書並未規定；實際介接請以疾管署公告為準。

### 系統架構與連線方式

#### 網路架構
<img src="fig01-network.jpeg" alt="圖1 通訊網路架構圖" style="display:block; margin-left:auto; margin-right:auto; max-width:70%;"/>
<p style="text-align:center">圖1 通訊網路架構圖(取自工作說明書)</p>

依工作說明書「系統架構/連線設定說明」：

- 通報單位與傳染病自動通報系統之間透過 **Web API** 方式傳送資料，以 **JSON** 格式進行文件傳遞。
- 疾管署端架設 Web API 伺服器接收通報單位端的電子通報單；院所端需準備 JSON 發送程式，另亦可準備一個 Web API 伺服器接收疾管署端的回送訊息(研判結果、檢驗結果主動通知)。
- 為確保雙方之間連線被允許，通報單位需提供**固定 IP** 位置給疾管署；傳染病自動通報系統亦設有固定 IP，通報單位端需開放防火牆。

工作說明書所列之 Web API 位址如下(本IG未定義其他端點)：

| 環境 | 傳染病自動通報 WEB API | Open API Spec |
|---|---|---|
| 測試環境 | `https://SmartIDA-EMRtst.cdc.gov.tw/EMR2/` | `https://SmartIDA-EMRtst.cdc.gov.tw/EMR2/swagger` |
| 正式環境 | `https://NIDRSemr.cdc.gov.tw/EMR2/` | `https://NIDRSemr.cdc.gov.tw/EMR2/Swagger` |
{:.grid}

上述端點為現行(非 FHIR)JSON Web API。疾管署目前並未提供 FHIR 端點；下文所述之 `[base]/$process-message` 為本IG之示範設計，`[base]` 代表未來若提供 FHIR 介面時之服務根路徑。

#### 資料交換標準流程

<img src="fig02-hospital-flow.png" alt="圖2 通報單位端系統流程" style="display:block; margin-left:auto; margin-right:auto; max-width:70%;"/>
<p style="text-align:center">圖2 通報單位端系統流程(取自工作說明書)</p>

通報單位端：以系統資料製作電子通報單、送驗資料或個案病歷資料 → 以醫事機構(軟體)憑證進行電子簽章(JWS) → 以 HTTP POST 送至 NIDRS → 取得並處理回應之通報處理結果。

<img src="fig03-cdc-flow.png" alt="圖3 疾管署端處理流程" style="display:block; margin-left:auto; margin-right:auto; max-width:70%;"/>
<p style="text-align:center">圖3 疾管署端處理流程(取自工作說明書)</p>

疾管署端：接收 JWS 格式之通報資料 → 電子簽章驗章(失敗即回覆錯誤訊息) → 通報/病歷資料進行 JSON 語意邏輯檢查(失敗即回覆通報檢核錯誤)後完成處理並回覆通報單號/通報日期；送驗資料則轉至實驗室資訊管理系統(LIMS)處理，接收送驗處理結果後回覆。

### FHIR 訊息與傳輸方式

#### 訊息結構
本IG將每一次交換定義為 [FHIR Message](http://hl7.org/fhir/R4/messaging.html)：

- `Bundle.type` 固定為 `message`；`Bundle.identifier` 為訊息唯一識別碼(system 為 `https://www.cdc.gov.tw/`)。通報單位發出之訊息，其值沿用 TWIDIR 規則：**醫事機構代碼(10碼) + 月日時分秒毫秒 MMddHHmmssSSS(13碼)，共 23 碼**；`Bundle.timestamp` 為訊息產生時間。
- 第一筆 entry 為 MessageHeader，`MessageHeader.eventCoding` 使用 [CDC-NIDRS-訊息事件](CodeSystem-cdc-message-event.html) 代碼標示原規格之訊息代碼；`MessageHeader.sender` 為通報單位(醫事機構)；`MessageHeader.focus` 指向訊息之主要內容(通報單、病歷檔案、送驗單、研判結果或檢驗結果)。
- 疾管署之回覆訊息以 `MessageHeader.response` 表達處理狀態：`response.identifier` 為所回覆請求訊息之 `MessageHeader.id`，`response.code` 為 `ok`(原規格 STATUS=SUCCESS / Success=true)或 `fatal-error`(STATUS=FAILURE / Success=false)，失敗時以 `response.details` 參照 [OperationOutcome](StructureDefinition-OperationOutcome-nidrs.html)，其 `issue.details` 為原規格之錯誤代碼(ERROR_Code，見 [CDC-NIDRS-處理結果(錯誤)代碼](CodeSystem-cdc-processing-result.html))、`issue.diagnostics` 為錯誤訊息(ERROR_MESSAGE)。`Bundle.timestamp` 對應處理日期(RESULT_TIME)。

#### 傳輸方式【本IG建議】

| 方向 | 原規格 | 本IG建議之 FHIR 傳輸 |
|---|---|---|
| 通報單位 → 疾管署(EMRMsg01~04) | 以醫事機構憑證簽章為 JWT(JWS)後，以 HTTP POST 呼叫 EMR2 Web API；同步取得 HISMsg01~04 回應 | `POST [base]/$process-message`，請求內容為該作業之訊息 Bundle；Bundle 之 JSON 序列化結果作為 JWS 之 payload，以醫事機構憑證簽章後傳送(見[安全性](security.html))。疾管署以同步回應(HTTP 200)回傳 [疾管署回覆-Bundle](StructureDefinition-Bundle-nidrs-response.html) |
| 疾管署 → 通報單位(研判結果、檢驗結果主動通知) | 疾管署呼叫醫院端 Web Service `PushDetermineResult` / `PushSampleResult`，參數 `string jsonString`(JSON 序列化字串)，回傳 `Boolean`(True=成功，False=失敗) | 疾管署以 `POST [hospital-base]/$process-message` 傳送主動通知訊息 Bundle 至醫院端接收服務；醫院端成功接收時回應 **HTTP 200**(對應原規格回傳 True)，處理失敗時回應 HTTP 4xx/5xx 並可附 OperationOutcome(對應原規格回傳 False) |
{:.grid}

補充說明：

- 原規格之「電子簽章驗章」失敗、「JSON 語意邏輯檢查」失敗等業務錯誤，皆以回應訊息(HISMsg)回覆。為與原規格一致，**【本IG建議】**此類錯誤仍以 HTTP 200 回傳回覆 Bundle，並以 `MessageHeader.response.code = fatal-error` 及 OperationOutcome(例如 `IDA0000003` 電子簽章驗證失敗、`IDA0000005` 未簽章)表達；HTTP 4xx/5xx 僅用於無法產生回覆訊息之傳輸層或系統錯誤。
- 原規格通報單新增一次可傳送多筆通報單(REPORTS 1..10)，回應之 REPORT_RESULT 亦為 1..10，每筆通報單各自有處理狀態。FHIR `MessageHeader.response` 僅有單一 `code`，因此 **【假設】** 每一通報單之處理結果以一筆 OperationOutcome 表達(成功之通報單另以 [通報單參照-Condition](StructureDefinition-Condition-nidrs-case-ref.html) 列出其通報單號)，`response.code` 於全部成功時為 `ok`，任一筆失敗時為 `fatal-error`。此部分成功之表達方式原規格未有對應，實作前應與疾管署確認。
- 工作說明書表3(通報單修改)步驟3記載驗章失敗以「HISMsg01」回覆，應為 HISMsg02 之誤植；本IG以 HISMsg02 表達。

### 各功能作業流程

#### 1. 通報單新增作業

<img src="fig04-report-create.png" alt="圖4 通報單新增作業" style="display:block; margin-left:auto; margin-right:auto; max-width:60%;"/>
<p style="text-align:center">圖4 通報單新增作業(取自工作說明書)</p>

| 步驟 | 步驟名稱 | 說明(依工作說明書表2) |
|---|---|---|
| 1 | 完整通報資料 | 通報單位依傳染病防治法於規定時間內將個案通報至疾管署，彙整 HIS 中個案之相關資訊，產出傳染病通報單。 |
| 2 | 電子簽章 | 通報單位以醫事機構憑證對完整通報資料進行電子簽章(JWT 格式)，再透過 EMRMsg01 傳送至疾管署。 |
| 3 | 電子簽章驗章 | 疾管署對接收之資料進行驗章，無法通過驗章時，以 HISMsg01 回覆錯誤訊息。 |
| 4 | JSON 語意邏輯檢查 | 疾管署進行資料與格式驗證，無法通過時，以 HISMsg01 回覆錯誤訊息。 |
| 5 | 完成通報單處理 | 疾管署確認通報單資訊正確無誤後，將個案資料登錄至系統。 |
| 6 | 回覆通報結果 | 疾管署自動產生通報單電腦編號(通報單號)，透過 HISMsg01 回覆醫療院所。 |
| 7 | 處理通報結果 | 通報單位收到 HISMsg01 後，進行通報結果處置。 |
{:.grid}

FHIR 訊息對應：

| 項目 | 請求(EMRMsg01) | 回覆(HISMsg01) |
|---|---|---|
| Bundle Profile | [通報單新增-Bundle NIDRS Report Create](StructureDefinition-Bundle-nidrs-report-create.html) | [疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html) |
| MessageHeader Profile | [MessageHeader NIDRS Report Create](StructureDefinition-MessageHeader-nidrs-report-create.html) | [MessageHeader NIDRS Response](StructureDefinition-MessageHeader-nidrs-response.html) |
| eventCoding | `EMRMsg01` | `HISMsg01` |
| 主要內容 | `focus`：1~10 份 [傳染病個案通報單-Composition](StructureDefinition-Composition-nidrs-report.html)(或[登革熱大量通報](StructureDefinition-Composition-nidrs-report-dengue-bulk.html))，及其引用之 Patient、Condition(每一通報疾病一筆)、Encounter、Observation、QuestionnaireResponse、RelatedPerson、Organization、Practitioner、PractitionerRole | 成功：每一通報疾病之通報單號(REPORT_ID)、通報疾病(DISEASE_ID)、個案證號(IDNO)以 [Condition NIDRS Case Reference](StructureDefinition-Condition-nidrs-case-ref.html) 表達；失敗：錯誤清單(ERROR_LIST)以 OperationOutcome 表達 |
{:.grid}

通報單位應保存回覆之通報單號(`Condition.identifier`，system `https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id`)，供後續通報單修改、病歷資料傳送、送驗新增及接收主動通知時比對。

#### 2. 通報單修改作業

<img src="fig05-report-update.png" alt="圖5 通報單修改作業" style="display:block; margin-left:auto; margin-right:auto; max-width:60%;"/>
<p style="text-align:center">圖5 通報單修改作業(取自工作說明書)</p>

| 步驟 | 步驟名稱 | 說明(依工作說明書表3) |
|---|---|---|
| 1 | 完整通報資料 | 通報單位彙整 HIS 中有異動之個案資訊，產出傳染病通報單異動內容。 |
| 2 | 電子簽章 | 以醫事機構憑證進行電子簽章(JWT 格式)，透過 EMRMsg02 傳送至疾管署。 |
| 3 | 電子簽章驗章 | 疾管署驗章，無法通過時回覆錯誤訊息。 |
| 4 | JSON 語意邏輯檢查 | 疾管署進行資料與格式驗證，無法通過時以 HISMsg02 回覆錯誤訊息。 |
| 5 | 檢查是否允許 EMR 修改 | 當通報單之通報來源為 EMR 時，允許透過 EMR **修改一次**；無法通過時以 HISMsg02 回覆錯誤訊息。 |
| 6 | 完成通報單處理 | 疾管署確認通報單資訊正確無誤後，進行通報單修改。 |
| 7 | 回覆通報結果 | 疾管署修改通報單後，透過 HISMsg02 回覆醫療院所。 |
| 8 | 處理通報結果 | 通報單位收到 HISMsg02 後，進行通報結果處置。 |
{:.grid}

FHIR 訊息對應：

| 項目 | 請求(EMRMsg02) | 回覆(HISMsg02) |
|---|---|---|
| Bundle Profile | [通報單修改-Bundle NIDRS Report Update](StructureDefinition-Bundle-nidrs-report-update.html) | [疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html) |
| MessageHeader Profile | [MessageHeader NIDRS Report Update](StructureDefinition-MessageHeader-nidrs-report-update.html) | [MessageHeader NIDRS Response](StructureDefinition-MessageHeader-nidrs-response.html) |
| eventCoding | `EMRMsg02` | `HISMsg02` |
| 主要內容 | `focus`：1 份 [傳染病個案通報單修改-Composition](StructureDefinition-Composition-nidrs-report-update.html)；一次修改一筆通報單，修改原因(MODIFIED_REASON)必填、備註(NOTE)不可填寫；通報疾病 [Condition NIDRS Update](StructureDefinition-Condition-nidrs-update.html) 必須帶入原通報單號 | 同通報單新增 |
{:.grid}

#### 3. 通報單病歷資料傳送作業

<img src="fig06-medical-record.png" alt="圖6 通報單病歷資料作業" style="display:block; margin-left:auto; margin-right:auto; max-width:60%;"/>
<p style="text-align:center">圖6 通報單病歷資料作業(取自工作說明書)</p>

| 步驟 | 步驟名稱 | 說明(依工作說明書表4) |
|---|---|---|
| 1 | 完整通報資料 | 通報單位彙整 HIS 中個案病歷資料，產出傳染病通報單病歷檔。 |
| 2 | 電子簽章 | 以醫事機構憑證進行電子簽章(JWT 格式)，透過 EMRMsg03 傳送至疾管署。 |
| 3 | 電子簽章驗章 | 疾管署驗章，無法通過時以 HISMsg03 回覆錯誤訊息。 |
| 4 | JSON 語意邏輯檢查 | 疾管署進行資料與格式驗證，無法通過時以 HISMsg03 回覆錯誤訊息。 |
| 5 | 完成通報單處理 | 疾管署確認資訊正確無誤後，儲存通報單病歷資料。 |
| 6 | 回覆通報結果 | 疾管署儲存病歷資料後，透過 HISMsg03 回覆醫療院所。 |
| 7 | 處理通報結果 | 通報單位收到 HISMsg03 後，進行通報結果處置。 |
{:.grid}

FHIR 訊息對應：

| 項目 | 請求(EMRMsg03) | 回覆(HISMsg03) |
|---|---|---|
| Bundle Profile | [通報單病歷資料傳送-Bundle NIDRS Document](StructureDefinition-Bundle-nidrs-document.html) | [疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html) |
| MessageHeader Profile | [MessageHeader NIDRS Document](StructureDefinition-MessageHeader-nidrs-document.html) | [MessageHeader NIDRS Response](StructureDefinition-MessageHeader-nidrs-response.html) |
| eventCoding | `EMRMsg03` | `HISMsg03` |
| 主要內容 | `focus`：[通報單病歷資料-DocumentReference](StructureDefinition-DocumentReference-nidrs.html)；檔案類別(FILE_CATEGORY)、檔案類型(docx/pdf/odt)、檔名及 base64 編碼之病歷檔案(ANAMNESIS)，以 `context.related` 之通報單號參照通報單 | 成功或失敗(原規格 HISMsg03 無 REPORT_LIST) |
{:.grid}

#### 4. 通報單送驗新增作業

<img src="fig07-sample.png" alt="圖7 通報單送驗作業" style="display:block; margin-left:auto; margin-right:auto; max-width:60%;"/>
<p style="text-align:center">圖7 通報單送驗作業(取自工作說明書)</p>

| 步驟 | 步驟名稱 | 說明(依工作說明書表5) |
|---|---|---|
| 1 | 送驗資料 | 通報單位彙整 HIS 中個案之相關資訊，產出傳染病通報單送驗資料。 |
| 2 | 電子簽章 | 以醫事機構憑證進行電子簽章(JWT 格式)，透過 EMRMsg04 傳送至疾管署。 |
| 3 | 電子簽章驗章 | 疾管署驗章，無法通過時以 HISMsg04 回覆錯誤訊息。 |
| 4 | 送驗單處理 | 疾管署將送驗資料轉至實驗室資訊管理系統(LIMS)處理。 |
| 5 | 接收送驗處理結果 | LIMS 回覆送驗單處理結果至傳染病通報系統，儲存送驗結果。 |
| 6 | 回覆通報結果 | 傳染病通報系統儲存送驗結果後，透過 HISMsg04 回覆醫療院所。 |
| 7 | 處理通報結果 | 通報單位收到 HISMsg04 後，進行通報結果處置。 |
{:.grid}

FHIR 訊息對應：

| 項目 | 請求(EMRMsg04) | 回覆(HISMsg04) |
|---|---|---|
| Bundle Profile | [通報單送驗新增-Bundle NIDRS Sample](StructureDefinition-Bundle-nidrs-sample.html) | [疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html) |
| MessageHeader Profile | [MessageHeader NIDRS Sample](StructureDefinition-MessageHeader-nidrs-sample.html) | [MessageHeader NIDRS Response](StructureDefinition-MessageHeader-nidrs-response.html) |
| eventCoding | `EMRMsg04` | `HISMsg04` |
| 主要內容 | `focus`：法傳送驗單 [ServiceRequest NIDRS Sample](StructureDefinition-ServiceRequest-nidrs-sample.html)(SAMPLE，需以法傳通報單號參照通報單)或法傳TB送驗單 [ServiceRequest NIDRS TB Sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html)(TB_SAMPLE，非通報個案可不填通報單號)；檢體 [Specimen NIDRS](StructureDefinition-Specimen-nidrs.html) / [Specimen NIDRS TB](StructureDefinition-Specimen-nidrs-tb.html)；送驗單位與指定收件單位 Organization | 原規格 HISMsg04 結構與 HISMsg01~03 不同(Success、Message、Exception、ReturnData)：Success 對應 `response.code`；Message/Exception 對應 OperationOutcome；成功時之 ReturnData.SAMPLE 以 ServiceRequest(含系統編號之送驗單編號 BarCode、建立日 CREATE_DAY)及 Specimen 回傳 |
{:.grid}

送驗單編號(BarCode)可由院方填寫疾管署所發放之條碼(XX-XXX-XXXXXX 共 13 碼)，未填時由系統於送驗單新增成功時自動編號(15 碼數字)，以 `ServiceRequest.identifier`(system `https://lims.cdc.gov.tw/`，與 TWIDIR 相同)表達。若院方無自行產生檢體條碼貼紙，需透過實驗室資訊管理系統列印檢體條碼及送驗清單(附錄三，非資料交換範圍)。

#### 5. 疾管署主動回饋個案研判結果至通報單位

<img src="fig08-determine-result.png" alt="圖8 個案研判結果回送" style="display:block; margin-left:auto; margin-right:auto; max-width:40%;"/>
<p style="text-align:center">圖8 個案研判結果回送(取自工作說明書)</p>

| 步驟 | 步驟名稱 | 說明(依工作說明書表6) |
|---|---|---|
| 1 | 研判結果異動 | 當個案研判資訊有異動時，疾管署系統將研判結果透過 Web Service 發送給通報單位。 |
| 2 | 傳送研判結果 | 醫院端需開發一個 Web Service 供疾管署程式傳送資料。功能名稱 `PushDetermineResult`；傳送參數 `string jsonString`(ReportDetermineResult 之 JSON 序列化字串)；回傳值 Boolean(True=成功，False=失敗)。 |
| 3 | 傳送參數定義 | ReportDetermineResult：ReportId(通報單編號)、DiseaseId(通報疾病代碼)、DetermineStatus(研判結果代碼)、DetermineDate(研判時間)、IDNO(身分證號)、PHB_RECEIVED_DAY(衛生局收到日)、CDC_RECEIVED_DATE(建檔日)。 |
{:.grid}

FHIR 訊息對應：

| 項目 | 主動通知(疾管署 → 通報單位) |
|---|---|
| Bundle Profile | [研判結果主動通知-Bundle NIDRS Push Determine Result](StructureDefinition-Bundle-nidrs-push-determine-result.html) |
| MessageHeader Profile | [MessageHeader NIDRS Push Determine Result](StructureDefinition-MessageHeader-nidrs-push-determine-result.html) |
| eventCoding | `PushDetermineResult` |
| 主要內容 | `focus`：[研判結果-Condition NIDRS Determine Result](StructureDefinition-Condition-nidrs-determine-result.html)；通報單號、通報疾病、個案證號，研判結果代碼與研判時間([研判結果擴充](StructureDefinition-nidrs-determine-result.html))、衛生局收到日、建檔日 |
| 回應 | HTTP 200(原規格 True)；HTTP 4xx/5xx(原規格 False) |
{:.grid}

#### 6. 疾管署主動回饋個案檢驗結果至通報單位

<img src="fig09-sample-result.png" alt="圖9 個案送驗單檢驗結果回送" style="display:block; margin-left:auto; margin-right:auto; max-width:40%;"/>
<p style="text-align:center">圖9 個案送驗單檢驗結果回送(取自工作說明書)</p>

| 步驟 | 步驟名稱 | 說明(依工作說明書表7) |
|---|---|---|
| 1 | 檢驗結果異動 | 當個案送驗單檢驗結果有異動，疾管署系統將綜合檢驗結果透過 Web Service 發送給通報單位。 |
| 2 | 傳送檢驗結果 | 醫院端需開發一個 Web Service 供疾管署程式傳送資料。功能名稱 `PushSampleResult`；傳送參數 `string jsonString`(SampleResult 之 JSON 序列化字串)；回傳值 Boolean(True=成功，False=失敗)。 |
| 3 | 傳送參數定義 | SampleResult：ReportId、SampleId(送驗單編號)、DiseaseId/DiseaseName(送驗疾病)、ResultInformDay(檢驗結果時間)、ResultId/ResultName(檢驗結果)，以及血清學檢驗結果清單(SampleAntibodyResults)與病原體檢驗結果清單(SamplePathogenResults)。 |
{:.grid}

FHIR 訊息對應：

| 項目 | 主動通知(疾管署 → 通報單位) |
|---|---|
| Bundle Profile | [檢驗結果主動通知-Bundle NIDRS Push Sample Result](StructureDefinition-Bundle-nidrs-push-sample-result.html) |
| MessageHeader Profile | [MessageHeader NIDRS Push Sample Result](StructureDefinition-MessageHeader-nidrs-push-sample-result.html) |
| eventCoding | `PushSampleResult` |
| 主要內容 | `focus`：[送驗單綜合檢驗結果-DiagnosticReport](StructureDefinition-DiagnosticReport-nidrs-sample-result.html)(以送驗單編號參照送驗單、以通報單號參照通報疾病，綜合檢驗結果使用 TWIDIR 檢驗結果代碼)；`result`：[血清學檢驗結果-Observation](StructureDefinition-Observation-nidrs-antibody-result.html)、[病原體檢驗結果-Observation](StructureDefinition-Observation-nidrs-pathogen-result.html) |
| 回應 | HTTP 200(原規格 True)；HTTP 4xx/5xx(原規格 False) |
{:.grid}

### 訊息事件代碼總覽

| eventCoding | 名稱 | 方向 | Bundle Profile |
|---|---|---|---|
| EMRMsg01 | 通報單新增 | 通報單位 → 疾管署 | [Bundle-nidrs-report-create](StructureDefinition-Bundle-nidrs-report-create.html) |
| EMRMsg02 | 通報單修改 | 通報單位 → 疾管署 | [Bundle-nidrs-report-update](StructureDefinition-Bundle-nidrs-report-update.html) |
| EMRMsg03 | 通報單病歷檔案上傳 | 通報單位 → 疾管署 | [Bundle-nidrs-document](StructureDefinition-Bundle-nidrs-document.html) |
| EMRMsg04 | 通報單送驗 | 通報單位 → 疾管署 | [Bundle-nidrs-sample](StructureDefinition-Bundle-nidrs-sample.html) |
| HISMsg01~HISMsg04 | 通報單新增/修改/病歷檔案上傳/送驗新增結果 | 疾管署 → 通報單位(同步回應) | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) |
| PushDetermineResult | 研判結果主動通知 | 疾管署 → 通報單位 | [Bundle-nidrs-push-determine-result](StructureDefinition-Bundle-nidrs-push-determine-result.html) |
| PushSampleResult | 檢驗結果主動通知 | 疾管署 → 通報單位 | [Bundle-nidrs-push-sample-result](StructureDefinition-Bundle-nidrs-push-sample-result.html) |
{:.grid}
