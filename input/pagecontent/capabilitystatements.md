本頁說明實作本IG之系統必須(SHALL)及建議應該(SHOULD)支援之功能。本IG以 FHIR Messaging 進行資料交換，因此能力聲明之重點為 `$process-message` 操作與各訊息事件，而非個別 Resource 之 RESTful CRUD 操作。

> 疾管署目前提供之介面為 JSON Web API(見[作業流程與交換訊息](workflow.html))，並未提供 FHIR 端點；以下能力聲明為本非官方示範IG之設計。

### 能力聲明清單

| 能力聲明 | 角色 | 說明 |
|---|---|---|
| [疾管署傳染病自動通報系統-伺服端(NIDRS Server)](CapabilityStatement-nidrs-server.html) | 疾管署 NIDRS 接收端 | 接收通報單位傳送之通報單新增、修改、病歷資料傳送、送驗新增訊息，並同步回覆處理結果；於研判結果、檢驗結果異動時，主動傳送通知訊息至通報單位 |
| [通報醫院端(NIDRS Client)](CapabilityStatement-nidrs-client.html) | 通報單位(醫院) | 產生並傳送通報訊息、處理疾管署回覆；並可提供接收端點，接收疾管署之研判結果與檢驗結果主動通知 |
{:.grid}

### 疾管署 NIDRS 接收端

- **必須(SHALL)** 支援 [$process-message](http://hl7.org/fhir/R4/messageheader-operation-process-message.html) 操作，以同步方式(synchronous)接收下列訊息，並回傳 [疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html)：

| eventCoding | 請求訊息 | 回覆訊息 |
|---|---|---|
| `EMRMsg01` | [通報單新增-Bundle](StructureDefinition-Bundle-nidrs-report-create.html) | `HISMsg01` |
| `EMRMsg02` | [通報單修改-Bundle](StructureDefinition-Bundle-nidrs-report-update.html) | `HISMsg02` |
| `EMRMsg03` | [通報單病歷資料傳送-Bundle](StructureDefinition-Bundle-nidrs-document.html) | `HISMsg03` |
| `EMRMsg04` | [通報單送驗新增-Bundle](StructureDefinition-Bundle-nidrs-sample.html) | `HISMsg04` |
{:.grid}

- **必須(SHALL)** 驗證請求之電子簽章(見[安全性](security.html))，驗章失敗時以回覆訊息回傳對應之處理結果代碼(`IDA0000003`、`IDA0000004`、`IDA0000005`)。
- **必須(SHALL)** 依[檢核規則](validation.html)檢核訊息內容，並以 [OperationOutcome NIDRS](StructureDefinition-OperationOutcome-nidrs.html) 回傳錯誤清單。
- **必須(SHALL)** 支援 JSON 格式(`application/fhir+json`)。
- **建議應該(SHOULD)** 於研判結果或檢驗結果異動時，以 [研判結果主動通知-Bundle](StructureDefinition-Bundle-nidrs-push-determine-result.html)(`PushDetermineResult`)及 [檢驗結果主動通知-Bundle](StructureDefinition-Bundle-nidrs-push-sample-result.html)(`PushSampleResult`)呼叫已登記之通報單位接收端點之 `$process-message`。

### 通報醫院端

- **必須(SHALL)** 能產生符合本IG Profile 之 `EMRMsg01`~`EMRMsg04` 訊息，以醫事機構憑證簽章後，呼叫疾管署接收端之 `$process-message`。
- **必須(SHALL)** 能處理 [疾管署回覆-Bundle](StructureDefinition-Bundle-nidrs-response.html)，保存回覆之通報單號、送驗單編號及錯誤訊息。
- **建議應該(SHOULD)** 提供 `$process-message` 接收端點，接收疾管署之 `PushDetermineResult`、`PushSampleResult` 訊息；成功接收時回應 HTTP 200，失敗時回應 HTTP 4xx/5xx。工作說明書說明院所端「亦可」準備 Web API 伺服器接收疾管署端回送訊息，而欲接收主動通知者「需開發」接收服務，故本IG將此能力列為建議。
- 接收端點**必須(SHALL)** 僅接受來自疾管署固定 IP 之連線並驗證來源(見[安全性](security.html))。

### 訊息定義(MessageDefinition)

各訊息事件另以 MessageDefinition 描述其 focus 與允許之回覆：

| 訊息定義 | 訊息定義 |
|---|---|
| [通報單新增訊息定義(EMRMsg01)](MessageDefinition-nidrs-emrmsg01.html) | [通報單新增結果訊息定義(HISMsg01)](MessageDefinition-nidrs-hismsg01.html) |
| [通報單修改訊息定義(EMRMsg02)](MessageDefinition-nidrs-emrmsg02.html) | [通報單修改結果訊息定義(HISMsg02)](MessageDefinition-nidrs-hismsg02.html) |
| [通報單病歷資料傳送訊息定義(EMRMsg03)](MessageDefinition-nidrs-emrmsg03.html) | [通報單病歷資料傳送結果訊息定義(HISMsg03)](MessageDefinition-nidrs-hismsg03.html) |
| [通報單送驗新增訊息定義(EMRMsg04)](MessageDefinition-nidrs-emrmsg04.html) | [通報單送驗新增結果訊息定義(HISMsg04)](MessageDefinition-nidrs-hismsg04.html) |
| [研判結果主動通知訊息定義(PushDetermineResult)](MessageDefinition-nidrs-push-determine-result.html) | [檢驗結果主動通知訊息定義(PushSampleResult)](MessageDefinition-nidrs-push-sample-result.html) |
{:.grid}

詳細之資源、操作與期望等級，請參考上列能力聲明構件。
