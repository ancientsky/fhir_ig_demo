實作者**建議應該(SHOULD)**了解與FHIR交易相關的[安全考量](http://hl7.org/fhir/R4/security.html)，特別是與以下相關：

### **[通訊(Communication)](http://hl7.org/fhir/R4/security.html#http)**

- 所有交換**必須(SHALL)**透過 HTTPS(TLS)進行；工作說明書所列之測試及正式環境 Web API 皆為 `https://` 位址。**【本IG建議】**使用 TLS 1.2 以上版本。
- 依工作說明書「連線設定說明」，通報單位**必須(SHALL)**提供**固定 IP** 位置給疾管署，疾管署據以允許連線；傳染病自動通報系統亦設有固定 IP，通報單位端**必須(SHALL)**開放防火牆，以接收疾管署之主動通知(研判結果、檢驗結果)。
- 通報單位之接收端點(`PushDetermineResult`、`PushSampleResult` 對應之 `$process-message`)**建議應該(SHOULD)**僅允許疾管署固定 IP 連入。

### **驗證(Authentication)與電子簽章**

工作說明書以電子簽章確保資料之有效性、安全性與傳輸之正確性：

- 通報單位**必須(SHALL)**以**醫事機構憑證**(工作說明書圖2 標示為醫事機構軟體憑證)對完整通報資料進行電子簽章，格式為 **JWT(JWS)**，再透過 EMRMsg01~EMRMsg04 傳送至疾管署。
- 疾管署對接收之資料進行**驗章**；無法通過驗章時，以回覆訊息回傳錯誤。相關處理結果代碼：`IDA0000003` 電子簽章驗證失敗、`IDA0000004` 電子簽章解析失敗：無憑證、`IDA0000005` 未簽章(見 [CDC-NIDRS-處理結果(錯誤)代碼](CodeSystem-cdc-processing-result.html))。

**【本IG建議】**套用至 FHIR 訊息時：

- 以訊息 Bundle 之 JSON 序列化內容作為 JWS 之 payload，以醫事機構憑證之私鑰簽章(JWS Compact Serialization)，並於 JWS header 之 `x5c` 攜帶簽章憑證，以利疾管署驗章及識別通報單位。簽章演算法、header 欄位及 HTTP 傳送方式(例如以 `application/jose` 傳送 JWS，或以其他欄位攜帶)工作說明書未明定，應以疾管署 Open API Spec 為準。
- 驗章後，接收端**應該(SHOULD)**確認簽章憑證所屬之醫事機構代碼與 `MessageHeader.sender` 及 `Bundle.identifier` 前 10 碼之醫事機構代碼一致。
- 替代方案：FHIR 亦提供 [`Bundle.signature`](http://hl7.org/fhir/R4/bundle-definitions.html#Bundle.signature)，可將 JWS(detached 或 enveloped)置於 Bundle 中。由於原規格以 JWT 包裝整份資料，本IG以外層 JWS 為主要建議；若日後採用 `Bundle.signature`，`signature.who` 應參照通報單位 Organization，`signature.sigFormat` 為 `application/jose`。
- 疾管署之主動通知訊息，工作說明書未規定簽章；**【本IG建議】**疾管署端以機關憑證或伺服器憑證進行簽章或雙向 TLS，以利醫院端驗證訊息來源。

### **授權/存取控制(Authorization/Access Control)**

- 疾管署依固定 IP 與醫事機構憑證識別通報單位。通報單修改、病歷資料傳送及送驗新增，**應該(SHOULD)**僅允許原通報單位就其通報單進行(例如：結核病待補正通報單限由原通報院所補正，見[檢核規則](validation.html))。
- 通報單位接收之研判結果與檢驗結果僅限於該單位所通報之個案。

### 個人資料保護

- 通報訊息包含個案姓名、身分證統一編號、聯絡資料、居住地址、病歷檔案等敏感個人資料及傳染病診斷資料，傳送、儲存及記錄時**必須(SHALL)**依傳染病防治法、個人資料保護法及相關法規辦理。
- 個人可識別資訊(PHI/PII，例如身分證統一編號、姓名、通報單號)**不可(SHALL NOT)**置於 URL(路徑或查詢參數)中；本IG之交換皆以 POST 於 HTTP body 傳送訊息 Bundle。
- 系統紀錄(log)**建議應該(SHOULD)**避免記錄完整訊息內容或病歷檔案(base64)，必要時應遮罩個資。

### 本專案安全一致性要求如下
- 系統**建議應該(SHOULD)** 保留各種交易的稽核日誌(audit logs)，包含訊息識別碼(`Bundle.identifier`)、事件代碼、傳送時間與處理結果。
- 系統**建議應該(SHOULD)** 符合[FHIR通訊安全(Communications Security)](http://hl7.org/fhir/R4/security.html#http)要求。
- 系統**必須(SHALL)** 依工作說明書以醫事機構憑證進行電子簽章與驗章(見上文)。
- 系統**建議應該(SHOULD)** 依據國家、地方和機構政策實作同意要求；傳染病通報屬法定義務，其資料蒐集與利用依傳染病防治法辦理。
- 系統**可以(MAY)** 透過加密和相關存取控制來保護資料的機密性。所使用的策略和方法不在此規範的範圍內。
