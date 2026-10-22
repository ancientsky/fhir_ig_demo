本頁為「NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書」V1.42 之 JSON 交換格式與本 IG FHIR R4 Profile 之逐欄對應說明，涵蓋工作說明書表8～表19 之所有欄位，以及疾管署主動回饋之 ReportDetermineResult 與 SampleResult(含 SampleAntibodyResult、SamplePathogenResult)結構。同樣之對應亦以機器可讀方式記載於各[邏輯模型](models.html)之「Mappings」頁籤(mapping identity：`nidrs-to-fhir`)。

各表欄位說明：

- **原欄位**：原 JSON 欄位名稱；巢狀欄位以「.」連接上層區塊(例如 `REPORTS.REPORT.CONTACT_INFO`)。
- **基數／型態／說明**：摘錄自工作說明書；型態欄之 String/N 表示字串長度上限 N。
- **FHIR Profile／FHIR 元素**：轉換後資料所在之 Profile 及元素路徑；同一欄位對應多個位置時逐行列出。路徑中 `[phone/mobile]` 等表示依資料內容擇一 slice。
- **轉換說明**：代碼系統、格式轉換與相依規則。

### 轉換通則

| 原規格型態/慣例 | FHIR 表達方式 | 範例 |
| --- | --- | --- |
| 日期字串 `yyyy/MM/dd`(Report_Common、Report_Travel 之 String/10 日期欄位) | FHIR `date`(或僅含日期之 `dateTime`)：`yyyy-MM-dd` | `2021/01/01` → `2021-01-01` |
| 日期字串 `yyyyMMdd`(EMRMsg04 之 String/8 日期欄位) | FHIR `date`/`dateTime`：`yyyy-MM-dd` | `20210101` → `2021-01-01` |
| Datetime `yyyyMMdd HH:mi:ss`(RESULT_TIME) | FHIR `instant`/`dateTime`，補上臺灣時區 `+08:00` | `20250101 13:45:00` → `2025-01-01T13:45:00+08:00` |
| C# `DateTime`(SampleResult 系列) | FHIR `instant`/`dateTime`；序列化值無時區者補 `+08:00` | `2025-08-10T16:00:00` → `2025-08-10T16:00:00+08:00` |
| Bool(`true`/`false`) | FHIR `boolean`；部分欄位改以「是否存在」表達(例如病患動向、死亡) | `HAS_TRAVEL_HISTORY=true` → `Observation.valueBoolean = true` |
| Code(0/1 是否) | FHIR `boolean` | `ISCORPSEDISSECTION=1` → `valueBoolean = true` |
| Code(代碼表) | `Coding`/`CodeableConcept`，`system` 為本 IG 對應之 CodeSystem(附錄四代碼彙整表) | `GENDER=M` → `Patient.gender = male` |
| 「其他」說明欄位(`*_OTHER`) | 與代碼置於同一 `CodeableConcept` 之 `text` | `NATIONALITY_OTHER` → `...valueCodeableConcept.text` |
| Int 代碼(CITIZEN、DISEASE_SYMPTOM) | 轉為代碼字串後置於 `Coding.code` | `2` → `Coding.code = "2"` |
| 增補欄位答案值 `1=勾選` | `QuestionnaireResponse.item.answer.valueBoolean = true` | `VALUE=1` → `valueBoolean = true` |
| 原規格未傳送、但 FHIR 必填之參照 | 以 `Reference.identifier`(logical reference)參照 | `subject.identifier.value = A123456789` |
| 空值、「無」 | 不產生該 FHIR 元素(連絡電話/手機依原規格填「無」者除外) | `INSURANCENO=無` → 不產生 identifier |

### 訊息總覽

| 原訊息 | 方向 | 原規格表號 | 邏輯模型 | FHIR Bundle | MessageHeader | 主要資源 |
| --- | --- | --- | --- | --- | --- | --- |
| EMRMsg01 通報單新增 | 醫院→疾管署 | 表8 | [EMRMsg01Model](StructureDefinition-EMRMsg01Model.html) | [Bundle-nidrs-report-create](StructureDefinition-Bundle-nidrs-report-create.html) | [MessageHeader-nidrs-report-create](StructureDefinition-MessageHeader-nidrs-report-create.html) | Composition、Patient、Condition、Encounter、Observation、QuestionnaireResponse、RelatedPerson |
| HISMsg01 通報單新增結果 | 疾管署→醫院 | 表9 | [HISMsg01Model](StructureDefinition-HISMsg01Model.html) | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | Condition(通報單參照)、OperationOutcome |
| EMRMsg02 通報單修改 | 醫院→疾管署 | 表10 | [EMRMsg02Model](StructureDefinition-EMRMsg02Model.html) | [Bundle-nidrs-report-update](StructureDefinition-Bundle-nidrs-report-update.html) | [MessageHeader-nidrs-report-update](StructureDefinition-MessageHeader-nidrs-report-update.html) | 同 EMRMsg01(Composition/Condition 改用修改版 Profile) |
| HISMsg02 通報單修改結果 | 疾管署→醫院 | 表11 | [HISMsg02Model](StructureDefinition-HISMsg02Model.html) | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | Condition(通報單參照)、OperationOutcome |
| EMRMsg03 病歷資料傳送 | 醫院→疾管署 | 表12 | [EMRMsg03Model](StructureDefinition-EMRMsg03Model.html) | [Bundle-nidrs-document](StructureDefinition-Bundle-nidrs-document.html) | [MessageHeader-nidrs-document](StructureDefinition-MessageHeader-nidrs-document.html) | DocumentReference、Organization |
| HISMsg03 病歷資料傳送結果 | 疾管署→醫院 | 表13 | [HISMsg03Model](StructureDefinition-HISMsg03Model.html) | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | OperationOutcome |
| EMRMsg04 送驗新增 | 醫院→疾管署 | 表14 | [EMRMsg04Model](StructureDefinition-EMRMsg04Model.html) | [Bundle-nidrs-sample](StructureDefinition-Bundle-nidrs-sample.html) | [MessageHeader-nidrs-sample](StructureDefinition-MessageHeader-nidrs-sample.html) | ServiceRequest、Specimen、Patient、Organization、Practitioner |
| HISMsg04 送驗新增結果 | 疾管署→醫院 | 表15 | [HISMsg04Model](StructureDefinition-HISMsg04Model.html) | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | ServiceRequest、Specimen、OperationOutcome |
| PushDetermineResult 研判結果主動通知 | 疾管署→醫院 | 表6 | [ReportDetermineResultModel](StructureDefinition-ReportDetermineResultModel.html) | [Bundle-nidrs-push-determine-result](StructureDefinition-Bundle-nidrs-push-determine-result.html) | [MessageHeader-nidrs-push-determine-result](StructureDefinition-MessageHeader-nidrs-push-determine-result.html) | Condition(研判結果) |
| PushSampleResult 檢驗結果主動通知 | 疾管署→醫院 | 表7 | [SampleResultModel](StructureDefinition-SampleResultModel.html) | [Bundle-nidrs-push-sample-result](StructureDefinition-Bundle-nidrs-push-sample-result.html) | [MessageHeader-nidrs-push-sample-result](StructureDefinition-MessageHeader-nidrs-push-sample-result.html) | DiagnosticReport、Observation |
{:.grid}

### 通報單資料結構(表16～表19)

以下四個結構為 EMRMsg01 與 EMRMsg02 之 `REPORT.REPORT`、`CONTACT_INFO`、`TRAVEL`、`ANIMAL` 所共用。表中以通報單新增作業之 Profile 標示：修改作業(EMRMsg02)時，[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) 改為 [Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html)、[Condition-nidrs](StructureDefinition-Condition-nidrs.html) 改為 [Condition-nidrs-update](StructureDefinition-Condition-nidrs-update.html)；登革熱大量通報(附錄五)時改用 [Composition-nidrs-report-dengue-bulk](StructureDefinition-Composition-nidrs-report-dengue-bulk.html)、[Patient-nidrs-dengue-bulk](StructureDefinition-Patient-nidrs-dengue-bulk.html)、[Condition-nidrs-dengue-bulk](StructureDefinition-Condition-nidrs-dengue-bulk.html)。

<a name="report-common"></a>
#### 通報單共同欄位(Report_Common，表16)

邏輯模型：[ReportCommonModel](StructureDefinition-ReportCommonModel.html)

{{TABLE:ReportCommonModel}}

<a name="report-contactinfo"></a>
#### 通報單聯絡資料(Report_ContactInfo，表17)

邏輯模型：[ReportContactInfoModel](StructureDefinition-ReportContactInfoModel.html)

{{TABLE:ReportContactInfoModel}}

<a name="report-travel"></a>
#### 通報單旅遊史(Report_Travel，表18)

邏輯模型：[ReportTravelModel](StructureDefinition-ReportTravelModel.html)

{{TABLE:ReportTravelModel}}

<a name="report-animal"></a>
#### 通報單接觸動物史(Report_Animal，表19)

邏輯模型：[ReportAnimalModel](StructureDefinition-ReportAnimalModel.html)

{{TABLE:ReportAnimalModel}}

### 通報單新增作業

<a name="emrmsg01"></a>
#### 傳送資料結構(EMRMsg01，表8)

邏輯模型：[EMRMsg01Model](StructureDefinition-EMRMsg01Model.html)

{{TABLE:EMRMsg01Model}}

<a name="hismsg01"></a>
#### 回應資料結構(HISMsg01，表9)

邏輯模型：[HISMsg01Model](StructureDefinition-HISMsg01Model.html)

{{TABLE:HISMsg01Model}}

### 通報單修改作業

<a name="emrmsg02"></a>
#### 傳送資料結構(EMRMsg02，表10)

邏輯模型：[EMRMsg02Model](StructureDefinition-EMRMsg02Model.html)

{{TABLE:EMRMsg02Model}}

<a name="hismsg02"></a>
#### 回應資料結構(HISMsg02，表11)

邏輯模型：[HISMsg02Model](StructureDefinition-HISMsg02Model.html)

{{TABLE:HISMsg02Model}}

### 通報單病歷資料傳送作業

<a name="emrmsg03"></a>
#### 傳送資料結構(EMRMsg03，表12)

邏輯模型：[EMRMsg03Model](StructureDefinition-EMRMsg03Model.html)

{{TABLE:EMRMsg03Model}}

<a name="hismsg03"></a>
#### 回應資料結構(HISMsg03，表13)

邏輯模型：[HISMsg03Model](StructureDefinition-HISMsg03Model.html)

{{TABLE:HISMsg03Model}}

### 通報單送驗新增作業

<a name="emrmsg04"></a>
#### 傳送資料結構(EMRMsg04，表14)

邏輯模型：[EMRMsg04Model](StructureDefinition-EMRMsg04Model.html)。`SAMPLE`(法傳送驗單)對應 [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html)/[Specimen-nidrs](StructureDefinition-Specimen-nidrs.html)；`TB_SAMPLE`(法傳TB送驗單)對應 [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html)/[Specimen-nidrs-tb](StructureDefinition-Specimen-nidrs-tb.html)/[Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html)。

{{TABLE:EMRMsg04Model}}

<a name="hismsg04"></a>
#### 回應資料結構(HISMsg04，表15)

邏輯模型：[HISMsg04Model](StructureDefinition-HISMsg04Model.html)。原規格表15 之 ReturnData.SAMPLE 欄位僅列名稱與型態(皆為 String)，說明欄引用 EMRMsg04 同名欄位。

{{TABLE:HISMsg04Model}}

### 疾管署主動回饋

疾管署主動回饋原以醫院端開發之 Web Service 接收(參數 `string jsonString`，回傳 Boolean：True 成功、False 失敗)。本 IG 將其表達為 FHIR 訊息 Bundle；接收端處理結果可以 HTTP 狀態碼或回應訊息回覆。

<a name="determine-result"></a>
#### 研判結果主動通知(PushDetermineResult / ReportDetermineResult，表6)

邏輯模型：[ReportDetermineResultModel](StructureDefinition-ReportDetermineResultModel.html)

{{TABLE:ReportDetermineResultModel}}

<a name="sample-result"></a>
#### 檢驗結果主動通知(PushSampleResult / SampleResult，表7)

邏輯模型：[SampleResultModel](StructureDefinition-SampleResultModel.html)。`SampleAntibodyResults` 之每一筆對應 [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html)，`SamplePathogenResults` 之每一筆對應 [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html)，皆由 DiagnosticReport.result 參照。

{{TABLE:SampleResultModel}}

### 刻意偏離與補充說明

FHIR 資源模型與原 JSON 結構並非一對一，以下為本 IG 刻意採取之設計及其理由：

1. **一份 REPORT 對應一份 Composition**：EMRMsg01 之 `REPORTS`(最多 10 筆)每一筆轉為一份 [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html)，並各自擁有 Patient；MessageHeader.focus 依序參照各 Composition。HISMsg01 之 `REPORT_RESULT` 亦依序對應。
2. **多個通報疾病拆為多筆 Condition**：`DISEASE.DISEASE_ID`(最多 10 個)每一個轉為一筆 [Condition-nidrs](StructureDefinition-Condition-nidrs.html)，由 Composition.section[disease].entry 參照。原規格中屬於通報單層級之發病日(SICK_DAY)、無發病日(NO_SICK_DAY)、診斷日(DIAGNOSE_DAY)、有無症狀(HAS_SYMPTOM)、診斷醫師(DIAGNOSTICIAN)與主要症狀(DISEASE_SYMPTOM)，複製至每一筆 Condition；疾管署成功回覆時亦依疾病分別產生通報單號。
3. **EMRMsg02 無 DISEASE_ID，但 Condition.code 仍為必填**：修改作業不傳送通報疾病代碼；FHIR 端 [Condition-nidrs-update](StructureDefinition-Condition-nidrs-update.html) 仍要求 `Condition.code`，請填入原通報疾病代碼(與通報單號 `REPORT` 對應，通常取自 HISMsg01 之 `REPORT_LIST.DISEASE_ID`)，疾管署應忽略或檢核其與原通報單一致。
4. **AA/BB/CC 暫用證號**：`IDNO` 填 AA(本國新生兒)、BB(本國人士)、CC(外國人士)時，轉為 `Patient.identifier[nidrsTempId]`(use = temp、system = `https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-temp-id`)；疾管署自動編碼後之流水證號(例：AA11300001)於回覆之 `REPORT_LIST.IDNO` 回傳，後續修改作業請使用回傳之流水證號。
5. **病患動向由 8 個布林欄位轉為代碼**：`HOSPITALIZED_*` 轉為 Encounter.extension[patientMovement] 之 CDCPatientMovement 代碼(原規格擇一填寫，FHIR 允許多筆)，相關日期置於 Encounter.period 與 location[icu]/location[isolationRoom].period；「無就醫」時 Encounter.class 無對應代碼。
6. **死亡以 deceased[x] 二擇一表達**：`DEATH=false` → `deceasedBoolean=false`；`DEATH=true` 時改以 `deceasedDateTime`(= DEATH_DAY)表達，不使用 `deceasedBoolean=true`。
7. **布林流行病學欄位拆為 Observation**：`HAS_TRAVEL_HISTORY`、`HAS_ANIMAL_HISTORY`、`EXPLORE_*` 各為一筆 [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html)；`HAS_ORG`/`ORG_ID` 合併為一筆 [Observation-nidrs-dense-institution](StructureDefinition-Observation-nidrs-dense-institution.html)；`OCCUPATION`/`OCCUPATION_OTHER` 為 [Observation-nidrs-occupation](StructureDefinition-Observation-nidrs-occupation.html)。
8. **SAMPLE 無個案資料，但 FHIR 要求 subject**：EMRMsg04 `SAMPLE` 僅帶通報單號，而 `ServiceRequest.subject` 與 `Specimen.subject`(TW Core 1..1)為必填，且 [Bundle-nidrs-sample](StructureDefinition-Bundle-nidrs-sample.html) 要求一筆 Patient：通報單位應由 HIS 依通報單號帶入通報個案之 Patient(至少含 identifier)，或以 `subject.identifier`(個案證號)參照。HISMsg04 之回覆 Bundle 不另附 Patient/Practitioner/Organization：ServiceRequest/Specimen.subject 以 identifier 參照，requester/performer 以 contained PractitionerRole/Organization 表達。
9. **DocumentReference.subject 為必填**：EMRMsg03 僅帶通報單號與通報醫院；TW Core DocumentReference 要求 `subject`，請以 `subject.identifier`(個案證號)參照通報個案，並以 `context.related.identifier`(通報單號)參照通報單。
10. **送驗疾病逗號字串拆為多個 reasonCode**：`SAMPLE.DISEASE`(如 `061,A920`)以逗號拆分，每一送驗疾病一個 `ServiceRequest.reasonCode`；TB 送驗單之 `PHTESTITEM` 陣列每一項目一個 `orderDetail`(原規格基數 1..1/String/20，實際為陣列)。
11. **回應訊息以 MessageHeader + OperationOutcome 表達**：`STATUS`/`Success` → `MessageHeader.response.code`(SUCCESS/true→ok；FAILURE/false→fatal-error)；`RESULT_TIME` → `Bundle.timestamp`；`ERROR_LIST` 每一筆 → `OperationOutcome.issue`(ERROR_Code → issue.details.coding、ERROR_MESSAGE → issue.diagnostics)。HISMsg01 可含多筆 `REPORT_RESULT`，而 MessageHeader.response.code 僅一個，故以其表達整體結果，各筆結果另以其 OperationOutcome 表達。
12. **疾病增補欄位以 Questionnaire/QuestionnaireResponse 表達**：`DISEASE_FIELD` 之 `KEY` 為 Questionnaire item.linkId、`VALUE` 依 item.type 轉為 answer.value[x]；QuestionnaireResponse 須依 Questionnaire 之群組階層巢狀(見[疾病增補欄位](supplement-fields.html))。
13. **原規格內部不一致之處**：表8 之 `DISEASE_FIELD.KEY` 為 String/200，表10 則為 String/20(而答題編號如 `S_QN06111000_AN06111001` 已超過 20 字)，本 IG 以 200 字為準(QuestionnaireResponse.item.linkId maxLength = 200)；表13 HISMsg03 `REPORT_RESULT` 說明記為「通報單修改結果」，應為病歷資料傳送結果；表15 之 `DISEASE_OTHER`、`CREATE_DAY`、`SAMPLED_TIMES` 未於 EMRMsg04 定義且無說明，本 IG 依其名稱推定對應。
14. **SampleResult 無個案證號**：PushSampleResult 僅帶通報單號與送驗單編號，而 `DiagnosticReport.subject` 與 `Observation.subject`(TW Core 1..1)為必填，疾管署應依通報單號帶入個案證號，以 `subject.identifier` 參照。
15. **日期格式統一**：原規格同時使用 `yyyy/MM/dd`(通報單)、`yyyyMMdd`(送驗單)與 `yyyyMMdd HH:mi:ss`(回應)等格式，FHIR 一律使用 ISO 8601(`yyyy-MM-dd`、`yyyy-MM-ddTHH:mm:ss+08:00`)。
