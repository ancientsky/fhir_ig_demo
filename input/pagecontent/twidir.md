[臺灣傳染病檢驗報告實作指引(TWIDIR)](https://twidir.cdc.gov.tw/twidir/)(套件 `tw.gov.mohw.cdc.twidir` 0.1.1)為疾管署正式發布之 FHIR IG，定義檢驗機構以 FHIR 訊息上傳傳染病檢驗報告至疾管署實驗室資訊管理系統(LIMS)。本IG(非官方示範)在設計上盡量沿用 TWIDIR 之慣例，使同一醫院之資訊系統可以一致的方式實作兩種傳染病相關之資料交換。

### 範圍比較

| 項目 | TWIDIR | 本IG(TWNIDRS，非官方示範) |
|---|---|---|
| 業務範圍 | 傳染病**檢驗結果**通報(檢驗機構 → 疾管署 LIMS) | 傳染病**個案通報**(通報單新增/修改、病歷資料、送驗新增)，以及疾管署研判結果與檢驗結果主動回饋(醫院 ↔ 疾管署 NIDRS) |
| 原始規格 | 實驗室傳染病自動通報系統相關規格 | NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書 V1.42 |
| 主要 Resource | Bundle、MessageHeader、Patient、Organization、Condition、DiagnosticReport、Observation、Specimen、Device、OperationOutcome | Bundle、MessageHeader、Composition、Patient、Condition、Encounter、Observation、QuestionnaireResponse、DocumentReference、ServiceRequest、Specimen、DiagnosticReport、Organization、Practitioner(Role)、RelatedPerson、OperationOutcome |
| 繼承之 TW Core 版本 | 0.1.1 | 1.0.0 |
| 發布者 | 衛福部疾病管制署(正式) | fhir_ig_demo(非官方示範) |
{:.grid}

### 沿用 TWIDIR 之慣例

| 慣例 | TWIDIR | 本IG |
|---|---|---|
| Canonical 樣式 | `https://twidir.cdc.gov.tw/twidir`，套件代碼 `tw.gov.mohw.cdc.twidir`，IG 名稱 `TWIDIR` | 示範版使用 `https://ancientsky.github.io/fhir_ig_demo`、`tw.demo.nidrs`；IG 名稱沿用 `TW<X>` 樣式為 `TWNIDRS`。若日後正式發布，可依疾管署 IG 慣例改為例如 `https://nidrs.cdc.gov.tw/nidrs` 及 `tw.gov.mohw.cdc.nidrs`(**假設**，非疾管署核定) |
| 訊息模式 | `Bundle.type = message`；第一筆 entry 為 MessageHeader；回覆為 MessageHeader.response + OperationOutcome | 相同。請求與回覆皆為 message Bundle；回覆以 `MessageHeader.response.code` 表達處理狀態，以 OperationOutcome 表達錯誤代碼與訊息 |
| Bundle.identifier | system `https://www.cdc.gov.tw/`；值為醫事機構代碼(10碼) + 月日時分秒毫秒(13碼)，共 23 碼 | 相同規則 |
| 送驗單編號 | Observation.identifier，system `https://lims.cdc.gov.tw/` | ServiceRequest.identifier 及 DiagnosticReport.identifier(送驗單編號 BarCode / SampleId)使用相同 system `https://lims.cdc.gov.tw/` |
| 檢驗結果代碼 | [CDC-LIMS系統-檢驗結果](https://twidir.cdc.gov.tw/twidir/CodeSystem-twcdc-testresult-values.html)(`twcdc-testresult-values`) | 疾管署主動回饋之綜合檢驗結果(ResultId)及血清學/病原體檢驗結果直接使用此代碼系統(以 canonical 參照，未將 TWIDIR 列為套件相依) |
| 醫事機構識別 | Organization.identifier type `PRN`，system 為 TW Core `organization-identifier-tw` | 相同 |
| 命名與文字 | 標題為「中文名稱(English)」，說明為「此…Profile說明本IG如何進一步定義臺灣核心-…(TW Core …) Profile以呈現…」，`short` 以中文撰寫 | 標題沿用疾管署 IG 中英並列之樣式(「中文名稱-英文 Resource 名稱」，與臺灣結核病實作指引相同)，說明文字與 `short` 之寫法相同 |
| 代碼系統標題 | `CDC-<中文>`、`CDC-LIMS系統-<中文>`，值集標題加「值集」，值集與代碼系統同 Id | `CDC-NIDRS-<中文>`，值集標題加「值集」，值集與代碼系統同 Id |
| 頁面架構 | 應用說明、邏輯模型、FHIR Profiles、專門術語、能力聲明、下載、安全性、範例 | 相同，並增加作業流程、欄位對應、疾病增補欄位、檢核規則等頁面 |
{:.grid}

### 與 TWIDIR 之差異

- **TW Core 版本**：TWIDIR 0.1.1 繼承 TW Core 0.1.1；本IG繼承 TW Core 1.0.0。兩者之 Patient、Organization 等 Profile 之識別碼切片與限制有所不同，例如身分證統一編號之 system 於 TWIDIR 範例為 `http://www.moi.gov.tw/`、中華民國護照為 `http://www.boca.gov.tw/`，於 TW Core 1.0.0 則分別為 `http://www.moi.gov.tw` 與 `http://hl7.org/fhir/sid/passport-TWN`。同時實作兩份 IG 之系統應分別依各自相依之 TW Core 版本產生與驗證。
- **通報單號類型**：TWIDIR 以 `Condition.identifier.type`(代碼系統 `twcdc-identifier-type-values`，代碼 `ida`、`sqms`、`emr`、`nidrs`)區分通報單號來源，且範例中未設定 `identifier.system`；本IG以本地代碼系統 [CDC-NIDRS-識別碼類型](CodeSystem-cdc-identifier-type.html)(`nidrs-report`)標示通報單號，並設定示範用之 identifier.system(`https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id`)。
- **錯誤代碼**：TWIDIR 回覆使用 LIMS 之系統回應訊息代碼(`twcdc-operationoutcome-values`，例如 `I00001`、`E00003`)；本IG使用 NIDRS 附錄四「處理結果」代碼(例如 `IDA0000006`、`IDA3020002`)，兩者為不同系統之代碼，不可混用。
- **訊息事件**：TWIDIR 之 `MessageHeader.eventCoding` 使用 LOINC `11502-2`(Laboratory report)；本IG使用 [CDC-NIDRS-訊息事件](CodeSystem-cdc-message-event.html)代碼，以對應原規格之 EMRMsg/HISMsg 訊息代碼。
- **文件與增補欄位**：TWIDIR 無 Composition；本IG以 Composition 表達傳染病個案通報單，並以 Questionnaire/QuestionnaireResponse 表達附錄二疾病增補欄位。
- **主動通知**：TWIDIR 為檢驗機構單向上傳；本IG另定義疾管署主動通知醫院之訊息(研判結果、檢驗結果)。

### 檢驗報告與通報單之關聯

同一個案之傳染病檢驗報告(TWIDIR)與傳染病個案通報單(本IG)，以**通報單號**相互關聯：

1. 醫院以本IG之通報單新增訊息(EMRMsg01)通報個案，疾管署回覆(HISMsg01)每一通報疾病之通報單號(REPORT_ID，13 碼)，以 [通報單參照-Condition](StructureDefinition-Condition-nidrs-case-ref.html) 之 `identifier[reportId]` 表達。
2. 醫院以本IG之送驗新增訊息(EMRMsg04)送驗時，法傳送驗單以 `ServiceRequest.supportingInfo` 參照該通報單號；送驗成功後取得送驗單編號(system `https://lims.cdc.gov.tw/`)。
3. 檢驗機構依 TWIDIR 上傳檢驗報告時，TWIDIR `condition-reporting` 之 `Condition.identifier`(type 為 `nidrs` 或 `emr`)可填入同一通報單號，`Observation.identifier` 可填入同一送驗單編號，疾管署即可將檢驗結果連結至 NIDRS 通報單及送驗單。
4. 疾管署之檢驗結果主動通知(PushSampleResult)再以通報單號(ReportId)及送驗單編號(SampleId)，將綜合檢驗結果回饋通報醫院([送驗單綜合檢驗結果-DiagnosticReport](StructureDefinition-DiagnosticReport-nidrs-sample-result.html))，其檢驗結果代碼與 TWIDIR 相同。

> 上述 TWIDIR 之資料項目說明係依 TWIDIR 0.1.1 套件內容整理；兩系統之實際關聯方式以疾管署規定為準。
