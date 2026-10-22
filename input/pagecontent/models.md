本 IG 以 FHIR 邏輯模型(Logical Model)忠實呈現「NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書」V1.42 第四章交換訊息格式(表8～表19)及第三章疾管署主動回饋之傳送參數(ReportDetermineResult、SampleResult)之原始 JSON 結構，作為將既有 EMR 通報 JSON 轉換為 FHIR 之依據。

### 邏輯模型清單

| 邏輯模型 | 原規格表號 | 訊息/結構 | 說明 |
| --- | --- | --- | --- |
| [ReportCommonModel](StructureDefinition-ReportCommonModel.html) | 表16 | Report_Common | 通報單共同欄位(Report_Common)之資料模型 |
| [ReportContactInfoModel](StructureDefinition-ReportContactInfoModel.html) | 表17 | Report_ContactInfo | 通報單聯絡資料(Report_ContactInfo)之資料模型 |
| [ReportTravelModel](StructureDefinition-ReportTravelModel.html) | 表18 | Report_Travel | 通報單旅遊史(Report_Travel)之資料模型 |
| [ReportAnimalModel](StructureDefinition-ReportAnimalModel.html) | 表19 | Report_Animal | 通報單接觸動物史(Report_Animal)之資料模型 |
| [EMRMsg01Model](StructureDefinition-EMRMsg01Model.html) | 表8 | EMRMsg01 | 通報單新增作業傳送資料結構(EMRMsg01)之資料模型 |
| [HISMsg01Model](StructureDefinition-HISMsg01Model.html) | 表9 | HISMsg01 | 通報單新增作業回應資料結構(HISMsg01)之資料模型 |
| [EMRMsg02Model](StructureDefinition-EMRMsg02Model.html) | 表10 | EMRMsg02 | 通報單修改作業傳送資料結構(EMRMsg02)之資料模型 |
| [HISMsg02Model](StructureDefinition-HISMsg02Model.html) | 表11 | HISMsg02 | 通報單修改作業回應資料結構(HISMsg02)之資料模型 |
| [EMRMsg03Model](StructureDefinition-EMRMsg03Model.html) | 表12 | EMRMsg03 | 通報單病歷資料傳送作業傳送資料結構(EMRMsg03)之資料模型 |
| [HISMsg03Model](StructureDefinition-HISMsg03Model.html) | 表13 | HISMsg03 | 通報單病歷資料傳送作業回應資料結構(HISMsg03)之資料模型 |
| [EMRMsg04Model](StructureDefinition-EMRMsg04Model.html) | 表14 | EMRMsg04 | 通報單送驗新增作業傳送資料結構(EMRMsg04)之資料模型 |
| [HISMsg04Model](StructureDefinition-HISMsg04Model.html) | 表15 | HISMsg04 | 通報單送驗新增作業回應資料結構(HISMsg04)之資料模型 |
| [ReportDetermineResultModel](StructureDefinition-ReportDetermineResultModel.html) | 表6 | PushDetermineResult | 研判結果主動通知(ReportDetermineResult)之資料模型 |
| [SampleResultModel](StructureDefinition-SampleResultModel.html) | 表7 | PushSampleResult | 檢驗結果主動通知(SampleResult)之資料模型 |
{:.grid}

### 閱讀方式

- **元素名稱即原 JSON 欄位名稱**，保留原大小寫(例如 `REPORT`、`ERROR_Code`、`SampleReasonXPERT_other`、`ReportId`)；巢狀區塊以 BackboneElement 表達，階層與原規格表之「欄位名稱/階層」一致。本版各欄位名稱皆為合法識別字，未作任何調整。
- **共用結構以邏輯模型作為型態**：EMRMsg01/EMRMsg02 之 `REPORT.REPORT`、`CONTACT_INFO`、`TRAVEL`、`ANIMAL` 之型態分別為 [ReportCommonModel](StructureDefinition-ReportCommonModel.html)、[ReportContactInfoModel](StructureDefinition-ReportContactInfoModel.html)、[ReportTravelModel](StructureDefinition-ReportTravelModel.html)、[ReportAnimalModel](StructureDefinition-ReportAnimalModel.html)，其逐欄定義與對應請見各該模型。
- **基數、簡述(short)與定義(definition)** 取自工作說明書；定義之末註明原規格資料型態(如 `String/13`)，字串長度上限另以 `maxLength` 標示。
- **代碼欄位** 綁定本 IG 由附錄四代碼彙整表轉換之 ValueSet(見[專門術語](terminologies.html))。
- **ReportDetermineResult 與 SampleResult** 原為 C# 類別定義而無基數，模型中識別欄位(ReportId、SampleId)設為 1..1，其他字串與清單為選填，實值型別(int、bool、DateTime)設為 1..1。
- **EMRMsg04 之 SAMPLE 與 TB_SAMPLE** 原規格未列基數，模型中皆為 0..1，一則訊息擇一傳送。TB_SAMPLE 之 `PHTESTITEM` 原規格記為 1..1/String/20，惟其值為陣列(例：`[1,8]`)，模型以 1..* 表達。

### 型態慣例

邏輯模型描述的是「原始 JSON」，因此型態維持原格式，不預先轉換為 FHIR 格式：

| 原規格型態 | 邏輯模型型態 | 轉換為 FHIR 時 |
| --- | --- | --- |
| String/N | string(maxLength = N) | 依對應元素型態轉換 |
| 日期字串 `yyyy/MM/dd`(String/10)或 `yyyyMMdd`(String/8) | string | FHIR `date`/`dateTime`：`yyyy-MM-dd`(例：`2021/01/01`、`20210101` → `2021-01-01`) |
| Datetime `yyyyMMdd HH:mi:ss` | string | FHIR `instant`/`dateTime`，補上 `+08:00`(例：`20250101 13:45:00` → `2025-01-01T13:45:00+08:00`) |
| C# DateTime | dateTime | 序列化值無時區者補上 `+08:00` |
| Bool / bool | boolean | FHIR `boolean`；部分欄位改以元素存在與否表達(如病患動向、死亡) |
| Code | code | `Coding`/`CodeableConcept`，`system` 為對應之代碼系統；0/1 是否代碼轉為 `boolean` |
| Int / int | integer | 作為代碼使用者(CITIZEN、DISEASE_SYMPTOM)轉為代碼字串 |
| 增補欄位答案值 `1=勾選` | string | `QuestionnaireResponse.item.answer.valueBoolean = true` |
{:.grid}

### 與 FHIR Profile 之對應(Mappings 頁籤)

每一邏輯模型皆含一組 mapping(identity `nidrs-to-fhir`，標題「NIDRS JSON → FHIR」，target `http://hl7.org/fhir/R4`)。開啟模型頁面之 **Mappings** 頁籤，即可看到每一原欄位對應之 FHIR 位置，格式為「Profile Id: FHIR 元素路徑」，例如：

- `REPORT.IDNO` → `Patient-nidrs: Patient.identifier[idCardNumber|residentNumber|passportNumber|foreignPassport|nidrsTempId].value`
- `SICK_DAY` → `Condition-nidrs: Condition.onsetDateTime`
- `RESULT_TIME` → `Bundle-nidrs-response: Bundle.timestamp`

mapping 之註解(comment)記載代碼系統、格式轉換與相依規則。以表格整理之完整逐欄對應及刻意偏離說明，請見[欄位對應(JSON→FHIR)](mapping.html)。
