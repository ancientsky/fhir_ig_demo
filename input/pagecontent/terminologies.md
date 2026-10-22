這頁列出本IG必須及可能需要使用的所有專門術語(terminology)，包括代碼系統(Code Systems)、值集(Value Sets)及概念對應(Concept Maps)，並說明其來源。

### 產生方式

工作說明書附錄四「代碼彙整表」以兩個 Excel 檔提供：「附錄四_通報代碼彙整表_v1.42.xlsx」與「附錄四_送驗代碼彙整表_v1.42.xlsx」。本IG以程式 `scripts/gen_terminology.py` 讀取上述 xlsx 之各工作表，自動產生 FSH 檔(`input/fsh/generated/CodeSystem-*.fsh` 及 `ConceptMaps.fsh`)，再由 SUSHI 編譯為 FHIR 構件。轉換原則如下：

- 每一工作表(或工作表中可區分之代碼表)產生一個 CodeSystem，並產生一個同 Id、包含該代碼系統所有代碼之 ValueSet(標題為代碼系統標題加「值集」)。
- 代碼系統之 `version` 為本IG版本，`date` 為附錄四版本日期(2026-09-29)，說明文字註明來源工作表與「資料所屬單位：臺灣衛生福利部疾病管制署」。
- 備註欄註明「停用」、「刪除」或「移除」之代碼仍保留，並以 `inactive = true` 屬性標示；備註文字以 `comment` 屬性保留。
- 工作表中之附加欄位(例如疾病分類、傳染途徑、ISO 3166 代碼、所屬縣市)以代碼屬性(property)保留；病原體類別大項為細項之上層代碼(`parent`)。
- 同一代碼用於多個檢驗項目之工作表(結核病檢驗結果、痰檢驗結果)，以「檢驗項目\|代碼」為唯一代碼，並以 `item` 屬性記錄檢驗項目。
- 表達代碼間關聯之工作表(疾病與主要症狀關聯、送驗疾病與檢體類別之關聯)以及國家代碼與 ISO 3166 之對應，產生 ConceptMap。

附錄四改版時，以新版 xlsx 重新執行程式即可更新術語(請勿手動修改產生之 FSH 檔)；附錄二之增補欄位 Questionnaire 則由 `scripts/gen_questionnaires.py` 產生，詳見[疾病增補欄位(附錄二)](supplement-fields.html)及[下載](downloads.html)。

### 代碼系統：附錄四「通報代碼彙整表」

| 代碼系統(值集同 Id) | 來源工作表 | 代碼數 | 用途 |
|---|---|---|---|
| [CDC-NIDRS-疾病代碼](CodeSystem-cdc-disease.html) | 疾病代碼 | 93 | Condition.code(DISEASE_ID) |
| [CDC-NIDRS-研判結果代碼](CodeSystem-cdc-determine-status.html) | 研判結果代碼 | 33 | 研判結果擴充(DetermineStatus) |
| [CDC-NIDRS-研判結果「不符合疾病分類」細項代碼](CodeSystem-cdc-determine-nonconform-reason.html) | 研判結果代碼(「不符合疾病分類」區段) | 10 | 研判結果擴充(研判結果 31 之細項) |
| [CDC-NIDRS-症狀代碼](CodeSystem-cdc-symptom.html) | 症狀代碼 | 521 | Condition.evidence.code(DISEASE_SYMPTOM) |
| [CDC-NIDRS-職業代碼](CodeSystem-cdc-occupation.html) | 職業代碼 | 66 | 職業 Observation(OCCUPATION) |
| [CDC-NIDRS-人口密集機構類別代碼](CodeSystem-cdc-dense-institution.html) | 人口密集機構類別代碼 | 10 | 人口密集機構 Observation(ORG_ID) |
| [CDC-NIDRS-非本國籍居民身分(居留)代碼](CodeSystem-cdc-residence-type.html) | 居留代碼 | 7 | 非本國籍居民身分擴充(RESIDENCE_TYPE) |
| [CDC-NIDRS-婚姻狀況代碼](CodeSystem-cdc-marital-status.html) | 婚姻代碼 | 6 | Patient.maritalStatus(MARRIAGE) |
| [CDC-NIDRS-個案死亡原因代碼](CodeSystem-cdc-death-reason.html) | 死亡原因代碼 | 7 | 本IG Profile 未直接綁定(死亡原因甲~丁為文字欄位) |
| [CDC-NIDRS-接觸動物種類代碼](CodeSystem-cdc-animal.html) | 動物代碼 | 18 | 接觸動物史 Observation(ANIMAL_ID) |
| [CDC-NIDRS-國家代碼](CodeSystem-cdc-country.html) | 國家代碼 | 251 | Patient 國家(NATIONALITY)、旅遊地區(TRAVEL_AREA) |
| [CDC-NIDRS-縣市代碼](CodeSystem-cdc-county.html) | 縣市代碼(含鄉鎮市區.村里) | 22 | 居住縣市(RESIDENCE_COUNTY)、國內旅遊地區 |
| [CDC-NIDRS-鄉鎮市區代碼](CodeSystem-cdc-town.html) | 縣市代碼(含鄉鎮市區.村里) | 368 | 鄉鎮市區(RESIDENCE_TOWN) |
| [CDC-NIDRS-村里代碼](CodeSystem-cdc-village.html) | 縣市代碼(含鄉鎮市區.村里) | 7,857 | 居住村里(RESIDENCE_VILLAGE) |
| [CDC-NIDRS-大陸省份代碼(SARS)](CodeSystem-cdc-china-province.html) | 大陸省份代碼(SARS) | 29 | 本IG Profile 未直接綁定 |
| [CDC-NIDRS-HIV危險因子代碼](CodeSystem-cdc-hiv-risk-factor.html) | 危險因子代碼(HIV) | 7 | 本IG Profile 未直接綁定 |
| [CDC-NIDRS-HIV確診定義代碼](CodeSystem-cdc-hiv-diagnosis-definition.html) | HIV確診定義代碼 | 6 | 附錄二 HIV 增補欄位(答案值以代碼字串填答) |
| [CDC-NIDRS-AIDS臨床症狀代碼](CodeSystem-cdc-aids-clinical-symptom.html) | AIDS臨床症狀代碼 | 28 | 本IG Profile 未直接綁定 |
| [CDC-NIDRS-嚴重特殊傳染性肺炎相關併發症代碼](CodeSystem-cdc-covid-complication.html) | 嚴重特殊傳染性肺炎相關併發症 | 3 | 附錄二增補欄位(答案值以代碼字串填答) |
| [CDC-NIDRS-結核病檢驗結果代碼](CodeSystem-cdc-tb-result.html) | 結核病檢驗結果代碼 | 28 | 附錄二結核病增補欄位(答案值以代碼字串填答) |
| [CDC-NIDRS-痰檢驗結果代碼(TB、MDRTB)](CodeSystem-cdc-sputum-result.html) | 痰檢驗結果代碼(TB、MDRTB) | 19 | 本IG Profile 未直接綁定 |
| [CDC-NIDRS-結核病檢體類別代碼](CodeSystem-cdc-tb-specimen-type.html) | 結核病檢體類別 | 9 | TB 送驗檢體 Specimen.type |
| [CDC-NIDRS-肺外依據代碼(TB、MDRTB)](CodeSystem-cdc-extrapulmonary-basis.html) | 肺外依據代碼(TB、MDRTB) | 13 | 附錄二結核病增補欄位(答案值以代碼字串填答) |
| [CDC-NIDRS-虛擬醫事機構代碼](CodeSystem-cdc-virtual-hospital.html) | 虛擬醫事機構代碼 | 52 | 本IG Profile 未直接綁定 |
| [CDC-NIDRS-隔離處所類型代碼](CodeSystem-cdc-quarantine-site-type.html) | 隔離處所類型 | 4 | 本IG Profile 未直接綁定(原用於嚴重特殊傳染性肺炎收治隔離題組，該題組已於 V1.21 移除) |
| [CDC-NIDRS-隔離處所代碼](CodeSystem-cdc-quarantine-site.html) | 隔離處所 | 352 | 同上 |
| [CDC-NIDRS-處理結果(錯誤)代碼](CodeSystem-cdc-processing-result.html) | 處理結果 | 33 | OperationOutcome.issue.details(ERROR_Code) |
| [CDC-NIDRS-處理結果代碼組成(項目代碼及檢核代碼)](CodeSystem-cdc-processing-result-part.html) | 處理結果 | 16 | 錯誤代碼之組成說明 |
{:.grid}

代碼數為 v1.42 轉換時之概念數(含標示為停用者)。附錄二疾病增補欄位之 Questionnaire 答案值以字串填寫代碼，並未以 answerValueSet 綁定上述代碼系統。

### 代碼系統：附錄四「送驗代碼彙整表」

| 代碼系統(值集同 Id) | 來源工作表 | 代碼數 | 用途 |
|---|---|---|---|
| [CDC-NIDRS-疾管署之可送驗疾病代碼](CodeSystem-cdc-test-disease.html) | 疾管署之可送驗疾病代碼 | 83 | ServiceRequest.reasonCode(DISEASE)、DiagnosticReport.code(DiseaseId) |
| [CDC-NIDRS-送驗檢體類別代碼](CodeSystem-cdc-specimen-type.html) | 送驗疾病與檢體類別之關聯 | 108 | Specimen.type(SAMPLE_TYPE) |
| [CDC-NIDRS-指定送驗單位-疾管署單位代碼](CodeSystem-cdc-lab-unit.html) | 指定送驗單位_疾管署單位代碼 | 10 | 指定收件單位(RECEIVED_UNIT，類型 1) |
| [CDC-NIDRS-指定送驗單位-認可實驗室代碼](CodeSystem-cdc-approved-lab.html) | 指定送驗單位_認可實驗室代碼 | 319 | 指定收件單位(RECEIVED_UNIT，類型 6)；v1.42 版快照，見下方說明 |
| [CDC-NIDRS-病原體檢驗方法代碼](CodeSystem-cdc-pathogen-method.html) | 病原體檢驗方法代碼 | 83 | 病原體檢驗結果 Observation.code(PathogenId) |
| [CDC-NIDRS-病原體類別代碼(大項及細項)](CodeSystem-cdc-pathogen.html) | 病原體類別大項；病原體類別細項及與大項之關連 | 527 | 病原體檢驗結果 Observation.value(MasterId/DetailId) |
| [CDC-NIDRS-結核病送驗項目代碼](CodeSystem-cdc-tb-test-item.html) | 結核病送驗項目代碼 | 11 | TB 送驗單 ServiceRequest.orderDetail(PHTESTITEM) |
{:.grid}

### 代碼系統：工作說明書本文定義之本地代碼

工作說明書本文中定義、但未列於附錄四之代碼，以及本IG為表達原規格結構所需之代碼，以人工定義於 `input/fsh/vocabulary/CDC-NIDRS-Local.fsh`：

| 代碼系統 | 說明 | 值集 |
|---|---|---|
| [CDC-NIDRS-訊息事件](CodeSystem-cdc-message-event.html) | EMRMsg01~04、HISMsg01~04、PushDetermineResult、PushSampleResult(表1及第四章) | [CDC-NIDRS-訊息事件值集](ValueSet-cdc-message-event.html)、[CDC-NIDRS-通報單位傳送訊息事件值集](ValueSet-cdc-message-event-request.html) |
| [CDC-NIDRS-性別](CodeSystem-cdc-gender.html) | GENDER(F、M、X)、TB 送驗單 SEX | [CDC-NIDRS-性別值集](ValueSet-cdc-gender.html) |
| [CDC-NIDRS-國籍別](CodeSystem-cdc-citizen.html) | CITIZEN(0 本國籍、1 非本國籍) | [CDC-NIDRS-國籍別值集](ValueSet-cdc-citizen.html) |
| [CDC-NIDRS-聯絡資料類型](CodeSystem-cdc-contact-type.html) | CONTACT_TYPE(0 連絡電話、1 手機)；FHIR 以 ContactPoint.system/use 表達 | — |
| [CDC-NIDRS-旅遊類型](CodeSystem-cdc-travel-type.html) | TRAVEL_TYPE(0 國內旅遊、1 國外旅遊史、2 國外居住史) | [CDC-NIDRS-旅遊類型值集](ValueSet-cdc-travel-type.html) |
| [CDC-NIDRS-病患動向](CodeSystem-cdc-patient-movement.html) | 原規格 8 個 HOSPITALIZED_* 布林欄位 | [CDC-NIDRS-病患動向值集](ValueSet-cdc-patient-movement.html) |
| [CDC-NIDRS-病歷檔案類別](CodeSystem-cdc-file-category.html) | EMRMsg03 FILE_CATEGORY | [CDC-NIDRS-病歷檔案類別值集](ValueSet-cdc-file-category.html) |
| [CDC-NIDRS-指定收件單位類型](CodeSystem-cdc-received-unit-type.html) | RECEIVED_UNIT_TYPE(1 疾管署、6 認可實驗室) | [CDC-NIDRS-指定收件單位類型值集](ValueSet-cdc-received-unit-type.html) |
| [CDC-NIDRS-疾管署分子快速檢測送驗原因](CodeSystem-cdc-xpert-reason.html) | SampleReasonXPERT(1~15) | [值集](ValueSet-cdc-xpert-reason.html) |
| [CDC-NIDRS-抗結核菌藥物使用情形](CodeSystem-cdc-tb-medicine-use.html) | TB_MEDICINE_USE_ID(N、1、2) | [值集](ValueSet-cdc-tb-medicine-use.html) |
| [CDC-NIDRS-識別碼類型](CodeSystem-cdc-identifier-type.html) | 通報單號、NIDRS 系統自動編碼證號(AA/BB/CC)、送驗單編號 | — |
| [CDC-NIDRS-觀察項目](CodeSystem-cdc-nidrs-observation.html) | 流行病學資料、死亡原因、檢驗結果細節等無適當 LOINC 代碼之觀察項目 | [NIDRS-流行病學是非題值集](ValueSet-nidrs-epi-flag.html) |
| [CDC-NIDRS-通報單區段](CodeSystem-cdc-report-section.html) | Composition 之疾病增補欄位、死亡資料、個案生母資料區段 | — |
| [CDC-NIDRS-血清學檢驗方法代碼](CodeSystem-cdc-antibody-method.html) | SampleAntibodyResult.AntibodyId；附錄四未提供代碼清單，故 `content = not-present`，實際代碼以疾管署回傳為準 | — |
{:.grid}

其他本IG定義之值集：

- [NIDRS-病歷檔案類型(MIME)值集](ValueSet-nidrs-file-mime-type.html)：FILE_TYPE 1 docx、2 pdf、3 odt 以 MIME type 表達。
- [NIDRS-旅遊地區值集](ValueSet-nidrs-travel-area.html)：TRAVEL_AREA，包含縣市代碼及國家代碼。
- [CDC-NIDRS-研判結果「不符合疾病分類」細項代碼值集](ValueSet-cdc-determine-nonconform-reason.html)：研判結果擴充所綁定之細項值集。

### 概念對應(Concept Maps)

| 概念對應 | 來源 | 說明 |
|---|---|---|
| [國家代碼對應(NIDRS國家代碼→ISO 3166-1)](ConceptMap-cdc-country-to-iso3166.html) | 國家代碼工作表之 ISO 欄位(自動產生) | NIDRS 國家代碼(數字碼)與 ISO 3166-1 二位字母代碼之對應，供轉換為國際代碼(例如外國護照 identifier.system 之國別) |
| [疾病與主要症狀關聯](ConceptMap-cdc-disease-symptom.html) | 疾病與主要症狀關聯工作表(自動產生) | 通報疾病可填報之主要症狀；填寫非關聯之症狀時，NIDRS 將自動改為其他(999) |
| [送驗疾病與檢體類別之關聯](ConceptMap-cdc-test-disease-specimen.html) | 送驗疾病與檢體類別之關聯工作表(自動產生，排除停用者) | 送驗疾病可使用之檢體類別 |
| [送驗疾病與檢體類別之關聯(以通報疾病代碼表示者)](ConceptMap-cdc-disease-specimen.html) | 同上；疾病代碼(010m、0703、0705、091)未列於「疾管署之可送驗疾病代碼」者 | 以通報疾病代碼表示之送驗疾病可使用之檢體類別 |
| [性別代碼對應](ConceptMap-cdc-gender-to-administrative-gender.html) | 人工定義 | GENDER/SEX 與 FHIR AdministrativeGender |
| [婚姻狀況代碼對應](ConceptMap-cdc-marital-status-to-v3.html) | 人工定義 | 婚姻代碼與 HL7 v3 MaritalStatus |
| [聯絡資料類型對應](ConceptMap-cdc-contact-type-to-contactpoint.html) | 人工定義 | CONTACT_TYPE 與 ContactPoint.system/use |
| [病患動向與就醫類別對應](ConceptMap-cdc-patient-movement-to-encounter-class.html) | 人工定義 | 病患動向與 Encounter.class |
| [研判結果與病情確認狀態對應](ConceptMap-cdc-determine-status-to-condition-ver-status.html) | 人工定義 | 研判結果代碼與 Condition.verificationStatus |
| [通報疾病代碼對應 SNOMED CT](ConceptMap-cdc-disease-to-snomed.html) | 人工定義(`scripts/gen_standard_maps.py`) | 53 個通報疾病對應 SNOMED CT 疾患；用於 Condition.code 之 sct slice |
| [症狀代碼對應 SNOMED CT](ConceptMap-cdc-symptom-to-snomed.html) | 同上 | 62 個常用症狀對應 SNOMED CT 臨床發現；用於 Condition.evidence.code |
| [送驗檢體類別對應 SNOMED CT](ConceptMap-cdc-specimen-type-to-snomed.html) | 同上 | 17 個常用檢體類別對應 SNOMED CT 檢體；用於 Specimen.type |
| [結核病檢體類別對應 SNOMED CT](ConceptMap-cdc-tb-specimen-type-to-snomed.html) | 同上 | 結核病檢體類別對應 SNOMED CT 檢體 |
| [病原體類別對應 SNOMED CT](ConceptMap-cdc-pathogen-to-snomed.html) | 同上 | 16 個病原體大項對應 SNOMED CT 生物體；用於病原體檢驗結果 Observation.valueCodeableConcept |
| [病歷檔案類別對應 LOINC 文件類型](ConceptMap-cdc-file-category-to-loinc.html) | 同上 | FILE_CATEGORY 對應 LOINC 文件類型；用於 DocumentReference.type |
{:.grid}

### SNOMED CT 與 LOINC 之使用

本IG以疾管署代碼為主要(必填)代碼，並建議實作者**同時**填寫對應之國際標準代碼(CodeableConcept 之多筆 coding)，以利與醫院 EMR、TW Core 及國際資料交換：

| 元素 | 疾管署代碼(必填) | 建議同時填寫之國際標準代碼 |
|---|---|---|
| Condition.code(通報疾病) | CDCDisease | SNOMED CT 疾患(TW Core `sct` slice)，見 ConceptMap cdc-disease-to-snomed |
| Condition.evidence.code(主要症狀) | CDCSymptom | SNOMED CT 臨床發現，見 ConceptMap cdc-symptom-to-snomed |
| Specimen.type(檢體類別) | CDCSpecimenType / CDCTBSpecimenType | SNOMED CT 檢體，見 ConceptMap cdc-specimen-type-to-snomed |
| 病原體檢驗結果 Observation.valueCodeableConcept | CDCPathogen | SNOMED CT 生物體，見 ConceptMap cdc-pathogen-to-snomed |
| DocumentReference.type(病歷檔案) | CDCFileCategory(category) | LOINC 文件類型，見 ConceptMap cdc-file-category-to-loinc |
| 死亡原因 Observation.code | CDCNIDRSObservation#DEATH_REASON | LOINC `69453-9` Cause of death |
| ServiceRequest.code(送驗單) | — | SNOMED CT `108252007` Laboratory procedure(固定值) |
| Composition.type / section.code、職業、旅遊史 | — | LOINC `55751-2`、`11450-4`、`46240-8`、`29762-2`、`85658-3`、`8691-8`(固定值) |
{:.grid}

對應表僅收錄語意明確者；NIDRS 代碼較 SNOMED CT 概念狹義者(例如「流感併發重症」→ Influenza、「發燒(38℃以上)」→ Fever)標示為 `wider`。未收錄之代碼請僅填疾管署代碼。

### 引用之外部術語

| 術語 | 使用於 |
|---|---|
| TWIDIR [CDC-LIMS系統-檢驗結果](https://twidir.cdc.gov.tw/twidir/CodeSystem-twcdc-testresult-values.html)(`https://twidir.cdc.gov.tw/twidir/CodeSystem/twcdc-testresult-values`) | 綜合檢驗結果(ResultId)、血清學/病原體檢驗結果代碼；本IG僅以 canonical 參照，未將 TWIDIR 列為套件相依 |
| TW Core [臺灣醫事機構代碼](https://twcore.mohw.gov.tw/ig/twcore/1.0.0/CodeSystem-organization-identifier-tw.html)(`organization-identifier-tw`) | 醫事機構代碼(HOSPITAL、SAMPLING_HOSPITAL、TRANSFER_HOSPITAL)之 identifier.system |
| [LOINC](https://loinc.org/) | 病歷檔案類型(DocumentReference.type)、死亡原因 `69453-9`；Composition.type `55751-2` Public health Case report；區段代碼 `11450-4`、`46240-8`、`29762-2`；職業 `85658-3`；旅遊史 `8691-8` |
| [SNOMED CT](http://snomed.info/sct) | 送驗單 ServiceRequest.code `108252007` Laboratory procedure；疾病、症狀、檢體、病原體之對應(建議同時填寫) |
| HL7 Terminology(THO) | identifier type(v2-0203：PRN、PPN、HC)、v3-RoleCode `NMTH`(生母)、condition-clinical、condition-ver-status、condition-category、observation-category、v2-0074 `LAB`、discharge-disposition |
| [MIME types](https://www.iana.org/assignments/media-types/media-types.xhtml)(`urn:ietf:bcp:13`) | 病歷檔案類型 |
| ISO 3166 | 國家代碼對應目標；外國護照號碼 identifier.system(`http://hl7.org/fhir/sid/passport-{alpha-3}`) |
{:.grid}

### 未轉換之代碼表

下列附錄四工作表未轉換為 FHIR 術語，原因如下：

| 工作表 | 說明 |
|---|---|
| 醫事機構代碼(通報代碼彙整表) | 自 V1.23 起，「醫事機構代碼」請至健保署網站查詢(健保特約醫事機構查詢 `https://info.nhi.gov.tw/INAE1000/INAE1000S014`，或下載健保特約醫療院所名冊 `https://info.nhi.gov.tw/IODE0000/IODE0000S09?id=1120`)。本IG以 TW Core 醫事機構代碼識別碼系統表達，不另建代碼系統。 |
| 認可實驗室之可送驗疾病代碼(送驗代碼彙整表) | 自 V1.17 起不再更新，請至疾管署全球資訊網/應用專區/申請/傳染病認可檢驗機構，下載附件「傳染病認可檢驗機構名冊」(`https://gov.tw/Eba`)。 |
| 指定送驗單位_指定檢驗機構代碼(送驗代碼彙整表) | 請改至疾管署全球資訊網/應用專區/檢驗/指定檢驗機構，下載附件「新型A型流感指定檢驗機構名冊」(`https://gov.tw/B2s`)。 |
| 指定檢驗機構之可送驗疾病代碼(送驗代碼彙整表) | 僅列 NFluA(新型A型流感)及 NoCoV(中東呼吸症候群冠狀病毒感染症)，與上表搭配使用，未另建代碼系統。 |
| ChangeLog(兩檔) | 代碼表異動紀錄，非代碼。 |
{:.grid}

此外，「指定送驗單位_認可實驗室代碼」雖已轉換為 [CDC-NIDRS-指定送驗單位-認可實驗室代碼](CodeSystem-cdc-approved-lab.html)，惟附錄四註明該表異動頻繁，最新資料請至上述「傳染病認可檢驗機構名冊」下載；本IG所收錄者僅為 v1.42 版之快照。

### 大型代碼系統說明

[CDC-NIDRS-村里代碼](CodeSystem-cdc-village.html)收錄 7,857 個村里代碼(並以 `town` 屬性連結所屬鄉鎮市區)，為本IG最大之代碼系統，其 IG 網頁及值集展開(expansion)內容較大；驗證時建議使用支援大型代碼系統之術語伺服器或本機驗證器。村里代碼於附錄四 V1.39、V1.41 皆有更新，實作時應留意版本。
