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

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(Report_Common 本體)* |  |  | 通報單共同欄位(Report_Common)之資料模型 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html)<br>[Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html)<br>[Patient-nidrs](StructureDefinition-Patient-nidrs.html)<br>[Condition-nidrs](StructureDefinition-Condition-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Composition`<br>`Composition`<br>`Patient`<br>`Condition`<br>`Encounter` | 共同欄位分散對應至 Composition(通報單)、Patient(個案)、Condition(每一通報疾病)、Encounter(病患動向)、Observation(流行病學、死亡原因)、RelatedPerson(生母)、Organization/Practitioner/PractitionerRole(通報單位與人員) |
| `REPORT` | 0..1 | String/13 | 通報單號；修改通報單時此欄位必填。 | [Condition-nidrs-update](StructureDefinition-Condition-nidrs-update.html) | `Condition.identifier[reportId].value` | identifier.system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id；新增作業(EMRMsg01)通常不填(通報成功後由 HISMsg01 REPORT_LIST.REPORT_ID 回傳)；修改作業(EMRMsg02)必填，置於 Condition-nidrs-update(identifier[reportId] 1..1) |
| **通報單位資料** |  |  |  |  |  |  |
| `HOSPITAL` | 1..1 | String/11 | 通報單位醫事機構代碼。 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html)<br>[PractitionerRole-nidrs](StructureDefinition-PractitionerRole-nidrs.html) | `Organization.identifier[hospitalCode].value`<br>`Composition.custodian`<br>`PractitionerRole.organization` | identifier.system = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw、type = v2-0203#PRN；同一 Organization 亦由 MessageHeader.sender 及 Encounter.serviceProvider 參照 |
| `HOSPITAL_NAME` | 1..1 | String/100 | 通報單位名稱 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html) | `Organization.name` | 直接對應 |
| `HOSPITAL_ADDRESS` | 1..1 | String/100 | 通報單位地址 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html) | `Organization.address.text` | 直接對應 |
| `REPORTER_NAME` | 1..1 | String/30 | 通報單登錄者姓名 | [Practitioner-nidrs](StructureDefinition-Practitioner-nidrs.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Practitioner.name.text`<br>`Composition.author` | 建立 Practitioner(登錄者)及 PractitionerRole-nidrs(practitioner = 登錄者、organization = 通報單位)，Composition.author 參照該 PractitionerRole |
| `HOSPITAL_CONTACT` | 1..1 | String/100 | 通報者聯絡電話 | [PractitionerRole-nidrs](StructureDefinition-PractitionerRole-nidrs.html) | `PractitionerRole.telecom.value` | telecom.system = phone |
| `DIAGNOSTICIAN` | 1..1 | String/20 | 診斷醫師 | [Practitioner-nidrs](StructureDefinition-Practitioner-nidrs.html)<br>[Condition-nidrs](StructureDefinition-Condition-nidrs.html) | `Practitioner.name.text`<br>`Condition.asserter` | 建立 Practitioner(診斷醫師)，每一筆通報疾病 Condition.asserter 皆參照之 |
| **個案資料** |  |  |  |  |  |  |
| `IDNO` | 1..1 | String/10 | 身分證統一編號/外來人口之居留證統一證號、護照號碼；請優先填入身分證統一編號，如無法得知，始可填入居留證統一證號或護照號碼；倘無法取得上述3種證號時，請填入AA(本國新生兒，報告日期-出生日期&lt;6個月)、BB(本國人士)或CC(外國人士)，由系統自動編碼流水證號(範例：AA11300001)；EMR增修通報單時填入AA、BB、CC，NIDRS網頁將呈現最後一次異動之證號，不會以AA、BB、CC覆蓋寫入或重新編碼流水證號。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.identifier[idCardNumber/residentNumber/passportNumber/foreignPassport/nidrsTempId].value` | 依證號種類擇一 slice：身分證統一編號→idCardNumber(system http://www.moi.gov.tw)；居留證統一證號→residentNumber(http://www.immigration.gov.tw)；中華民國護照→passportNumber(http://hl7.org/fhir/sid/passport-TWN)；外國護照→foreignPassport(http://hl7.org/fhir/sid/passport-{ISO 3166-1 alpha-3})；AA/BB/CC→nidrsTempId(use = temp、system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-temp-id) |
| `NAME` | 1..1 | String/200 | 個案姓名 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.name[usual].text` | 直接對應(name.use = usual) |
| `NAME_PINYIN` | 0..1 | String/200 | 姓名羅馬拼音 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.name[official].text` | name.use = official，並加上 iso21090-EN-representation 擴充(valueCode = ABC) |
| `GENDER` | 0..1 | Code | 性別 (F-女, M-男, X-第三性別)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.gender` | F→female、M→male、X→other(ConceptMap cdc-gender-to-administrative-gender) |
| `BIRTHDAY` | 1..1 | String/10 | 出生日期；Ex.2021/01/01。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.birthDate` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `CITIZEN` | 0..1 | Int | 國籍 (0-本國籍, 1-非本國籍)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.extension[citizen].valueCoding` | 整數轉為代碼字串：0→CDCCitizen#0(本國籍)、1→CDCCitizen#1(非本國籍) |
| `NATIONALITY` | 0..1 | Code | 國家(代碼：國家代碼)；若國籍為「本國籍」，僅可填158；若為「非本國籍」，不可填寫158，請填寫護照的發放國家；查無國家名稱時，請輸入其他，並填寫其他國家欄位。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.extension[nationality].extension[code].valueCodeableConcept.coding` | coding.system = CodeSystem cdc-country；可依 ConceptMap cdc-country-to-iso3166 另加 ISO 3166 代碼 |
| `NATIONALITY_OTHER` | 0..1 | String/100 | 其他國家；國家代碼填寫其他時必填。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.extension[nationality].extension[code].valueCodeableConcept.text` | 與 NATIONALITY(其他)置於同一 CodeableConcept 之 text |
| `RESIDENCE_TYPE` | 0..1 | String/3 | 非本國籍居民身份(代碼：居留代碼)；「國籍」為本國籍時，「非本國籍居民身分」不可填寫。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.extension[residenceType].valueCodeableConcept.coding` | coding.system = CodeSystem cdc-residence-type；本國籍時不可填寫(invariant nidrs-pat-3) |
| `RESIDENCE_TYPE_OTHER` | 0..1 | String/100 | 非本國籍居民身份說明；非本國籍居民身份填寫其他時必填。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.extension[residenceType].valueCodeableConcept.text` | 置於同一 CodeableConcept 之 text |
| `RESIDENCE_COUNTY` | 1..1 | Code | 居住縣市(代碼：縣市代碼)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.address.extension[adminArea].extension[county].valueCoding` | coding.system = CodeSystem cdc-county |
| `RESIDENCE_TOWN` | 1..1 | Code | 鄉鎮市區(代碼：縣市代碼:鄉鎮市區代碼)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.address.extension[adminArea].extension[town].valueCoding` | coding.system = CodeSystem cdc-town |
| `RESIDENCE_VILLAGE` | 0..1 | Code | 居住村里(代碼：縣市代碼:村里代碼)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.address.extension[adminArea].extension[village].valueCoding` | coding.system = CodeSystem cdc-village |
| `ADDRESS` | 0..1 | String/150 | 街道地址 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.address.text` | 直接對應 |
| `HAS_ORG` | 0..1 | Bool | 人口密集機構 (true-是, false-否)。 | [Observation-nidrs-dense-institution](StructureDefinition-Observation-nidrs-dense-institution.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Observation.value[x]`<br>`Composition.section[epidemiology].entry[denseInstitution]` | false→valueBoolean = false；true 且有 ORG_ID→valueCodeableConcept(機構類別)；true 但無 ORG_ID→valueBoolean = true |
| `ORG_ID` | 0..1 | Code | 機構類別(代碼：人口密集機構類別代碼)。 | [Observation-nidrs-dense-institution](StructureDefinition-Observation-nidrs-dense-institution.html) | `Observation.valueCodeableConcept.coding` | coding.system = CodeSystem cdc-dense-institution |
| `MARRIAGE` | 0..1 | Code | 婚姻狀況(代碼：婚姻狀況)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.maritalStatus.coding` | 填 CodeSystem cdc-marital-status 代碼，並建議依 ConceptMap cdc-marital-status-to-v3 加入 v3-MaritalStatus 代碼 |
| **病患動向(請擇一填寫)** |  |  |  |  |  |  |
| `HOSPITALIZED_OUTPATIENT` | 0..1 | Bool | 病患動向_門診 (true-是, false-否)。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept`<br>`Encounter.class` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#outpatient、Encounter.class = v3-ActCode#AMB；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `HOSPITALIZED_EMERGENCY` | 0..1 | Bool | 病患動向_急診待床 (true-是, false-否)。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept`<br>`Encounter.class` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#emergency、Encounter.class = v3-ActCode#EMER；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `HOSPITALIZED_GENERAL_WARD` | 0..1 | Bool | 病患動向_入住一般病房 (true-是, false-否)；勾選是時，入住一般病房日必填。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept`<br>`Encounter.class` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#general-ward、Encounter.class = v3-ActCode#IMP；入住一般病房日(HOSPITALIZED_DAY)必填(nidrs-enc-1)；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `HOSPITALIZED_ICU` | 0..1 | Bool | 病患動向_入住加護病房 (true-是, false-否)；勾選是時，首次入住加護病房日必填、轉出加護病房日選填。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept`<br>`Encounter.location[icu]` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#icu、Encounter.class = v3-ActCode#IMP，並建立 location[icu](nidrs-enc-2)；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `HOSPITALIZED_ISOLATION_ROOM` | 0..1 | Bool | 病患動向_入住隔離病房 (true-是, false-否)；勾選是時，首次入住隔離病房日必填、轉出隔離病房日選填。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept`<br>`Encounter.location[isolationRoom]` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#isolation-room、Encounter.class = v3-ActCode#IMP，並建立 location[isolationRoom](nidrs-enc-2)；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `HOSPITALIZED_DISCHARGED` | 0..1 | Bool | 病患動向_出院 (true-是, false-否)；勾選是時，出院日必填。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept`<br>`Encounter.status` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#discharged、Encounter.status = finished；出院日(DISCHARGE)必填(nidrs-enc-3)；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `HOSPITALIZED_TRANSFER` | 0..1 | Bool | 病患動向_轉院 (true-是, false-否)；勾選是時，轉至院所名稱必填、轉院日期必填。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept`<br>`Encounter.hospitalization.dischargeDisposition` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#transfer、hospitalization.dischargeDisposition = discharge-disposition#other-hcf；轉至院所與轉院日期必填(nidrs-enc-4)；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `HOSPITALIZED_NONE` | 0..1 | Bool | 病患動向_無就醫。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.extension[patientMovement].valueCodeableConcept` | true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#none；Encounter.class 為 FHIR 必填但無對應代碼(ConceptMap 為 unmatched)，建議於 class 加上 data-absent-reason 擴充(not-applicable)；false 或未填 → 不產生。原規格病患動向請擇一填寫 |
| `STAY_IN_IW` | 0..1 | String/10 | 首次入住隔離病房日；Ex.2021/01/01。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.location[isolationRoom].period.start` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `LEAVE_IW` | 0..1 | String/10 | 轉出隔離病房日；Ex.2021/01/01。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.location[isolationRoom].period.end` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `STAY_IN_ICU` | 0..1 | String/10 | 首次入住加護病房日；Ex.2021/01/01。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.location[icu].period.start` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `LEAVE_ICU` | 0..1 | String/10 | 轉出加護病房日；Ex.2021/01/01。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.location[icu].period.end` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `HOSPITALIZED_DAY` | 0..1 | String/10 | 入住一般病房日；Ex.2021/01/01。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.period.start` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `DISCHARGE` | 0..1 | String/10 | 出院日；Ex.2021/01/01。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.period.end` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `TRANSFER_HOSPITAL` | 0..1 | String/10 | 轉至院所名稱；醫事機構代碼。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html)<br>[Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html) | `Encounter.hospitalization.destination`<br>`Organization.identifier[hospitalCode].value` | 以醫事機構代碼建立(或參照)Organization-nidrs-hospital，hospitalization.destination 參照之 |
| `TRANSFER_DAY` | 0..1 | String/10 | 轉院日期；Ex.2021/01/01。 | [Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Encounter.period.end` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `DEATH` | 1..1 | Bool | 是否死亡 (true-是, false-否)；本欄位勾選「是」，死亡日期必填。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.deceased[x]` | false→deceasedBoolean = false；true→改以 deceasedDateTime(= DEATH_DAY)表達，不使用 deceasedBoolean = true(invariant nidrs-pat-2) |
| `DEATH_DAY` | 0..1 | String/10 | 死亡日期；Ex.2021/01/01。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.deceasedDateTime` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `DEATH_REASON_A` | 0..1 | String/400 | 死亡原因甲 | [Observation-nidrs-cause-of-death](StructureDefinition-Observation-nidrs-cause-of-death.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Observation.component[reasonA].valueString`<br>`Composition.section[death].entry` | 有任一死亡原因時建立一筆死亡原因 Observation，並由 Composition.section[death] 參照 |
| `DEATH_REASON_B` | 0..1 | String/400 | 死亡原因乙 | [Observation-nidrs-cause-of-death](StructureDefinition-Observation-nidrs-cause-of-death.html) | `Observation.component[reasonB].valueString` | 同上 |
| `DEATH_REASON_C` | 0..1 | String/400 | 死亡原因丙 | [Observation-nidrs-cause-of-death](StructureDefinition-Observation-nidrs-cause-of-death.html) | `Observation.component[reasonC].valueString` | 同上 |
| `DEATH_REASON_D` | 0..1 | String/400 | 死亡原因丁 | [Observation-nidrs-cause-of-death](StructureDefinition-Observation-nidrs-cause-of-death.html) | `Observation.component[reasonD].valueString` | 同上 |
| `DEATH_REASON_OTHER` | 0..1 | String/400 | 死亡原因其他 | [Observation-nidrs-cause-of-death](StructureDefinition-Observation-nidrs-cause-of-death.html) | `Observation.component[reasonOther].valueString` | 同上 |
| `NOTE` | 0..1 | String/250 | 備註；新增通報時可填寫，修改通報時不可填寫。 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Composition.extension[note].valueString` | Composition-nidrs-report-update 之 extension[note] 為 0..0 |
| `MODIFIED_REASON` | 0..1 | String/250 | 修改原因；修改通報時必填，新增通報時不可填寫。 | [Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html) | `Composition.extension[modifiedReason].valueString` | 僅用於 Composition-nidrs-report-update(1..1)；Composition-nidrs-report 之 extension[modifiedReason] 為 0..0 |
| **相關日期** |  |  |  |  |  |  |
| `NO_SICK_DAY` | 0..1 | Bool | 無發病日。 | [Condition-nidrs](StructureDefinition-Condition-nidrs.html) | `Condition.extension[noOnsetDate].valueBoolean` | 同一通報單之每一筆通報疾病 Condition 填入相同值；true 時不可填 onsetDateTime(nidrs-con-1) |
| `SICK_DAY` | 0..1 | String/10 | 發病日期；Ex.2021/01/01；有發病日時，本欄位必填，無發病日時，本欄不可填寫。 | [Condition-nidrs](StructureDefinition-Condition-nidrs.html) | `Condition.onsetDateTime` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)；複製至每一筆 Condition |
| `DIAGNOSE_DAY` | 1..1 | String/10 | 診斷日期；Ex.2021/01/01。 | [Condition-nidrs](StructureDefinition-Condition-nidrs.html) | `Condition.recordedDate` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)；複製至每一筆 Condition |
| `REPORTED_DAY` | 1..1 | String/10 | 報告日期；Ex.2021/01/01；「報告日期」欄位填入值僅可為該通報單建檔日起算往前31天內(含)之日期。 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Composition.date` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)(Composition.date 為 dateTime，可僅填日期) |
| `PHB_RECEIVED_DAY` | 1..1 | String/10 | 衛生局收到日；Ex.2021/01/01。 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Composition.extension[phbReceivedDate].valueDate` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| **臨床症狀** |  |  |  |  |  |  |
| `HAS_SYMPTOM` | 1..1 | Bool | 有無症狀；通報結核病時，此欄位與主要症狀(DISEASE_SYMPTOM)不可填寫；若「有」症狀，「發病日」必填；若「無」症狀，「無發病日」需選擇True；若有症狀，請繼續填寫DISEASE_SYMPTOM。 | [Condition-nidrs](StructureDefinition-Condition-nidrs.html) | `Condition.extension[hasSymptom].valueBoolean` | 複製至每一筆 Condition；相依檢核見 nidrs-con-2、nidrs-con-3 |
| **流行病學資料** |  |  |  |  |  |  |
| `OCCUPATION` | 1..1 | Code | 職業(代碼：職業代碼)。 | [Observation-nidrs-occupation](StructureDefinition-Observation-nidrs-occupation.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Observation.valueCodeableConcept.coding`<br>`Composition.section[epidemiology].entry[occupation]` | coding.system = CodeSystem cdc-occupation |
| `OCCUPATION_OTHER` | 0..1 | String/100 | 詳細職業身分說明；當職業選擇不詳，請於本欄說明。 | [Observation-nidrs-occupation](StructureDefinition-Observation-nidrs-occupation.html) | `Observation.valueCodeableConcept.text` | 置於同一 CodeableConcept 之 text |
| `HAS_TRAVEL_HISTORY` | 1..1 | Bool | 旅遊史 (true-有, false-無)；若有旅遊史，請繼續填寫旅遊史(TRAVEL)。 | [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Observation.valueBoolean`<br>`Composition.section[epidemiology].entry[epiFlag]` | Observation.code = CDCNIDRSObservation#HAS_TRAVEL_HISTORY |
| `HAS_ANIMAL_HISTORY` | 0..1 | Bool | 動物接觸史 (true-有, false-無)；若有動物接觸史，請繼續填寫接觸動物史(ANIMAL)；德國麻疹、麻疹、急性病毒性D型肝炎、腸病毒感染併發重症不收集動物接觸史，若傳送將不檢核且不呈現於網頁。 | [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html) | `Observation.valueBoolean` | Observation.code = CDCNIDRSObservation#HAS_ANIMAL_HISTORY |
| `EXPLORE_POSITIVE` | 0..1 | Bool | 與確定/極可能/可能病例曾有接觸或暴露共同感染源 | [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html) | `Observation.valueBoolean` | Observation.code = CDCNIDRSObservation#EXPLORE_POSITIVE |
| `EXPLORE_BODY_FLUID` | 0..1 | Bool | 具血體液接觸 | [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html) | `Observation.valueBoolean` | Observation.code = CDCNIDRSObservation#EXPLORE_BODY_FLUID |
| `EXPLORE_LAB` | 0..1 | Bool | 具實驗室暴露史 | [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html) | `Observation.valueBoolean` | Observation.code = CDCNIDRSObservation#EXPLORE_LAB |
| `EXPLORE_POLLUTED_FOOD` | 0..1 | Bool | 曾食用受汙染的水或食物 | [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html) | `Observation.valueBoolean` | Observation.code = CDCNIDRSObservation#EXPLORE_POLLUTED_FOOD |
| `EXPLORE_IATROGENIC` | 0..1 | Bool | 醫源型 | [Observation-nidrs-epi-flag](StructureDefinition-Observation-nidrs-epi-flag.html) | `Observation.valueBoolean` | Observation.code = CDCNIDRSObservation#EXPLORE_IATROGENIC |
| **個案生母資料** |  |  |  |  |  |  |
| `BIRTH_MOTHER_NAME` | 0..1 | String/200 | 生母姓名 | [RelatedPerson-nidrs-mother](StructureDefinition-RelatedPerson-nidrs-mother.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `RelatedPerson.name.text`<br>`Composition.section[mother].entry` | relationship = v3-RoleCode#NMTH；RelatedPerson.patient 參照通報個案 |
| `BIRTH_MOTHER_IDNO` | 0..1 | String/10 | 生母身份證統一編號/外來人口之居留證統一證號。 | [RelatedPerson-nidrs-mother](StructureDefinition-RelatedPerson-nidrs-mother.html) | `RelatedPerson.identifier.value` | identifier.system 依證號種類：身分證→http://www.moi.gov.tw；居留證→http://www.immigration.gov.tw |
{:.grid}

<a name="report-contactinfo"></a>
#### 通報單聯絡資料(Report_ContactInfo，表17)

邏輯模型：[ReportContactInfoModel](StructureDefinition-ReportContactInfoModel.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(Report_ContactInfo 本體)* |  |  | 通報單聯絡資料(Report_ContactInfo)之資料模型 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.telecom` | 每一筆聯絡資料對應一個 ContactPoint |
| `CONTACT_TYPE` | 1..1 | Code | 0:連絡電話/1:手機；連絡電話、手機皆必填。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.telecom[phone/mobile]` | 0(連絡電話)→telecom[phone](system = phone、use = home)；1(手機)→telecom[mobile](system = phone、use = mobile)；ConceptMap cdc-contact-type-to-contactpoint |
| `CONTACT_VALUE` | 1..1 | String/100 | 聯絡電話或手機號碼。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.telecom[phone/mobile].value` | 直接對應；若無請填「無」 |
{:.grid}

<a name="report-travel"></a>
#### 通報單旅遊史(Report_Travel，表18)

邏輯模型：[ReportTravelModel](StructureDefinition-ReportTravelModel.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(Report_Travel 本體)* |  |  | 通報單旅遊史(Report_Travel)之資料模型 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html) | `Observation` | 每一筆旅遊史建立一筆 Observation-nidrs-travel(code = LOINC 8691-8) |
| `TRAVEL_TYPE` | 1..1 | Code | 旅遊類型；代碼：0.國內旅遊, 1.國外旅遊史, 2.國外居住史。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html) | `Observation.component[travelType].valueCodeableConcept.coding` | coding.system = CodeSystem cdc-travel-type |
| `TRAVEL_AREA` | 1..1 | Code | 地區；當旅遊類型為 0 填寫縣市代碼；1、2 填寫國家代碼。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html) | `Observation.valueCodeableConcept.coding` | TRAVEL_TYPE = 0→system = cdc-county；1、2→system = cdc-country(invariant nidrs-trv-1) |
| `TRAVEL_AREA_OTHER` | 0..1 | String/100 | 其他國家；國外旅遊史/國外居住史國家代碼選擇其他時，本欄位必填。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html) | `Observation.valueCodeableConcept.text` | 置於同一 CodeableConcept 之 text |
| `TRAVEL_SUB_AREA` | 0..1 | String/100 | 次級行政區；國外旅遊史/國外居住史，可選填。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html) | `Observation.component[subArea].valueString` | 直接對應 |
| `TRAVEL_DATE_FROM` | 1..1 | String/10 | 開始時間 Ex.2021/01/01；旅遊類型為「國外居住史」時，此欄位為「離境居住國日期」；日期檢核請參考共同欄位檢核條件。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html) | `Observation.effectivePeriod.start` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
| `TRAVEL_DATE_TO` | 1..1 | String/10 | 結束時間 Ex.2021/01/01；旅遊類型為「國外居住史」時，此欄位為「入境我國日期」。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html) | `Observation.effectivePeriod.end` | 日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01) |
{:.grid}

<a name="report-animal"></a>
#### 通報單接觸動物史(Report_Animal，表19)

邏輯模型：[ReportAnimalModel](StructureDefinition-ReportAnimalModel.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(Report_Animal 本體)* |  |  | 通報單接觸動物史(Report_Animal)之資料模型 | [Observation-nidrs-animal](StructureDefinition-Observation-nidrs-animal.html) | `Observation` | 每一筆接觸動物建立一筆 Observation-nidrs-animal |
| `ANIMAL_ID` | 1..1 | Code | 接觸動物種類(代碼：動物代碼)。 | [Observation-nidrs-animal](StructureDefinition-Observation-nidrs-animal.html) | `Observation.valueCodeableConcept.coding` | coding.system = CodeSystem cdc-animal |
| `ANIMAL_OTHER` | 0..1 | String/120 | 其他接觸動物；接觸動物種類代碼為其他，本欄位必填。 | [Observation-nidrs-animal](StructureDefinition-Observation-nidrs-animal.html) | `Observation.valueCodeableConcept.text` | 置於同一 CodeableConcept 之 text |
{:.grid}

### 通報單新增作業

<a name="emrmsg01"></a>
#### 傳送資料結構(EMRMsg01，表8)

邏輯模型：[EMRMsg01Model](StructureDefinition-EMRMsg01Model.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(EMRMsg01 本體)* |  |  | 通報單新增作業傳送資料結構(EMRMsg01)之資料模型 | [Bundle-nidrs-report-create](StructureDefinition-Bundle-nidrs-report-create.html)<br>[MessageHeader-nidrs-report-create](StructureDefinition-MessageHeader-nidrs-report-create.html) | `Bundle`<br>`MessageHeader` | Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg01；原 JSON 以醫事機構憑證進行 JWT 簽章後傳送 |
| `REPORTS` | 1..10 | (區塊) | 通報單，可一次通報多筆個案，最多10筆。 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html)<br>[MessageHeader-nidrs-report-create](StructureDefinition-MessageHeader-nidrs-report-create.html) | `Composition`<br>`MessageHeader.focus` | 每一筆 REPORTS 產生一份 Composition-nidrs-report(及其 Patient、Condition…)，MessageHeader.focus 依序參照(最多 10 筆) |
| `REPORTS.REPORT` | 1..1 | (區塊) | 通報單個案共同欄位區塊。 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Composition` | 以共同欄位建立 Composition 及其 subject(Patient)、author、custodian、各 section 之 entry |
| `REPORTS.REPORT.REPORT` | 1..1 | [Report_Common](#report-common) | 共同欄位，欄位請參考通報單共同欄位(Report_Common)。 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html)<br>[Patient-nidrs](StructureDefinition-Patient-nidrs.html)<br>[Condition-nidrs](StructureDefinition-Condition-nidrs.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Composition`<br>`Patient`<br>`Condition`<br>`Encounter` | 逐欄對應見 Report_Common |
| `REPORTS.REPORT.CONTACT_INFO` | 1..* | [Report_ContactInfo](#report-contactinfo) | 個案聯絡資料，欄位請參考通報單聯絡資料(Report_ContactInfo)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.telecom` | 每一筆對應一個 Patient.telecom(phone 或 mobile slice) |
| `REPORTS.REPORT.TRAVEL` | 0..* | [Report_Travel](#report-travel) | 旅遊史，欄位請參考通報單旅遊史(Report_Travel)；共同欄位的旅遊史為有時，需填寫。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Observation`<br>`Composition.section[epidemiology].entry[travel]` | 每一筆旅遊史建立一筆 Observation-nidrs-travel |
| `REPORTS.REPORT.ANIMAL` | 0..* | [Report_Animal](#report-animal) | 接觸動物史，欄位請參考通報單接觸動物史(Report_Animal)；共同欄位的動物接觸史為有時，需填寫。 | [Observation-nidrs-animal](StructureDefinition-Observation-nidrs-animal.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Observation`<br>`Composition.section[epidemiology].entry[animal]` | 每一筆接觸動物建立一筆 Observation-nidrs-animal |
| `REPORTS.DISEASE` | 1..1 | (區塊) | 通報疾病區塊。 | [Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Composition.section[disease]` | section.code = LOINC 11450-4 |
| `REPORTS.DISEASE.DISEASE_ID` | 1..10 | String/10 | 通報疾病ID，同一個案一次最多通報10個法定傳染病。 | [Condition-nidrs](StructureDefinition-Condition-nidrs.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `Condition.code.coding[cdcDisease].code`<br>`Composition.section[disease].entry` | 每一 DISEASE_ID 建立一筆 Condition(system = CodeSystem cdc-disease)；共同欄位之日期、症狀、診斷醫師複製至每一筆 |
| `REPORTS.DISEASE.DISEASE_SYMPTOM` | 0..* | int | 疾病與主要症狀關聯代碼，請參考附錄四_通報代碼彙整表之「疾病與主要症狀關連」及「症狀代碼」；若此欄位填寫非該疾病關聯之主要症狀代碼，NIDRS將自動將本欄位改填入其他代碼(999)，並將醫院上傳之症狀改填至「DISEASE_SYMPTOM_OTHER」欄位中。 | [Condition-nidrs](StructureDefinition-Condition-nidrs.html) | `Condition.evidence.code.coding` | 整數轉為代碼字串(system = CodeSystem cdc-symptom)，每一症狀一筆 coding；多疾病時依 ConceptMap cdc-disease-symptom 填入相關疾病之 Condition |
| `REPORTS.DISEASE.DISEASE_SYMPTOM_OTHER` | 0..1 | String/100 | 當主要症狀含有其他代碼「999」時須填寫。 | [Condition-nidrs](StructureDefinition-Condition-nidrs.html) | `Condition.evidence.code.text` | 置於含 coding 999(其他) 之 evidence.code.text |
| `REPORTS.DISEASE.DISEASE_FIELD` | 0..* | (區塊) | 疾病增補填答，欄位請參考附錄二_法定傳染病增補欄位與檢核邏輯。 | [QuestionnaireResponse-nidrs](StructureDefinition-QuestionnaireResponse-nidrs.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `QuestionnaireResponse.item`<br>`Composition.section[supplement].entry` | 依通報疾病建立 QuestionnaireResponse(questionnaire = https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-{疾病代碼})；item 須依 Questionnaire 之群組(section/group)階層巢狀 |
| `REPORTS.DISEASE.DISEASE_FIELD.KEY` | 1..1 | String/200 | 答題編號。 | [QuestionnaireResponse-nidrs](StructureDefinition-QuestionnaireResponse-nidrs.html) | `QuestionnaireResponse.item.linkId` | 即 Questionnaire 之 item.linkId(最內層 item) |
| `REPORTS.DISEASE.DISEASE_FIELD.VALUE` | 1..1 | String/200 | 答案值。 | [QuestionnaireResponse-nidrs](StructureDefinition-QuestionnaireResponse-nidrs.html) | `QuestionnaireResponse.item.answer.value[x]` | 依 Questionnaire item.type 轉換：boolean(答案值 1=勾選)→valueBoolean = true；date(yyyy/MM/dd)→valueDate(yyyy-MM-dd)；integer/decimal→valueInteger/valueDecimal；string/text→valueString |
{:.grid}

<a name="hismsg01"></a>
#### 回應資料結構(HISMsg01，表9)

邏輯模型：[HISMsg01Model](StructureDefinition-HISMsg01Model.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(HISMsg01 本體)* |  |  | 通報單新增作業回應資料結構(HISMsg01)之資料模型 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `Bundle`<br>`MessageHeader` | MessageHeader.eventCoding = CDCMessageEvent#HISMsg01；response.identifier = 所回覆 EMRMsg01 之 MessageHeader.id |
| `REPORT_RESULT` | 1..10 | (區塊) | 通報單新增結果(對應 EMRMsg01 之每一筆 REPORTS)。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `Bundle`<br>`OperationOutcome` | Bundle-nidrs-response 一則；每一筆 REPORT_RESULT 建立一筆 OperationOutcome-nidrs(entry[operationOutcome])，成功者另建立 REPORT_LIST 之 Condition |
| `REPORT_RESULT.STATUS` | 1..1 | Code | 處理狀態；SUCCESS:成功(成立通報單號請參考REPORT_LIST)；FAILURE:失敗，失敗訊息請參考ERROR_LIST。 | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `MessageHeader.response.code` | SUCCESS→response.code = ok；FAILURE→response.code = fatal-error。多筆 REPORT_RESULT 時，MessageHeader.response.code 表達整體結果(全部成功→ok、任一失敗→fatal-error)，各筆結果以其 OperationOutcome-nidrs 表達(SUCCESS：issue.severity = information、issue.code = informational、details = CDCProcessingResult#SUCCESS) |
| `REPORT_RESULT.RESULT_TIME` | 1..1 | Datetime | 處理日期；格式 yyyyMMdd HH:mi:ss。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | `Bundle.timestamp` | 格式 yyyyMMdd HH:mi:ss 轉為 FHIR instant yyyy-MM-ddTHH:mm:ss+08:00(例：20250101 13:45:00→2025-01-01T13:45:00+08:00)；多筆時取最晚者 |
| `REPORT_RESULT.REPORT_LIST` | 0..* | (區塊) | 成功時，通報單清單。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html)<br>[Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `Condition`<br>`Bundle.entry[condition]`<br>`MessageHeader.focus` | 每一筆(每一通報疾病)建立一筆 Condition-nidrs-case-ref |
| `REPORT_RESULT.REPORT_LIST.REPORT_ID` | 1..1 | String/13 | 通報單號。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html) | `Condition.identifier[reportId].value` | system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id |
| `REPORT_RESULT.REPORT_LIST.DISEASE_ID` | 1..1 | String/10 | 通報疾病。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html) | `Condition.code.coding.code` | system = CodeSystem cdc-disease |
| `REPORT_RESULT.REPORT_LIST.IDNO` | 1..1 | String/10 | 個案證號(NIDRS 自動編碼者回傳流水證號)。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html) | `Condition.subject.identifier.value` | subject 以 identifier 參照(logical reference)；system 依證號種類同 Patient-nidrs.identifier，AA/BB/CC 自動編碼者使用 nidrs-temp-id |
| `REPORT_RESULT.ERROR_LIST` | 0..* | (區塊) | 失敗時，錯誤清單。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `OperationOutcome.issue`<br>`MessageHeader.response.details` | 每一筆錯誤對應一個 issue(severity = error) |
| `REPORT_RESULT.ERROR_LIST.ERROR_Code` | 1..1 | String/10 | 錯誤代碼。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.details.coding.code` | coding.system = CodeSystem cdc-processing-result；10 碼 = 項目代碼(6碼)+檢核代碼(4碼)，組成部分見 CDCProcessingResultPart；issue.code 依錯誤性質(必填→required、格式→value、重複通報→duplicate，其餘→processing) |
| `REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE` | 1..1 | String/2000 | 錯誤訊息。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.diagnostics` | 直接對應；可同時填入 issue.details.text |
{:.grid}

### 通報單修改作業

<a name="emrmsg02"></a>
#### 傳送資料結構(EMRMsg02，表10)

邏輯模型：[EMRMsg02Model](StructureDefinition-EMRMsg02Model.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(EMRMsg02 本體)* |  |  | 通報單修改作業傳送資料結構(EMRMsg02)之資料模型 | [Bundle-nidrs-report-update](StructureDefinition-Bundle-nidrs-report-update.html)<br>[MessageHeader-nidrs-report-update](StructureDefinition-MessageHeader-nidrs-report-update.html) | `Bundle`<br>`MessageHeader` | Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg02 |
| `REPORT` | 1..1 | (區塊) | 通報單，一次可以修改一筆通報單。 | [Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html)<br>[MessageHeader-nidrs-report-update](StructureDefinition-MessageHeader-nidrs-report-update.html) | `Composition`<br>`MessageHeader.focus` | 產生一份 Composition-nidrs-report-update |
| `REPORT.REPORT` | 1..1 | (區塊) | 通報單個案共同欄位區塊。 | [Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html) | `Composition` | 以共同欄位建立 Composition 及其 subject(Patient)、author、custodian、各 section 之 entry |
| `REPORT.REPORT.REPORT` | 1..1 | [Report_Common](#report-common) | 共同欄位，欄位請參考通報單共同欄位(Report_Common)。 | [Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html)<br>[Patient-nidrs](StructureDefinition-Patient-nidrs.html)<br>[Condition-nidrs-update](StructureDefinition-Condition-nidrs-update.html)<br>[Encounter-nidrs](StructureDefinition-Encounter-nidrs.html) | `Composition`<br>`Patient`<br>`Condition`<br>`Encounter` | 逐欄對應見 Report_Common；修改作業時 REPORT(通報單號)與 MODIFIED_REASON 必填、NOTE 不可填 |
| `REPORT.REPORT.CONTACT_INFO` | 1..* | [Report_ContactInfo](#report-contactinfo) | 個案聯絡資料，欄位請參考通報單聯絡資料(Report_ContactInfo)。 | [Patient-nidrs](StructureDefinition-Patient-nidrs.html) | `Patient.telecom` | 每一筆對應一個 Patient.telecom(phone 或 mobile slice) |
| `REPORT.REPORT.TRAVEL` | 0..* | [Report_Travel](#report-travel) | 旅遊史，欄位請參考通報單旅遊史(Report_Travel)；共同欄位的旅遊史為有時，需填寫。 | [Observation-nidrs-travel](StructureDefinition-Observation-nidrs-travel.html)<br>[Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html) | `Observation`<br>`Composition.section[epidemiology].entry[travel]` | 每一筆旅遊史建立一筆 Observation-nidrs-travel |
| `REPORT.REPORT.ANIMAL` | 0..* | [Report_Animal](#report-animal) | 接觸動物史，欄位請參考通報單接觸動物史(Report_Animal)；共同欄位的動物接觸史為有時，需填寫。 | [Observation-nidrs-animal](StructureDefinition-Observation-nidrs-animal.html)<br>[Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html) | `Observation`<br>`Composition.section[epidemiology].entry[animal]` | 每一筆接觸動物建立一筆 Observation-nidrs-animal |
| `REPORT.DISEASE` | 1..1 | (區塊) | 通報疾病區塊；修改作業不傳送 DISEASE_ID。 | [Composition-nidrs-report-update](StructureDefinition-Composition-nidrs-report-update.html)<br>[Condition-nidrs-update](StructureDefinition-Condition-nidrs-update.html) | `Composition.section[disease]`<br>`Condition` | 原規格無 DISEASE_ID，惟 Condition.code 為必填：請填入原通報疾病代碼(即通報時之 DISEASE_ID / HISMsg01 REPORT_LIST.DISEASE_ID)，section[disease].entry 僅 1 筆 |
| `REPORT.DISEASE.DISEASE_SYMPTOM` | 0..* | int | 疾病與主要症狀關聯代碼，請參考附錄四，若非疾病對應之代碼，則歸在其他(999)。 | [Condition-nidrs-update](StructureDefinition-Condition-nidrs-update.html) | `Condition.evidence.code.coding` | 整數轉為代碼字串(system = CodeSystem cdc-symptom) |
| `REPORT.DISEASE.DISEASE_SYMPTOM_OTHER` | 0..1 | String/100 | 當主要症狀含有其他時須填寫。 | [Condition-nidrs-update](StructureDefinition-Condition-nidrs-update.html) | `Condition.evidence.code.text` | 置於含 coding 999(其他) 之 evidence.code.text |
| `REPORT.DISEASE.DISEASE_FIELD` | 0..* | (區塊) | 疾病增補填答，欄位請參考附錄二_法定傳染病增補欄位與檢核邏輯。 | [QuestionnaireResponse-nidrs](StructureDefinition-QuestionnaireResponse-nidrs.html)<br>[Composition-nidrs-report](StructureDefinition-Composition-nidrs-report.html) | `QuestionnaireResponse.item`<br>`Composition.section[supplement].entry` | 依通報疾病建立 QuestionnaireResponse(questionnaire = https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-{疾病代碼})；item 須依 Questionnaire 之群組(section/group)階層巢狀 |
| `REPORT.DISEASE.DISEASE_FIELD.KEY` | 1..1 | String/20 | 答題編號。 | [QuestionnaireResponse-nidrs](StructureDefinition-QuestionnaireResponse-nidrs.html) | `QuestionnaireResponse.item.linkId` | 即 Questionnaire 之 item.linkId(最內層 item) |
| `REPORT.DISEASE.DISEASE_FIELD.VALUE` | 1..1 | String/200 | 答案值。 | [QuestionnaireResponse-nidrs](StructureDefinition-QuestionnaireResponse-nidrs.html) | `QuestionnaireResponse.item.answer.value[x]` | 依 Questionnaire item.type 轉換：boolean(答案值 1=勾選)→valueBoolean = true；date(yyyy/MM/dd)→valueDate(yyyy-MM-dd)；integer/decimal→valueInteger/valueDecimal；string/text→valueString |
{:.grid}

<a name="hismsg02"></a>
#### 回應資料結構(HISMsg02，表11)

邏輯模型：[HISMsg02Model](StructureDefinition-HISMsg02Model.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(HISMsg02 本體)* |  |  | 通報單修改作業回應資料結構(HISMsg02)之資料模型 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `Bundle`<br>`MessageHeader` | MessageHeader.eventCoding = CDCMessageEvent#HISMsg02 |
| `REPORT_RESULT` | 1..1 | (區塊) | 通報單修改結果。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | `Bundle` | Bundle-nidrs-response 一則 |
| `REPORT_RESULT.STATUS` | 1..1 | Code | 處理狀態；SUCCESS:成功(成立通報單號請參考REPORT_LIST)；FAILURE:失敗，失敗訊息請參考ERROR_LIST。 | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `MessageHeader.response.code` | SUCCESS→response.code = ok；FAILURE→response.code = fatal-error |
| `REPORT_RESULT.RESULT_TIME` | 1..1 | Datetime | 處理日期；格式 yyyyMMdd HH:mi:ss。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | `Bundle.timestamp` | 格式 yyyyMMdd HH:mi:ss 轉為 FHIR instant yyyy-MM-ddTHH:mm:ss+08:00(例：20250101 13:45:00→2025-01-01T13:45:00+08:00) |
| `REPORT_RESULT.REPORT_LIST` | 0..* | (區塊) | 成功時，通報單清單。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html)<br>[Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `Condition`<br>`Bundle.entry[condition]`<br>`MessageHeader.focus` | 每一筆(每一通報疾病)建立一筆 Condition-nidrs-case-ref |
| `REPORT_RESULT.REPORT_LIST.REPORT_ID` | 1..1 | String/13 | 通報單號。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html) | `Condition.identifier[reportId].value` | system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id |
| `REPORT_RESULT.REPORT_LIST.DISEASE_ID` | 1..1 | String/10 | 通報疾病。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html) | `Condition.code.coding.code` | system = CodeSystem cdc-disease |
| `REPORT_RESULT.REPORT_LIST.IDNO` | 1..1 | String/10 | 個案證號(NIDRS 自動編碼者回傳流水證號)。 | [Condition-nidrs-case-ref](StructureDefinition-Condition-nidrs-case-ref.html) | `Condition.subject.identifier.value` | subject 以 identifier 參照(logical reference)；system 依證號種類同 Patient-nidrs.identifier，AA/BB/CC 自動編碼者使用 nidrs-temp-id |
| `REPORT_RESULT.ERROR_LIST` | 0..* | (區塊) | 失敗時，錯誤清單。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `OperationOutcome.issue`<br>`MessageHeader.response.details` | 每一筆錯誤對應一個 issue(severity = error) |
| `REPORT_RESULT.ERROR_LIST.ERROR_Code` | 1..1 | String/10 | 錯誤代碼。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.details.coding.code` | coding.system = CodeSystem cdc-processing-result；10 碼 = 項目代碼(6碼)+檢核代碼(4碼)，組成部分見 CDCProcessingResultPart；issue.code 依錯誤性質(必填→required、格式→value、重複通報→duplicate，其餘→processing) |
| `REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE` | 1..1 | String/2000 | 錯誤訊息。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.diagnostics` | 直接對應；可同時填入 issue.details.text |
{:.grid}

### 通報單病歷資料傳送作業

<a name="emrmsg03"></a>
#### 傳送資料結構(EMRMsg03，表12)

邏輯模型：[EMRMsg03Model](StructureDefinition-EMRMsg03Model.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(EMRMsg03 本體)* |  |  | 通報單病歷資料傳送作業傳送資料結構(EMRMsg03)之資料模型 | [Bundle-nidrs-document](StructureDefinition-Bundle-nidrs-document.html)<br>[MessageHeader-nidrs-document](StructureDefinition-MessageHeader-nidrs-document.html) | `Bundle`<br>`MessageHeader` | Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg03 |
| `REPORT` | 1..1 | (區塊) | 通報單病歷資料。 | [DocumentReference-nidrs](StructureDefinition-DocumentReference-nidrs.html) | `DocumentReference` | 建立一筆 DocumentReference-nidrs |
| `REPORT.REPORT_ID` | 1..1 | String/13 | 通報單號。 | [DocumentReference-nidrs](StructureDefinition-DocumentReference-nidrs.html) | `DocumentReference.context.related.identifier.value` | context.related 以 identifier(system = nidrs-report-id)參照 Condition-nidrs-case-ref，Bundle 內不需附 Condition |
| `REPORT.HOSPITAL` | 1..1 | String/10 | 通報醫院醫事機構代碼。 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html)<br>[DocumentReference-nidrs](StructureDefinition-DocumentReference-nidrs.html)<br>[MessageHeader-nidrs-document](StructureDefinition-MessageHeader-nidrs-document.html) | `Organization.identifier[hospitalCode].value`<br>`DocumentReference.custodian`<br>`MessageHeader.sender` | 建立 Organization-nidrs-hospital(Bundle.entry[organization])，custodian 與 MessageHeader.sender 參照之 |
| `REPORT.FILE_NAME` | 1..1 | String/255 | 病歷檔案名稱。 | [DocumentReference-nidrs](StructureDefinition-DocumentReference-nidrs.html) | `DocumentReference.content.attachment.title` | 直接對應 |
| `REPORT.FILE_CATEGORY` | 1..1 | Code | 檔案類別；1:出院病摘、2:門診病歷、3:檢驗報告、4:醫療影像及報告、0:其他；若非前述檔案類型，則歸在0其他。 | [DocumentReference-nidrs](StructureDefinition-DocumentReference-nidrs.html) | `DocumentReference.category.coding.code` | system = CodeSystem cdc-file-category |
| `REPORT.FILE_TYPE` | 1..1 | Code | 檔案類型；1:docx、2:pdf、3:odt。 | [DocumentReference-nidrs](StructureDefinition-DocumentReference-nidrs.html) | `DocumentReference.content.attachment.contentType` | 轉為 MIME type：1→application/vnd.openxmlformats-officedocument.wordprocessingml.document；2→application/pdf；3→application/vnd.oasis.opendocument.text(ValueSet NIDRSFileMimeType) |
| `REPORT.ANAMNESIS` | 1..1 | String | 病歷資料，以base64編碼。 | [DocumentReference-nidrs](StructureDefinition-DocumentReference-nidrs.html) | `DocumentReference.content.attachment.data` | base64 字串直接填入 base64Binary |
{:.grid}

<a name="hismsg03"></a>
#### 回應資料結構(HISMsg03，表13)

邏輯模型：[HISMsg03Model](StructureDefinition-HISMsg03Model.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(HISMsg03 本體)* |  |  | 通報單病歷資料傳送作業回應資料結構(HISMsg03)之資料模型 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `Bundle`<br>`MessageHeader` | MessageHeader.eventCoding = CDCMessageEvent#HISMsg03 |
| `REPORT_RESULT` | 1..1 | (區塊) | 通報單病歷資料傳送結果(原規格說明欄記為「通報單修改結果」)。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | `Bundle` | Bundle-nidrs-response 一則 |
| `REPORT_RESULT.STATUS` | 1..1 | Code | 處理狀態；SUCCESS:成功；FAILURE:失敗，失敗訊息請參考ERROR_LIST。 | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `MessageHeader.response.code` | SUCCESS→ok；FAILURE→fatal-error |
| `REPORT_RESULT.RESULT_TIME` | 1..1 | Datetime | 處理日期；格式 yyyyMMdd HH:mi:ss。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | `Bundle.timestamp` | 格式 yyyyMMdd HH:mi:ss 轉為 FHIR instant yyyy-MM-ddTHH:mm:ss+08:00(例：20250101 13:45:00→2025-01-01T13:45:00+08:00) |
| `REPORT_RESULT.ERROR_LIST` | 0..* | (區塊) | 失敗時，錯誤清單。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `OperationOutcome.issue`<br>`MessageHeader.response.details` | 每一筆錯誤對應一個 issue(severity = error) |
| `REPORT_RESULT.ERROR_LIST.ERROR_Code` | 1..1 | String/10 | 錯誤代碼。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.details.coding.code` | coding.system = CodeSystem cdc-processing-result；10 碼 = 項目代碼(6碼)+檢核代碼(4碼)，組成部分見 CDCProcessingResultPart；issue.code 依錯誤性質(必填→required、格式→value、重複通報→duplicate，其餘→processing) |
| `REPORT_RESULT.ERROR_LIST.ERROR_MESSAGE` | 1..1 | String/2000 | 錯誤訊息。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.diagnostics` | 直接對應；可同時填入 issue.details.text |
{:.grid}

### 通報單送驗新增作業

<a name="emrmsg04"></a>
#### 傳送資料結構(EMRMsg04，表14)

邏輯模型：[EMRMsg04Model](StructureDefinition-EMRMsg04Model.html)。`SAMPLE`(法傳送驗單)對應 [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html)/[Specimen-nidrs](StructureDefinition-Specimen-nidrs.html)；`TB_SAMPLE`(法傳TB送驗單)對應 [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html)/[Specimen-nidrs-tb](StructureDefinition-Specimen-nidrs-tb.html)/[Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html)。

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(EMRMsg04 本體)* |  |  | 通報單送驗新增作業傳送資料結構(EMRMsg04)之資料模型 | [Bundle-nidrs-sample](StructureDefinition-Bundle-nidrs-sample.html)<br>[MessageHeader-nidrs-sample](StructureDefinition-MessageHeader-nidrs-sample.html) | `Bundle`<br>`MessageHeader` | Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg04；MessageHeader.focus 參照 ServiceRequest |
| `SAMPLE` | 0..1 | (區塊) | 法傳送驗單欄位；原規格未列基數，依 Bundle-nidrs-sample 一則訊息傳送 SAMPLE 或 TB_SAMPLE 其中之一。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html)<br>[Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `ServiceRequest`<br>`Specimen` | 建立 ServiceRequest-nidrs-sample 與 Specimen-nidrs；Patient(subject)不在原欄位內，須依通報單號由 HIS 帶入或以 identifier 參照 |
| `SAMPLE.Report` | 1..1 | String/13 | 法傳通報單編號。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.supportingInfo[report].identifier.value` | supportingInfo[report] 以 identifier(system = nidrs-report-id)參照 Condition-nidrs-case-ref |
| `SAMPLE.BarCode` | 0..1 | String/20 | 送驗單編號；此欄位可不填，填寫內容為疾管署所發放bar-Code，格式為XX-XXX-XXXXXX共13碼之編號，若未填將於送驗單新增成功時由系統自動編號格式為15碼數字。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.identifier[barcode].value` | system = https://lims.cdc.gov.tw/ |
| `SAMPLE.HOSPITAL_SAMPLING_NO` | 0..1 | String/20 | 院內檢體編號。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.identifier.value` | identifier.system 由送驗單位自訂(如院所網域 URL) |
| `SAMPLE.ISCORPSEDISSECTION` | 0..1 | Code | 屍體解剖；0否(預設值)；1是。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.extension[autopsy].valueBoolean` | 0→false、1→true；未填視為 false |
| `SAMPLE.SAMPLE_TYPE` | 1..1 | Code | 檢體類別；檢體類別與「屍體解剖」及「送驗疾病」有其關聯性，三者必須符合採檢手冊之定義；代碼定義請參考附錄四代碼彙整表中的「送驗疾病與檢體類別之關聯」代碼。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.type.coding.code` | system = CodeSystem cdc-specimen-type；組合檢核見 ConceptMap cdc-test-disease-specimen |
| `SAMPLE.SAMPLE_TYPE_OTHER` | 0..1 | String/120 | 其他檢體備註說明；若「檢體類別」為「其他」，此欄位為必填。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.type.text` | 置於同一 CodeableConcept 之 text |
| `SAMPLE.DISEASE` | 1..1 | String/100 | 送驗疾病代碼；每個疾病之間以逗號區隔；「送驗疾病」不可重複。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.reasonCode.coding.code` | 以逗號拆分，每一送驗疾病建立一個 reasonCode(system = CodeSystem cdc-test-disease)，不可重複 |
| `SAMPLE.DRUG_BEFORE_SAMPLING` | 0..1 | Code | 採檢前投藥情形；0:否 1:是。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.extension[drugBeforeSampling].valueBoolean` | 0→false、1→true |
| `SAMPLE.COMMENTS` | 0..1 | String/100 | 個案備註。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.note.text` | 直接對應 |
| `SAMPLE.REQUESTER` | 1..1 | String/20 | 送驗人員。 | [Practitioner-nidrs](StructureDefinition-Practitioner-nidrs.html)<br>[ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `Practitioner.name.text`<br>`ServiceRequest.requester` | 建立 Practitioner 與 PractitionerRole-nidrs(organization = 送驗單位)，requester 參照該 PractitionerRole |
| `SAMPLE.SAMPLING_HOSPITAL` | 1..1 | String/10 | 送驗單位代碼；醫事機構代碼。 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html)<br>[PractitionerRole-nidrs](StructureDefinition-PractitionerRole-nidrs.html)<br>[MessageHeader-nidrs-sample](StructureDefinition-MessageHeader-nidrs-sample.html) | `Organization.identifier[hospitalCode].value`<br>`PractitionerRole.organization`<br>`MessageHeader.sender` | 建立 Organization-nidrs-hospital |
| `SAMPLE.SAMPLING_HOSPITAL_EMAIL` | 0..1 | String/60 | 送驗單位電子信箱。 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html) | `Organization.telecom.value` | telecom.system = email |
| `SAMPLE.RECEIVED_UNIT_TYPE` | 1..1 | String/3 | 指定收件單位類型；代碼定義：1:疾管署、6:認可實驗室；送件單位類型可選填項目與送驗疾病對應，對應關係可參考附錄四代碼彙整表(疾管署之可送驗疾病代碼；認可實驗室之可送驗疾病代碼、指定檢驗機構之可送驗疾病代碼)。 | [Organization-nidrs-lab](StructureDefinition-Organization-nidrs-lab.html)<br>[ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `Organization.type.coding.code`<br>`ServiceRequest.performer` | system = CodeSystem cdc-received-unit-type；建立 Organization-nidrs-lab，ServiceRequest.performer 參照之 |
| `SAMPLE.RECEIVED_UNIT` | 1..1 | String/10 | 指定收件單位代碼；單位代碼與指定收件單位類型對應，類型須一致；代碼定義請參考附錄四代碼彙整表(指定送驗單位_疾管署單位代碼；指定送驗單位_認可實驗室代碼、指定送驗單位_指定檢驗機構代碼)。 | [Organization-nidrs-lab](StructureDefinition-Organization-nidrs-lab.html) | `Organization.identifier.value` | 類型 1→identifier.system = CodeSystem cdc-lab-unit 之 URL；類型 6→cdc-approved-lab 或醫事機構代碼(invariant nidrs-lab-1) |
| `SAMPLE.SAMPLED_DAY` | 1..1 | String/8 | 檢體採檢日；西元日期YYYYMMDD。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.collection.collectedDateTime` | 日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01) |
| `TB_SAMPLE` | 0..1 | (區塊) | 法傳TB送驗單欄位；原規格未列基數，依 Bundle-nidrs-sample 一則訊息傳送 SAMPLE 或 TB_SAMPLE 其中之一。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html)<br>[Specimen-nidrs-tb](StructureDefinition-Specimen-nidrs-tb.html)<br>[Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `ServiceRequest`<br>`Specimen`<br>`Patient` | 建立 ServiceRequest-nidrs-tb-sample、Specimen-nidrs-tb 與 Patient-nidrs-tb-sample；reasonCode 固定為 CDCTestDisease#010(結核病) |
| `TB_SAMPLE.ReportID` | 0..1 | String/13 | 法傳通報單號；非通報個案可不填。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.supportingInfo[report].identifier.value` | 以 identifier(system = nidrs-report-id)參照；未填則不產生 supportingInfo[report] |
| `TB_SAMPLE.BarCode` | 0..1 | String/20 | 送驗單編號；此欄位可不填，填寫內容為疾管署所發放bar-Code，格式為XX-XXX-XXXXXX共13碼之編號，若未填將於送驗單新增成功時由系統自動編號格式為15碼數字。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.identifier[barcode].value` | system = https://lims.cdc.gov.tw/ |
| `TB_SAMPLE.HOSPITAL_SAMPLING_NO` | 0..1 | String/20 | 院內檢體編號。 | [Specimen-nidrs-tb](StructureDefinition-Specimen-nidrs-tb.html) | `Specimen.identifier.value` | identifier.system 由送驗單位自訂 |
| `TB_SAMPLE.SAMPLE_TYPE` | 1..1 | String/3 | 檢體類別；代碼定義請參考附錄四代碼彙整表中的「結核病檢體類別」代碼。 | [Specimen-nidrs-tb](StructureDefinition-Specimen-nidrs-tb.html) | `Specimen.type.coding.code` | system = CodeSystem cdc-tb-specimen-type |
| `TB_SAMPLE.SAMPLE_TYPE_OTHER_DESC` | 0..1 | String/120 | 其他檢體備註說明。 | [Specimen-nidrs-tb](StructureDefinition-Specimen-nidrs-tb.html) | `Specimen.type.text` | 置於同一 CodeableConcept 之 text |
| `TB_SAMPLE.PHTESTITEM` | 1..* | String/20 | 送驗項目，可多選格式必須為陣列，例如：[1,8]；代碼定義請參考附錄四代碼彙整表中的「結核病送驗項目代碼」。原規格基數記為 1..1、型態 String/20，惟其值為陣列，故本模型以 1..* 表達。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.orderDetail.coding.code` | 陣列之每一項目建立一個 orderDetail(system = CodeSystem cdc-tb-test-item) |
| `TB_SAMPLE.PHTESTITEM_OTHER_DESC` | 0..1 | String/100 | 送驗項目其他說明。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.orderDetail.text` | 置於「其他」項目之 orderDetail.text |
| `TB_SAMPLE.SampleReasonXPERT` | 0..1 | String/20 | 送驗項目：疾管署分子快速檢測；代碼定義：1失落再治、2失敗再治、3結核病復發、4重開非復發曾使用抗結核藥物4週以上、5抗藥性結核病個案接觸者、6高風險鄉鎮新發生個案、7曾長期停留高負擔國家、8RMP抗藥、9治療2個月之痰培養仍為陽性者、10INH抗藥擬申請二線藥者、11因藥物副作用擬申請二線藥者、12通報結核病之畜牧場人員、13M. bovis結核個案或動物之接觸者轉為個案者、14潛伏結核感染治療(LTBI)個案結核病發病者、15其他。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.extension[xpertReason].valueCodeableConcept.coding.code` | system = CodeSystem cdc-xpert-reason |
| `TB_SAMPLE.SampleReasonXPERT_other` | 0..1 | String/50 | 疾管署分子快速檢測其他說明。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.extension[xpertReason].valueCodeableConcept.text` | 置於同一 CodeableConcept 之 text |
| `TB_SAMPLE.TB_MEDICINE_USE_ID` | 0..1 | String/1 | 抗結核菌藥物；代碼定義：N未用藥物；1服用&lt;2週；2服用&gt;2週。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.extension[tbMedicineUse].valueCodeableConcept.coding.code` | system = CodeSystem cdc-tb-medicine-use |
| `TB_SAMPLE.REQUESTER` | 1..1 | String/10 | 送驗人員。 | [Practitioner-nidrs](StructureDefinition-Practitioner-nidrs.html)<br>[ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `Practitioner.name.text`<br>`ServiceRequest.requester` | 建立 Practitioner 與 PractitionerRole-nidrs，requester 參照該 PractitionerRole |
| `TB_SAMPLE.SAMPLING_HOSPITAL` | 1..1 | String/10 | 送驗單位(IDA醫事機構代碼表)。 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html)<br>[PractitionerRole-nidrs](StructureDefinition-PractitionerRole-nidrs.html)<br>[MessageHeader-nidrs-sample](StructureDefinition-MessageHeader-nidrs-sample.html) | `Organization.identifier[hospitalCode].value`<br>`PractitionerRole.organization`<br>`MessageHeader.sender` | 建立 Organization-nidrs-hospital |
| `TB_SAMPLE.RECEIVED_UNIT_TYPE` | 1..1 | String/3 | 指定收件單位類型；代碼定義：1:疾管署、6:認可實驗室；送件單位類型可選填項目與送驗疾病對應，對應關係可參考附錄四代碼彙整表(疾管署之可送驗疾病代碼；認可實驗室之可送驗疾病代碼、指定檢驗機構之可送驗疾病代碼)。 | [Organization-nidrs-lab](StructureDefinition-Organization-nidrs-lab.html)<br>[ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `Organization.type.coding.code`<br>`ServiceRequest.performer` | system = CodeSystem cdc-received-unit-type；建立 Organization-nidrs-lab，ServiceRequest.performer 參照之 |
| `TB_SAMPLE.RECEIVED_UNIT` | 1..1 | String/10 | 指定收件單位代碼；單位代碼與指定收件單位類型對應，類型須一致；代碼定義請參考附錄四代碼彙整表(指定送驗單位_疾管署單位代碼；指定送驗單位_認可實驗室代碼、指定送驗單位_指定檢驗機構代碼)。 | [Organization-nidrs-lab](StructureDefinition-Organization-nidrs-lab.html) | `Organization.identifier.value` | 類型 1→identifier.system = CodeSystem cdc-lab-unit 之 URL；類型 6→cdc-approved-lab 或醫事機構代碼(invariant nidrs-lab-1) |
| `TB_SAMPLE.SAMPLED_DAY` | 1..1 | String/8 | 採檢日；西元日期YYYYMMDD，若送驗疾病為結核病時，此欄位必須在送驗日之前(或同日)。 | [Specimen-nidrs-tb](StructureDefinition-Specimen-nidrs-tb.html) | `Specimen.collection.collectedDateTime` | 日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01) |
| `TB_SAMPLE.PHPROVIDEDATE` | 1..1 | String/8 | 送驗日；西元日期YYYYMMDD，若送驗疾病為結核病時，此欄位必須在採檢日之後(或同日)。 | [ServiceRequest-nidrs-tb-sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | `ServiceRequest.authoredOn` | 日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01) |
| `TB_SAMPLE.IDNO` | 1..1 | String/10 | 身分證字號。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.identifier[idCardNumber/residentNumber/passportNumber/nidrsTempId].value` | 依證號種類擇一 slice(同 Report_Common.IDNO) |
| `TB_SAMPLE.NAME` | 1..1 | String/30 | 姓名。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.name[usual].text` | 直接對應 |
| `TB_SAMPLE.INSURANCENO` | 0..1 | String/20 | 健保卡序號，若無請填寫「無」。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.identifier[nhiCardNumber].value` | 值為「無」時不產生 identifier；system = https://www.nhi.gov.tw |
| `TB_SAMPLE.BIRTHDAY` | 1..1 | String/8 | 出生日期；西元日期YYYYMMDD。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.birthDate` | 日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01) |
| `TB_SAMPLE.SEX` | 1..1 | String/1 | 性別；代碼定義：F女生；M男生。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.gender` | F→female、M→male |
| `TB_SAMPLE.PHCASENO` | 0..1 | String/20 | 病歷號碼。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.identifier[medicalRecord].value` | identifier.type = v2-0203#MR；system 由院所自訂 |
| `TB_SAMPLE.NATIONALITY` | 1..1 | String/3 | 國籍國家代碼；本國請填寫中華民國「158」；代碼定義請參考附錄四代碼彙整表中的「國家代碼」。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.extension[nationality].extension[code].valueCodeableConcept.coding` | system = CodeSystem cdc-country |
| `TB_SAMPLE.NATIONALITY_OTHER` | 0..1 | String/20 | 其他國家。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.extension[nationality].extension[code].valueCodeableConcept.text` | 置於同一 CodeableConcept 之 text |
| `TB_SAMPLE.RESIDENCE_COUNTY` | 1..1 | String/5 | 居住縣市；代碼定義請參考附錄四代碼彙整表中的「縣市代碼」。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.address.extension[adminArea].extension[county].valueCoding` | system = CodeSystem cdc-county |
| `TB_SAMPLE.RESIDENCE_TOWN` | 1..1 | String/8 | 居住市區鄉鎮；代碼定義請參考附錄四代碼彙整表中的「縣市代碼」。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.address.extension[adminArea].extension[town].valueCoding` | system = CodeSystem cdc-town |
| `TB_SAMPLE.ADDRESS` | 1..1 | String/40 | 居住詳細地址。 | [Patient-nidrs-tb-sample](StructureDefinition-Patient-nidrs-tb-sample.html) | `Patient.address.text` | 直接對應 |
{:.grid}

<a name="hismsg04"></a>
#### 回應資料結構(HISMsg04，表15)

邏輯模型：[HISMsg04Model](StructureDefinition-HISMsg04Model.html)。原規格表15 之 ReturnData.SAMPLE 欄位僅列名稱與型態(皆為 String)，說明欄引用 EMRMsg04 同名欄位。

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(HISMsg04 本體)* |  |  | 通報單送驗新增作業回應資料結構(HISMsg04)之資料模型 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `Bundle`<br>`MessageHeader` | MessageHeader.eventCoding = CDCMessageEvent#HISMsg04 |
| `SAMPLE_RESULT` | 1..1 | (區塊) | 通報單送驗新增結果。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | `Bundle` | Bundle-nidrs-response 一則(MessageHeader.eventCoding = HISMsg04) |
| `SAMPLE_RESULT.Success` | 1..1 | bool | 處理狀態；true:成功、false:失敗。 | [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `MessageHeader.response.code` | true→ok；false→fatal-error |
| `SAMPLE_RESULT.Message` | 0..1 | String | 處理訊息(原規格未提供說明)。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.details.text` | 失敗時建立 OperationOutcome-nidrs(issue.severity = error)；成功時可省略或以 severity = information 表達 |
| `SAMPLE_RESULT.Exception` | 0..1 | String | 例外訊息(原規格未提供說明)。 | [OperationOutcome-nidrs](StructureDefinition-OperationOutcome-nidrs.html) | `OperationOutcome.issue.diagnostics` | 直接對應 |
| `SAMPLE_RESULT.ReturnData` | 0..1 | (區塊) | 成功時，送驗清單如下。 | [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)<br>[Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html) | `Bundle.entry[serviceRequest]`<br>`Bundle.entry[specimen]` | 成功時回傳之送驗單 |
| `SAMPLE_RESULT.ReturnData.SAMPLE` | 0..1 | (區塊) | 送驗單。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html)<br>[Specimen-nidrs](StructureDefinition-Specimen-nidrs.html)<br>[MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html) | `ServiceRequest`<br>`Specimen`<br>`MessageHeader.focus` | 回應 Bundle 不另附 Patient、Practitioner、Organization：ServiceRequest/Specimen.subject 以 identifier(個案證號)參照，requester/performer 以 contained 資源表達 |
| `SAMPLE_RESULT.ReturnData.SAMPLE.Report` | 1..1 | String | 法傳通報單編號(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.supportingInfo[report].identifier.value` | 以 identifier(system = nidrs-report-id)參照 |
| `SAMPLE_RESULT.ReturnData.SAMPLE.BarCode` | 1..1 | String | 送驗單編號；送驗時未填者為系統自動編號(15碼數字)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.identifier[barcode].value` | 疾管署 bar-code(13碼)或系統自動編號(15碼數字)；system = https://lims.cdc.gov.tw/ |
| `SAMPLE_RESULT.ReturnData.SAMPLE.HOSPITAL_SAMPLING_NO` | 0..1 | String | 院內檢體編號(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.identifier.value` | 直接對應 |
| `SAMPLE_RESULT.ReturnData.SAMPLE.ISCORPSEDISSECTION` | 0..1 | String | 屍體解剖(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.extension[autopsy].valueBoolean` | 0→false、1→true |
| `SAMPLE_RESULT.ReturnData.SAMPLE.SAMPLE_TYPE` | 1..1 | String | 檢體類別(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.type.coding.code` | system = CodeSystem cdc-specimen-type |
| `SAMPLE_RESULT.ReturnData.SAMPLE.SAMPLE_TYPE_OTHER` | 0..1 | String | 其他檢體備註說明(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.type.text` | 置於同一 CodeableConcept 之 text |
| `SAMPLE_RESULT.ReturnData.SAMPLE.DISEASE` | 1..1 | String | 送驗疾病代碼(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.reasonCode.coding.code` | 以逗號拆分，每一疾病一個 reasonCode(system = CodeSystem cdc-test-disease) |
| `SAMPLE_RESULT.ReturnData.SAMPLE.DISEASE_OTHER` | 0..1 | String | 其他送驗疾病說明(原規格未提供說明，EMRMsg04 無此欄位)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.reasonCode.text` | 原規格未說明；推定為送驗疾病「其他(0000)」之說明，置於該 reasonCode.text |
| `SAMPLE_RESULT.ReturnData.SAMPLE.DRUG_BEFORE_SAMPLING` | 0..1 | String | 採檢前投藥情形(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.extension[drugBeforeSampling].valueBoolean` | 0→false、1→true |
| `SAMPLE_RESULT.ReturnData.SAMPLE.COMMENTS` | 0..1 | String | 個案備註(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.note.text` | 直接對應 |
| `SAMPLE_RESULT.ReturnData.SAMPLE.REQUESTER` | 1..1 | String | 送驗人員(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html)<br>[PractitionerRole-nidrs](StructureDefinition-PractitionerRole-nidrs.html) | `ServiceRequest.requester`<br>`PractitionerRole.practitioner.display` | 回應 Bundle 不附 Practitioner/PractitionerRole，requester 指向 contained PractitionerRole-nidrs，送驗人員姓名填 practitioner.display |
| `SAMPLE_RESULT.ReturnData.SAMPLE.SAMPLING_HOSPITAL` | 1..1 | String | 送驗單位代碼(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [PractitionerRole-nidrs](StructureDefinition-PractitionerRole-nidrs.html) | `PractitionerRole.organization.identifier.value` | 同一 contained PractitionerRole 之 organization 以醫事機構代碼(identifier)參照 |
| `SAMPLE_RESULT.ReturnData.SAMPLE.SAMPLING_HOSPITAL_EMAIL` | 1..1 | String | 送驗單位電子信箱(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [Organization-nidrs-hospital](StructureDefinition-Organization-nidrs-hospital.html) | `Organization.telecom.value` | telecom.system = email；回應中可省略(資訊已於送驗時提供) |
| `SAMPLE_RESULT.ReturnData.SAMPLE.RECEIVED_UNIT_TYPE` | 1..1 | String | 指定收件單位類型(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html)<br>[Organization-nidrs-lab](StructureDefinition-Organization-nidrs-lab.html) | `ServiceRequest.performer`<br>`Organization.type.coding.code` | performer 指向 contained Organization-nidrs-lab；system = CodeSystem cdc-received-unit-type |
| `SAMPLE_RESULT.ReturnData.SAMPLE.RECEIVED_UNIT` | 1..1 | String | 指定收件單位代碼(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [Organization-nidrs-lab](StructureDefinition-Organization-nidrs-lab.html) | `Organization.identifier.value` | 置於同一 contained Organization-nidrs-lab |
| `SAMPLE_RESULT.ReturnData.SAMPLE.SAMPLED_DAY` | 1..1 | String | 檢體採檢日(原規格未提供說明，依 EMRMsg04 同名欄位)。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.collection.collectedDateTime` | 依實際回傳格式(yyyyMMdd 或 yyyy/MM/dd)轉為 yyyy-MM-dd |
| `SAMPLE_RESULT.ReturnData.SAMPLE.CREATE_DAY` | 1..1 | String | 送驗單建立日(原規格未提供說明)。 | [ServiceRequest-nidrs-sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | `ServiceRequest.authoredOn` | 依實際回傳格式轉為 FHIR dateTime(含時間時補 +08:00) |
| `SAMPLE_RESULT.ReturnData.SAMPLE.SAMPLED_TIMES` | 1..1 | String | 採檢次數(原規格未提供說明，EMRMsg04 無此欄位)。 | [Specimen-nidrs](StructureDefinition-Specimen-nidrs.html) | `Specimen.note.text` | 原規格未說明(推定為採檢次數/次別)；本 IG Profile 未定義專屬元素，暫以 Specimen.note.text 記錄 |
{:.grid}

### 疾管署主動回饋

疾管署主動回饋原以醫院端開發之 Web Service 接收(參數 `string jsonString`，回傳 Boolean：True 成功、False 失敗)。本 IG 將其表達為 FHIR 訊息 Bundle；接收端處理結果可以 HTTP 狀態碼或回應訊息回覆。

<a name="determine-result"></a>
#### 研判結果主動通知(PushDetermineResult / ReportDetermineResult，表6)

邏輯模型：[ReportDetermineResultModel](StructureDefinition-ReportDetermineResultModel.html)

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(PushDetermineResult 本體)* |  |  | 研判結果主動通知(ReportDetermineResult)之資料模型 | [Bundle-nidrs-push-determine-result](StructureDefinition-Bundle-nidrs-push-determine-result.html)<br>[MessageHeader-nidrs-push-determine-result](StructureDefinition-MessageHeader-nidrs-push-determine-result.html)<br>[Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Bundle`<br>`MessageHeader`<br>`Condition` | 原為 Web Service PushDetermineResult(string jsonString)，回傳 Boolean(True 成功/False 失敗)；FHIR 以訊息 Bundle 傳送，MessageHeader.eventCoding = CDCMessageEvent#PushDetermineResult |
| `ReportId` | 1..1 | string | 通報單編號。 | [Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Condition.identifier[reportId].value` | system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id |
| `DiseaseId` | 0..1 | string | 通報疾病代碼。 | [Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Condition.code.coding.code` | system = CodeSystem cdc-disease |
| `DetermineStatus` | 0..1 | string | 研判結果代碼。 | [Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html)<br>[Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Condition.extension[determineResult].extension[status].valueCodeableConcept.coding.code`<br>`Condition.verificationStatus` | system = CodeSystem cdc-determine-status；verificationStatus 依 ConceptMap cdc-determine-status-to-condition-ver-status 對應 |
| `DetermineDate` | 0..1 | string | 研判時間(原規格未定義格式)。 | [Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Condition.extension[determineResult].extension[date].valueDateTime` | 轉為 FHIR dateTime(yyyy-MM-dd 或 yyyy-MM-ddTHH:mm:ss+08:00) |
| `IDNO` | 0..1 | string | 身分證號。 | [Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Condition.subject.identifier.value` | subject 以 identifier 參照；system 依證號種類 |
| `PHB_RECEIVED_DAY` | 0..1 | string | 衛生局收到日(原規格未定義格式)。 | [Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Condition.extension[phbReceivedDate].valueDate` | 轉為 FHIR date(yyyy-MM-dd) |
| `CDC_RECEIVED_DATE` | 0..1 | string | 建檔日(原規格未定義格式)。 | [Condition-nidrs-determine-result](StructureDefinition-Condition-nidrs-determine-result.html) | `Condition.extension[cdcReceivedDate].valueDate` | 轉為 FHIR date(yyyy-MM-dd) |
{:.grid}

<a name="sample-result"></a>
#### 檢驗結果主動通知(PushSampleResult / SampleResult，表7)

邏輯模型：[SampleResultModel](StructureDefinition-SampleResultModel.html)。`SampleAntibodyResults` 之每一筆對應 [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html)，`SamplePathogenResults` 之每一筆對應 [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html)，皆由 DiagnosticReport.result 參照。

| 原欄位 | 基數 | 型態 | 說明 | FHIR Profile | FHIR 元素 | 轉換說明 |
| --- | --- | --- | --- | --- | --- | --- |
| *(PushSampleResult 本體)* |  |  | 檢驗結果主動通知(SampleResult)之資料模型 | [Bundle-nidrs-push-sample-result](StructureDefinition-Bundle-nidrs-push-sample-result.html)<br>[MessageHeader-nidrs-push-sample-result](StructureDefinition-MessageHeader-nidrs-push-sample-result.html)<br>[DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `Bundle`<br>`MessageHeader`<br>`DiagnosticReport` | 原為 Web Service PushSampleResult(string jsonString)，回傳 Boolean；FHIR 以訊息 Bundle 傳送，MessageHeader.eventCoding = CDCMessageEvent#PushSampleResult；SampleResult 不含個案證號，DiagnosticReport.subject(必填)由疾管署依通報單號帶入個案證號並以 identifier 參照 |
| `ReportId` | 1..1 | string | 通報單編號。 | [DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `DiagnosticReport.extension[report].valueReference.identifier.value` | workflow-reasonReference 擴充以 identifier(system = nidrs-report-id)參照通報單 |
| `SampleId` | 1..1 | string | 送驗單編號。 | [DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html)<br>[DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `DiagnosticReport.identifier[barcode].value`<br>`DiagnosticReport.basedOn.identifier.value` | system = https://lims.cdc.gov.tw/；basedOn 以同一送驗單編號參照 ServiceRequest |
| `DiseaseId` | 0..1 | string | 送驗疾病代碼。 | [DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `DiagnosticReport.code.coding[testDisease].code` | system = CodeSystem cdc-test-disease |
| `DiseaseName` | 0..1 | string | 送驗疾病中文名稱。 | [DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `DiagnosticReport.code.coding[testDisease].display` | 亦可填入 code.text |
| `ResultInformDay` | 1..1 | DateTime | 檢驗結果時間。 | [DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `DiagnosticReport.issued` | C# DateTime 序列化值(如 2025-01-02T10:20:30，無時區)轉為 FHIR 時補上 +08:00(instant 須含秒與時區) |
| `ResultId` | 0..1 | string | 檢驗結果代碼。 | [DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `DiagnosticReport.conclusionCode.coding.code` | system = TWIDIR CodeSystem twcdc-testresult-values |
| `ResultName` | 0..1 | string | 檢驗結果名稱。 | [DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `DiagnosticReport.conclusionCode.coding.display` | 亦可填入 conclusionCode.text |
| `SampleAntibodyResults` | 0..* | (區塊) | 血清學檢驗結果清單(List&lt;SampleAntibodyResult&gt;)。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html)<br>[DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `Observation`<br>`DiagnosticReport.result` | 每一筆建立一筆 Observation-nidrs-antibody-result，subject 與 DiagnosticReport 相同 |
| `SampleAntibodyResults.SeqNo` | 1..1 | int | 血清學檢驗序號。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.identifier.value` | 整數轉為字串；建議與送驗單編號組合以確保唯一 |
| `SampleAntibodyResults.AntibodyId` | 0..1 | string | 血清學檢驗方法代碼。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.code.coding.code` | system = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-antibody-method(content = not-present) |
| `SampleAntibodyResults.AntibodyName` | 0..1 | string | 血清學檢驗方法名稱。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.code.coding.display` | 亦可填入 code.text |
| `SampleAntibodyResults.AntibodyResultId` | 0..1 | string | 血清學檢驗結果代碼。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.interpretation.coding.code` | system = TWIDIR CodeSystem twcdc-testresult-values |
| `SampleAntibodyResults.AntibodyResultName` | 0..1 | string | 血清學檢驗結果名稱。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.interpretation.coding.display` | 直接對應 |
| `SampleAntibodyResults.Titer` | 0..1 | string | 效價(Titer)。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.component[titer].valueString` | component.code = CDCNIDRSObservation#TITER |
| `SampleAntibodyResults.FourFoldRise` | 1..1 | bool | 是否四倍上升。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.component[fourFoldRise].valueBoolean` | component.code = CDCNIDRSObservation#FOUR_FOLD_RISE |
| `SampleAntibodyResults.Comments` | 0..1 | string | 血清學檢驗結果備註。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.note.text` | 直接對應 |
| `SampleAntibodyResults.ResultDay` | 1..1 | DateTime | 血清學檢驗日期。 | [Observation-nidrs-antibody-result](StructureDefinition-Observation-nidrs-antibody-result.html) | `Observation.effectiveDateTime` | C# DateTime 序列化值(如 2025-01-02T10:20:30，無時區)轉為 FHIR 時補上 +08:00 |
| `SamplePathogenResults` | 0..* | (區塊) | 病原體檢驗結果清單(List&lt;SamplePathogenResult&gt;)。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html)<br>[DiagnosticReport-nidrs-sample-result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | `Observation`<br>`DiagnosticReport.result` | 每一筆建立一筆 Observation-nidrs-pathogen-result，subject 與 DiagnosticReport 相同 |
| `SamplePathogenResults.SeqNo` | 1..1 | int | 病原體檢驗序號。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.identifier.value` | 整數轉為字串；建議與送驗單編號組合以確保唯一 |
| `SamplePathogenResults.PathogenId` | 0..1 | string | 病原體檢驗方法代碼。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.code.coding.code` | system = CodeSystem cdc-pathogen-method |
| `SamplePathogenResults.PathogenName` | 0..1 | string | 病原體檢驗方法名稱。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.code.coding.display` | 亦可填入 code.text |
| `SamplePathogenResults.PathogenResultId` | 0..1 | string | 病原體檢驗結果代碼。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.interpretation.coding.code` | system = TWIDIR CodeSystem twcdc-testresult-values |
| `SamplePathogenResults.PathogenResultName` | 0..1 | string | 病原體檢驗結果名稱。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.interpretation.coding.display` | 直接對應 |
| `SamplePathogenResults.MasterId` | 0..1 | string | 病原體大類代碼。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.valueCodeableConcept.coding.code` | system = CodeSystem cdc-pathogen；僅有大類(無 DetailId)時填大類代碼，有細類時大類為細類之 parent，可省略 |
| `SamplePathogenResults.MasterName` | 0..1 | string | 病原體大類名稱。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.valueCodeableConcept.coding.display` | 與 MasterId 同一 coding |
| `SamplePathogenResults.DetailId` | 0..1 | string | 病原體細類代碼。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.valueCodeableConcept.coding.code` | system = CodeSystem cdc-pathogen；優先使用細類代碼 |
| `SamplePathogenResults.DetailName` | 0..1 | string | 病原體細類名稱。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.valueCodeableConcept.coding.display` | 與 DetailId 同一 coding |
| `SamplePathogenResults.SubTypeId` | 0..1 | string | 病原體次分型代碼。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.component[subtype].valueCodeableConcept.coding.code` | component.code = CDCNIDRSObservation#PATHOGEN_SUBTYPE；附錄四未提供次分型代碼系統，coding.system 由疾管署定義 |
| `SamplePathogenResults.SubTypeName` | 0..1 | string | 病原體次分型名稱。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.component[subtype].valueCodeableConcept.text` | 同時可填入 coding.display |
| `SamplePathogenResults.Comments` | 0..1 | string | 病原體檢驗結果備註。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.note.text` | 直接對應 |
| `SamplePathogenResults.ResultDay` | 1..1 | DateTime | 病原體檢驗日期。 | [Observation-nidrs-pathogen-result](StructureDefinition-Observation-nidrs-pathogen-result.html) | `Observation.effectiveDateTime` | C# DateTime 序列化值(如 2025-01-02T10:20:30，無時區)轉為 FHIR 時補上 +08:00 |
{:.grid}

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
