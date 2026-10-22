以下為本IG定義之所有 Profile 與擴充(Extension)，依用途分組。「對應原規格」欄列出工作說明書 V1.42 之訊息代碼、資料結構表或 JSON 欄位；逐欄對應請參考[欄位對應(JSON→FHIR)](mapping.html)，原規格結構之邏輯模型請參考[邏輯模型](models.html)。

除另有註明外，Profile 皆繼承[臺灣核心實作指引(TW Core IG) 1.0.0](https://twcore.mohw.gov.tw/ig/twcore/1.0.0/)之相對應 Profile。

### 訊息 Bundle

| Profile | 用途 | 對應原規格 |
|---|---|---|
| [通報單新增-Bundle NIDRS Report Create](StructureDefinition-Bundle-nidrs-report-create.html) | 通報單位傳送通報單新增訊息；一次最多 10 份通報單，同一個案一次最多通報 10 個法定傳染病 | EMRMsg01(表8) |
| [通報單修改-Bundle NIDRS Report Update](StructureDefinition-Bundle-nidrs-report-update.html) | 通報單位傳送通報單修改訊息；一次修改一筆通報單 | EMRMsg02(表10) |
| [通報單病歷資料傳送-Bundle NIDRS Document](StructureDefinition-Bundle-nidrs-document.html) | 通報單位傳送個案病歷檔案 | EMRMsg03(表12) |
| [通報單送驗新增-Bundle NIDRS Sample](StructureDefinition-Bundle-nidrs-sample.html) | 通報單位傳送法傳送驗單或法傳TB送驗單 | EMRMsg04(表14) |
| [疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html) | 疾管署回覆處理結果(成功之通報單清單/送驗清單，或錯誤清單) | HISMsg01~HISMsg04(表9、11、13、15) |
| [研判結果主動通知-Bundle NIDRS Push Determine Result](StructureDefinition-Bundle-nidrs-push-determine-result.html) | 疾管署主動通知通報單位個案研判結果 | PushDetermineResult / ReportDetermineResult(表6) |
| [檢驗結果主動通知-Bundle NIDRS Push Sample Result](StructureDefinition-Bundle-nidrs-push-sample-result.html) | 疾管署主動通知通報單位送驗單綜合檢驗結果 | PushSampleResult / SampleResult(表7) |
{:.grid}

### 訊息表頭(MessageHeader)

| Profile | 用途 | 對應原規格 |
|---|---|---|
| [通報單新增訊息-MessageHeader NIDRS Report Create](StructureDefinition-MessageHeader-nidrs-report-create.html) | eventCoding 固定為 `EMRMsg01`；focus 為 1~10 份通報單 | EMRMsg01、REPORTS |
| [通報單修改訊息-MessageHeader NIDRS Report Update](StructureDefinition-MessageHeader-nidrs-report-update.html) | eventCoding 固定為 `EMRMsg02`；focus 為 1 份修改通報單 | EMRMsg02 |
| [通報單病歷資料傳送訊息-MessageHeader NIDRS Document](StructureDefinition-MessageHeader-nidrs-document.html) | eventCoding 固定為 `EMRMsg03`；focus 為病歷檔案 | EMRMsg03 |
| [通報單送驗新增訊息-MessageHeader NIDRS Sample](StructureDefinition-MessageHeader-nidrs-sample.html) | eventCoding 固定為 `EMRMsg04`；focus 為送驗單 | EMRMsg04 |
| [疾管署回覆訊息-MessageHeader NIDRS Response](StructureDefinition-MessageHeader-nidrs-response.html) | eventCoding 為 `HISMsg01`~`HISMsg04`；response.code 表達處理狀態，失敗時以 response.details 參照錯誤清單 | STATUS / Success、ERROR_LIST |
| [研判結果主動通知訊息-MessageHeader NIDRS Push Determine Result](StructureDefinition-MessageHeader-nidrs-push-determine-result.html) | eventCoding 固定為 `PushDetermineResult`；focus 為研判結果 | PushDetermineResult |
| [檢驗結果主動通知訊息-MessageHeader NIDRS Push Sample Result](StructureDefinition-MessageHeader-nidrs-push-sample-result.html) | eventCoding 固定為 `PushSampleResult`；focus 為綜合檢驗結果 | PushSampleResult |
{:.grid}

### 通報單內容

| Profile | 用途 | 對應原規格 |
|---|---|---|
| [傳染病個案通報單-Composition NIDRS Report](StructureDefinition-Composition-nidrs-report.html) | 一份傳染病個案通報單；section 包含通報疾病、病患動向、流行病學資料、疾病增補欄位、死亡資料、個案生母資料 | REPORTS.REPORT(表8)、Report_Common 通報單位資料、REPORTED_DAY、PHB_RECEIVED_DAY、NOTE |
| [傳染病個案通報單修改-Composition NIDRS Report Update](StructureDefinition-Composition-nidrs-report-update.html) | 修改通報單；修改原因必填、備註不可填寫 | EMRMsg02 REPORT(表10)、MODIFIED_REASON |
| [傳染病個案通報單(登革熱大量通報)-Composition NIDRS Report Dengue Bulk](StructureDefinition-Composition-nidrs-report-dengue-bulk.html) | 附錄五登革熱大量通報之通報單(職業、有無症狀等改為非必填) | 附錄五 表3 |
| [通報疾病-Condition NIDRS](StructureDefinition-Condition-nidrs.html) | 每一通報疾病一筆；含通報單號、發病日期、診斷日期、診斷醫師、有無症狀、主要症狀 | DISEASE_ID、DISEASE_SYMPTOM(_OTHER)、SICK_DAY、NO_SICK_DAY、DIAGNOSE_DAY、HAS_SYMPTOM、DIAGNOSTICIAN |
| [通報疾病(修改)-Condition NIDRS Update](StructureDefinition-Condition-nidrs-update.html) | 修改通報單時之通報疾病，必須帶入通報單號 | EMRMsg02 DISEASE、REPORT |
| [通報疾病(登革熱大量通報)-Condition NIDRS Dengue Bulk](StructureDefinition-Condition-nidrs-dengue-bulk.html) | 登革熱大量通報之通報疾病(有無症狀非必填) | 附錄五 |
| [病患動向-Encounter NIDRS](StructureDefinition-Encounter-nidrs.html) | 通報時病患動向(門診、急診待床、住院、加護病房、隔離病房、出院、轉院、無就醫)及相關日期 | HOSPITALIZED_*、HOSPITALIZED_DAY、STAY_IN_ICU/LEAVE_ICU、STAY_IN_IW/LEAVE_IW、DISCHARGE、TRANSFER_HOSPITAL、TRANSFER_DAY |
| [職業-Observation NIDRS Occupation](StructureDefinition-Observation-nidrs-occupation.html) | 個案職業 | OCCUPATION、OCCUPATION_OTHER |
| [流行病學是非題-Observation NIDRS Epi Flag](StructureDefinition-Observation-nidrs-epi-flag.html) | 旅遊史、動物接觸史之有無及各項暴露史 | HAS_TRAVEL_HISTORY、HAS_ANIMAL_HISTORY、EXPLORE_* |
| [旅遊史-Observation NIDRS Travel](StructureDefinition-Observation-nidrs-travel.html) | 旅遊史明細(國內旅遊、國外旅遊史、國外居住史) | Report_Travel(表18) |
| [接觸動物史-Observation NIDRS Animal](StructureDefinition-Observation-nidrs-animal.html) | 接觸動物種類 | Report_Animal(表19) |
| [人口密集機構-Observation NIDRS Dense Institution](StructureDefinition-Observation-nidrs-dense-institution.html) | 是否為人口密集機構及機構類別 | HAS_ORG、ORG_ID |
| [死亡原因-Observation NIDRS Cause of Death](StructureDefinition-Observation-nidrs-cause-of-death.html) | 死亡原因甲、乙、丙、丁及其他 | DEATH_REASON_A~D、DEATH_REASON_OTHER |
| [增補欄位填答-QuestionnaireResponse NIDRS](StructureDefinition-QuestionnaireResponse-nidrs.html) | 疾病增補欄位填答，questionnaire 指向該疾病之[增補欄位 Questionnaire](supplement-fields.html)(繼承 FHIR R4 QuestionnaireResponse) | DISEASE_FIELD(KEY、VALUE)、附錄二 |
{:.grid}

### 病歷資料

| Profile | 用途 | 對應原規格 |
|---|---|---|
| [通報單病歷資料-DocumentReference NIDRS](StructureDefinition-DocumentReference-nidrs.html) | 病歷檔案(出院病摘、門診病歷、檢驗報告、醫療影像及報告、其他)，以 base64 傳送 docx/pdf/odt | EMRMsg03：REPORT_ID、HOSPITAL、FILE_NAME、FILE_CATEGORY、FILE_TYPE、ANAMNESIS |
{:.grid}

### 送驗

| Profile | 用途 | 對應原規格 |
|---|---|---|
| [法傳送驗單-ServiceRequest NIDRS Sample](StructureDefinition-ServiceRequest-nidrs-sample.html) | 法定傳染病送驗單 | EMRMsg04 SAMPLE |
| [法傳TB送驗單-ServiceRequest NIDRS TB Sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) | 結核病送驗單(送驗項目、分子快速檢測送驗原因、抗結核菌藥物) | EMRMsg04 TB_SAMPLE |
| [送驗檢體-Specimen NIDRS](StructureDefinition-Specimen-nidrs.html) | 法傳送驗單之檢體(檢體類別、屍體解剖、採檢日、院內檢體編號) | SAMPLE_TYPE、ISCORPSEDISSECTION、SAMPLED_DAY、HOSPITAL_SAMPLING_NO |
| [TB送驗檢體-Specimen NIDRS TB](StructureDefinition-Specimen-nidrs-tb.html) | 法傳TB送驗單之檢體(結核病檢體類別) | TB_SAMPLE SAMPLE_TYPE、SAMPLED_DAY |
| [TB送驗個案-Patient NIDRS TB Sample](StructureDefinition-Patient-nidrs-tb-sample.html) | 法傳TB送驗單內含之個案資料 | TB_SAMPLE IDNO、NAME、INSURANCENO、BIRTHDAY、SEX、PHCASENO、NATIONALITY、RESIDENCE_*、ADDRESS |
| [指定收件單位-Organization NIDRS Lab](StructureDefinition-Organization-nidrs-lab.html) | 送驗單之指定收件單位(疾管署或認可實驗室) | RECEIVED_UNIT_TYPE、RECEIVED_UNIT |
{:.grid}

### 結果回饋

| Profile | 用途 | 對應原規格 |
|---|---|---|
| [通報單參照-Condition NIDRS Case Reference](StructureDefinition-Condition-nidrs-case-ref.html) | 以最少欄位表達一筆已成立之通報單(通報單號、通報疾病、個案證號)；用於回覆之通報單清單及各訊息間之參照 | REPORT_LIST(REPORT_ID、DISEASE_ID、IDNO) |
| [研判結果-Condition NIDRS Determine Result](StructureDefinition-Condition-nidrs-determine-result.html) | 疾管署主動回饋之研判結果 | ReportDetermineResult |
| [送驗單綜合檢驗結果-DiagnosticReport NIDRS Sample Result](StructureDefinition-DiagnosticReport-nidrs-sample-result.html) | 疾管署主動回饋之送驗單綜合檢驗結果 | SampleResult |
| [血清學檢驗結果-Observation NIDRS Antibody Result](StructureDefinition-Observation-nidrs-antibody-result.html) | 血清學檢驗結果(檢驗方法、結果、效價、是否四倍上升) | SampleAntibodyResult |
| [病原體檢驗結果-Observation NIDRS Pathogen Result](StructureDefinition-Observation-nidrs-pathogen-result.html) | 病原體檢驗結果(檢驗方法、病原體大類/細類、次分型) | SamplePathogenResult |
| [處理結果-OperationOutcome NIDRS](StructureDefinition-OperationOutcome-nidrs.html) | 疾管署回覆之錯誤清單(繼承 FHIR R4 OperationOutcome) | ERROR_LIST(ERROR_Code、ERROR_MESSAGE)、HISMsg04 Message/Exception |
{:.grid}

### 參與者

| Profile | 用途 | 對應原規格 |
|---|---|---|
| [通報個案-Patient NIDRS](StructureDefinition-Patient-nidrs.html) | 通報個案資料與聯絡資料 | Report_Common 個案資料(IDNO、NAME、NAME_PINYIN、GENDER、BIRTHDAY、CITIZEN、NATIONALITY、RESIDENCE_*、ADDRESS、MARRIAGE、DEATH、DEATH_DAY)、Report_ContactInfo(表17) |
| [通報個案(登革熱大量通報)-Patient NIDRS Dengue Bulk](StructureDefinition-Patient-nidrs-dengue-bulk.html) | 登革熱大量通報之個案(連絡電話、是否死亡改為非必填) | 附錄五 |
| [個案生母-RelatedPerson NIDRS Mother](StructureDefinition-RelatedPerson-nidrs-mother.html) | 個案生母資料 | BIRTH_MOTHER_NAME、BIRTH_MOTHER_IDNO |
| [醫事機構-Organization NIDRS Hospital](StructureDefinition-Organization-nidrs-hospital.html) | 通報單位、送驗單位、轉至院所等醫事機構(醫事機構代碼) | HOSPITAL、HOSPITAL_NAME、HOSPITAL_ADDRESS、SAMPLING_HOSPITAL(_EMAIL)、TRANSFER_HOSPITAL |
| [醫事人員-Practitioner NIDRS](StructureDefinition-Practitioner-nidrs.html) | 通報單登錄者、診斷醫師、送驗人員 | REPORTER_NAME、DIAGNOSTICIAN、REQUESTER |
| [通報者/送驗人員角色-PractitionerRole NIDRS](StructureDefinition-PractitionerRole-nidrs.html) | 通報單登錄者與通報單位、通報者聯絡電話；或送驗人員與送驗單位 | REPORTER_NAME + HOSPITAL + HOSPITAL_CONTACT；REQUESTER + SAMPLING_HOSPITAL |
| [通報者角色-PractitionerRole NIDRS Reporter](StructureDefinition-PractitionerRole-nidrs-reporter.html) | 通報單登錄者角色，通報者聯絡電話(HOSPITAL_CONTACT)必填；用於 Composition.author | REPORTER_NAME、HOSPITAL、HOSPITAL_CONTACT |
{:.grid}

### 擴充(Extensions)

| Extension | 使用於 | 對應原規格 |
|---|---|---|
| [國籍別(CITIZEN)](StructureDefinition-nidrs-citizen.html) | Patient | CITIZEN(0-本國籍、1-非本國籍) |
| [非本國籍居民身分(RESIDENCE_TYPE)](StructureDefinition-nidrs-residence-type.html) | Patient | RESIDENCE_TYPE、RESIDENCE_TYPE_OTHER |
| [居住縣市/鄉鎮市區/村里代碼](StructureDefinition-nidrs-admin-area.html) | Address | RESIDENCE_COUNTY、RESIDENCE_TOWN、RESIDENCE_VILLAGE |
| [衛生局收到日(PHB_RECEIVED_DAY)](StructureDefinition-nidrs-phb-received-date.html) | Composition、Condition | PHB_RECEIVED_DAY |
| [建檔日(CDC_RECEIVED_DATE)](StructureDefinition-nidrs-cdc-received-date.html) | Condition | ReportDetermineResult.CDC_RECEIVED_DATE |
| [通報單備註(NOTE)](StructureDefinition-nidrs-report-note.html) | Composition | NOTE |
| [修改原因(MODIFIED_REASON)](StructureDefinition-nidrs-modified-reason.html) | Composition | MODIFIED_REASON |
| [有無症狀(HAS_SYMPTOM)](StructureDefinition-nidrs-has-symptom.html) | Condition | HAS_SYMPTOM |
| [無發病日(NO_SICK_DAY)](StructureDefinition-nidrs-no-onset-date.html) | Condition | NO_SICK_DAY |
| [研判結果(DetermineStatus)](StructureDefinition-nidrs-determine-result.html) | Condition | DetermineStatus、DetermineDate |
| [病患動向](StructureDefinition-nidrs-patient-movement.html) | Encounter | HOSPITALIZED_OUTPATIENT ~ HOSPITALIZED_NONE |
| [屍體解剖(ISCORPSEDISSECTION)](StructureDefinition-nidrs-autopsy.html) | Specimen | ISCORPSEDISSECTION |
| [採檢前投藥情形(DRUG_BEFORE_SAMPLING)](StructureDefinition-nidrs-drug-before-sampling.html) | ServiceRequest | DRUG_BEFORE_SAMPLING |
| [抗結核菌藥物(TB_MEDICINE_USE_ID)](StructureDefinition-nidrs-tb-medicine-use.html) | ServiceRequest | TB_MEDICINE_USE_ID |
| [疾管署分子快速檢測送驗原因(SampleReasonXPERT)](StructureDefinition-nidrs-xpert-reason.html) | ServiceRequest | SampleReasonXPERT、SampleReasonXPERT_other |
{:.grid}

另使用 FHIR 核心擴充：`patient-nationality`(國家 NATIONALITY，TW Core Patient 已定義)、`iso21090-EN-representation`(姓名羅馬拼音)及 `workflow-reasonReference`(DiagnosticReport 參照通報單)。

### Profile 設計原則

- **Profile 命名**：沿用疾管署 FHIR IG 慣例，Id 為 `<Resource>-nidrs-<用途>`，標題為「中文名稱-英文 Resource 名稱」，說明文字為「此…Profile說明本IG如何進一步定義臺灣核心-…(TW Core …) Profile以呈現…」。
- **必要支援(Must Support)**：標示為 MS 之資料項目，傳送端若有資料**必須(SHALL)**填寫，接收端**必須(SHALL)**能處理。
- **條件式規則**：可於單一 Resource 內判斷之條件式必填規則以 invariant(`nidrs-*`)定義，其餘跨 Resource 或需查詢疾管署資料之規則為疾管署端之商業規則，詳見[檢核規則](validation.html)。
- **代碼綁定**：附錄四代碼以 `required` 綁定；附錄四註明可能異動或需填寫「其他」說明者，以 `extensible` 綁定或以 CodeableConcept.text 填寫說明，詳見[專門術語](terminologies.html)。
