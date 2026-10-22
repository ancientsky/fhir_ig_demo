本頁整理工作說明書 V1.42 中之檢核規則，並說明各規則在本IG中的處理方式：

- **FHIR 結構驗證**：以 Profile 之基數、資料類型、`maxLength` 及術語綁定表達，可由任何 FHIR Validator 驗證。
- **FHIR invariant**：可於單一 Resource 內以 FHIRPath 判斷之條件式規則，定義為 `nidrs-*` 限制條件(constraint)，亦可由 FHIR Validator 驗證。
- **疾管署端商業規則**：需跨 Resource 比對、需查詢疾管署資料(例如通報單建檔日、既有通報單、結核病追管名單)或屬疾管署系統行為之規則，本IG不以 invariant 表達，仍由疾管署 NIDRS 於「JSON 語意邏輯檢查」(本IG中即訊息內容檢核)時處理，並以錯誤代碼回覆。

### 本IG定義之 invariant

| 代碼 | 適用 Profile | 說明 | 原規格來源 |
|---|---|---|---|
| `nidrs-pat-1` | [Patient NIDRS](StructureDefinition-Patient-nidrs.html)、[Patient NIDRS Dengue Bulk](StructureDefinition-Patient-nidrs-dengue-bulk.html) | 須至少填寫一種個案證號：身分證統一編號、居留證統一證號、護照號碼或NIDRS系統自動編碼證號(AA/BB/CC)。 | Report_Common.IDNO |
| `nidrs-pat-2` | 同上 | 個案死亡(DEATH=true)時，死亡日期(DEATH_DAY)必填，故 deceasedBoolean 僅可為 false(死亡者以 deceasedDateTime 表達)。 | DEATH、DEATH_DAY |
| `nidrs-pat-3` | 同上 | 國籍為本國籍(CITIZEN=0)時，不可填寫非本國籍居民身分(RESIDENCE_TYPE)。 | RESIDENCE_TYPE |
| `nidrs-pat-4` | [Patient NIDRS TB Sample](StructureDefinition-Patient-nidrs-tb-sample.html) | TB送驗單性別(SEX)僅可為 F 女生或 M 男生。 | SEX |
| `nidrs-con-1` | [Condition NIDRS](StructureDefinition-Condition-nidrs.html)(含修改、登革熱大量通報) | 無發病日(NO_SICK_DAY)為 true 時，不可填寫發病日期(SICK_DAY)。 | SICK_DAY |
| `nidrs-con-2` | 同上 | 有症狀(HAS_SYMPTOM=true)時，發病日期必填；無症狀(HAS_SYMPTOM=false)時，「無發病日」需為 true。 | HAS_SYMPTOM |
| `nidrs-con-3` | 同上 | 通報結核病(010)或多重抗藥性結核病(010m)時，有無症狀(HAS_SYMPTOM)與主要症狀(DISEASE_SYMPTOM)不可填寫。 | HAS_SYMPTOM |
| `nidrs-con-4` | 同上 | 發病日期不可晚於診斷日期(共同欄位檢核條件)；下表所列疾病不檢核此先後順序。 | 共同欄位檢核條件 |
| `nidrs-enc-1` | [Encounter NIDRS](StructureDefinition-Encounter-nidrs.html) | 病患動向為入住一般病房時，入住一般病房日必填(period.start)。 | HOSPITALIZED_GENERAL_WARD |
| `nidrs-enc-2` | 同上 | 病患動向為入住加護病房/隔離病房時，須填寫對應之 location 與首次入住日。 | HOSPITALIZED_ICU、HOSPITALIZED_ISOLATION_ROOM |
| `nidrs-enc-3` | 同上 | 病患動向為出院時，出院日必填(period.end)。 | HOSPITALIZED_DISCHARGED |
| `nidrs-enc-4` | 同上 | 病患動向為轉院時，轉至院所名稱(hospitalization.destination)及轉院日期(period.end)必填。 | HOSPITALIZED_TRANSFER |
| `nidrs-trv-1` | [Observation NIDRS Travel](StructureDefinition-Observation-nidrs-travel.html) | 旅遊類型為國內旅遊(0)時，地區須為縣市代碼；國外旅遊史(1)/國外居住史(2)時，地區須為國家代碼。 | TRAVEL_TYPE、TRAVEL_AREA |
| `nidrs-lab-1` | [Organization NIDRS Lab](StructureDefinition-Organization-nidrs-lab.html) | 指定收件單位代碼須與指定收件單位類型一致：類型 1(疾管署)使用疾管署單位代碼；類型 6(認可實驗室)使用認可實驗室代碼或醫事機構代碼。 | RECEIVED_UNIT_TYPE、RECEIVED_UNIT |
| `nidrs-msg-1` | [MessageHeader NIDRS Response](StructureDefinition-MessageHeader-nidrs-response.html) | 處理失敗(response.code 非 ok)時，須提供錯誤清單(response.details)。 | STATUS=FAILURE、ERROR_LIST |
| `nidrs-bun-1` | [Bundle NIDRS Report Create](StructureDefinition-Bundle-nidrs-report-create.html)、[Bundle NIDRS Report Update](StructureDefinition-Bundle-nidrs-report-update.html) | 每一筆通報單(Composition)皆須填寫旅遊史有無(HAS_TRAVEL_HISTORY，1..1)。 | HAS_TRAVEL_HISTORY |
| `nidrs-bun-2` | 同上 | MessageHeader 須為 Bundle 之第一筆 entry。 | — |
| `nidrs-date-1` | 各 Profile 之日期元素(出生日期、死亡日期、發病日期、診斷日期、報告日期、衛生局收到日、病患動向日期、旅遊日期、採檢日、建檔日) | 日期若有值，不得為未來日期。 | 共同欄位檢核條件 |
| `nidrs-period-1` | [Encounter NIDRS](StructureDefinition-Encounter-nidrs.html)(period、location.period)、[Observation NIDRS Travel](StructureDefinition-Observation-nidrs-travel.html) | 期間之開始時間不得晚於結束時間(首次入住≦轉出加護病房/隔離病房日、入住一般病房日≦出院日、旅遊開始時間≦結束時間)。 | 共同欄位檢核條件(旅遊日期、病患動向檢核) |
| `nidrs-pat-5` | [Patient NIDRS](StructureDefinition-Patient-nidrs.html)、[Patient NIDRS Dengue Bulk](StructureDefinition-Patient-nidrs-dengue-bulk.html)、[Patient NIDRS TB Sample](StructureDefinition-Patient-nidrs-tb-sample.html) | 身分證統一編號格式須為 1 碼英文字母 + 1 或 2 + 8 碼數字。 | IDNO |
| `nidrs-pat-6` | 同上 | 居留證統一證號格式須為「1碼英文+9碼數字」或「2碼英文+8碼數字」。 | IDNO |
| `nidrs-pat-7`(warning) | 同上 | 性別宜與身分證統一編號第二碼一致(1=男性、2=女性)。 | GENDER、IDNO |
| `nidrs-pat-8` | 同上 | NIDRS系統自動編碼證號僅可填 AA、BB、CC 或系統自動編碼流水證號(例：AA11300001)。 | IDNO |
| `nidrs-pat-9` | [Patient NIDRS](StructureDefinition-Patient-nidrs.html)、[Patient NIDRS Dengue Bulk](StructureDefinition-Patient-nidrs-dengue-bulk.html) | 本國籍(CITIZEN=0)國家僅可填 158；非本國籍(CITIZEN=1)不可填 158。 | CITIZEN、NATIONALITY |
| `nidrs-pat-10` | [Patient NIDRS](StructureDefinition-Patient-nidrs.html)、[Patient NIDRS Dengue Bulk](StructureDefinition-Patient-nidrs-dengue-bulk.html) | 國家代碼為「其他」(OTH)時，其他國家(NATIONALITY_OTHER)必填。 | NATIONALITY_OTHER |
| `nidrs-pat-11` | [Patient NIDRS](StructureDefinition-Patient-nidrs.html)、[Patient NIDRS Dengue Bulk](StructureDefinition-Patient-nidrs-dengue-bulk.html) | 非本國籍居民身分為「其他」(9)時，非本國籍居民身分說明(RESIDENCE_TYPE_OTHER)必填。 | RESIDENCE_TYPE_OTHER |
| `nidrs-cmp-1` | [Composition NIDRS Report](StructureDefinition-Composition-nidrs-report.html) 等通報單 Profiles | 報告日期不得晚於衛生局收到日。 | 共同欄位檢核條件(通報日期檢核) |
| `nidrs-cmp-2`(warning) | 同上 | 報告日期僅可為建檔日起算往前 31 天內(含)；FHIR 驗證以驗證當日估算，正式檢核以 NIDRS 建檔日為準(故範例日期超過 31 天時會出現此警告)。 | REPORTED_DAY |
| `nidrs-con-6` | [Condition NIDRS](StructureDefinition-Condition-nidrs.html) 等通報疾病 Profiles | 主要症狀為「其他」(999)時，其他主要症狀(DISEASE_SYMPTOM_OTHER)必填。 | DISEASE_SYMPTOM_OTHER |
| `nidrs-occ-1` | [Observation NIDRS Occupation](StructureDefinition-Observation-nidrs-occupation.html) | 職業為「不詳」(63)時，詳細職業身分說明(OCCUPATION_OTHER)必填。 | OCCUPATION_OTHER |
| `nidrs-trv-2` | [Observation NIDRS Travel](StructureDefinition-Observation-nidrs-travel.html) | 國外旅遊史/國外居住史國家代碼為「其他」(OTH)時，其他國家(TRAVEL_AREA_OTHER)必填。 | TRAVEL_AREA_OTHER |
| `nidrs-ani-1` | [Observation NIDRS Animal](StructureDefinition-Observation-nidrs-animal.html) | 接觸動物種類為「其他」(90)時，其他接觸動物(ANIMAL_OTHER)必填。 | ANIMAL_OTHER |
| `nidrs-bun-4` | [Bundle NIDRS Report Create](StructureDefinition-Bundle-nidrs-report-create.html)、[Bundle NIDRS Report Update](StructureDefinition-Bundle-nidrs-report-update.html) | 出生日期不得晚於發病日期。 | 共同欄位檢核條件(個案日期檢核) |
| `nidrs-bun-5` | 同上 | 發病日期不得晚於死亡日期。 | 共同欄位檢核條件(個案日期檢核) |
| `nidrs-bun-6` | 同上 | 診斷日期不得晚於報告日期(僅檢核單一通報單之訊息)。 | 共同欄位檢核條件(通報日期檢核) |
| `nidrs-bun-7` | 同上 | 填寫死亡原因時，個案須為死亡且填寫死亡日期。 | DEATH_REASON_A~D、DEATH_DAY |
| `nidrs-bun-8` | [Bundle NIDRS Sample](StructureDefinition-Bundle-nidrs-sample.html) | 結核病送驗之採檢日須在送驗日之前或同日。 | SAMPLED_DAY、PHPROVIDEDATE |

上表 `nidrs-date-1` 至 `nidrs-bun-8` 參考 [fhir-nidrs/nidrs](https://build.fhir.org/ig/fhir-nidrs/nidrs/) 之檢核規則並依本IG結構調整(v0.1.1 新增)。
{:.grid}

此外，FHIR 核心 Period 之限制條件 `per-1`(start 不可晚於 end)自動適用於旅遊史之開始/結束時間(`Observation.effectivePeriod`)，以及加護病房、隔離病房之首次入住日/轉出日(`Encounter.location.period`)。

### 以 Profile 結構表達之規則

| 原規格規則 | 本IG表達方式 |
|---|---|
| 通報單號(REPORT)：修改通報單時必填 | [Condition NIDRS Update](StructureDefinition-Condition-nidrs-update.html) 之 `identifier[reportId]` 為 1..1 |
| 備註(NOTE)：新增時可填寫，修改時不可填寫；修改原因(MODIFIED_REASON)：修改時必填，新增時不可填寫 | [Composition NIDRS Report](StructureDefinition-Composition-nidrs-report.html) 之 modifiedReason 為 0..0；[Composition NIDRS Report Update](StructureDefinition-Composition-nidrs-report-update.html) 之 modifiedReason 為 1..1、note 為 0..0 |
| 通報單一次最多 10 筆；同一個案一次最多通報 10 個法定傳染病 | MessageHeader.focus 1..10；Composition `section[disease].entry` 1..10 |
| 連絡電話、手機皆必填(若無請填「無」) | Patient `telecom[phone]`、`telecom[mobile]` 皆為 1..1(登革熱大量通報時連絡電話為 0..1) |
| 是否死亡(DEATH)必填 | Patient `deceased[x]` 1..1(登革熱大量通報時為 0..1) |
| 職業(OCCUPATION)必填 | Composition 流行病學資料區段之 occupation 為 1..1(登革熱大量通報時為 0..1) |
| 有無症狀(HAS_SYMPTOM)必填 | Condition hasSymptom 擴充 1..1(登革熱大量通報時為 0..1；結核病另依 `nidrs-con-3` 不可填寫) |
| 病歷檔案類型僅限 docx、pdf、odt | DocumentReference `content.attachment.contentType` 以 required 綁定 [NIDRS-病歷檔案類型(MIME)值集](ValueSet-nidrs-file-mime-type.html) |
| 各欄位長度(String/N) | 以 `maxLength` 表達 |
{:.grid}

### 共同欄位檢核條件(日期先後順序)

依工作說明書「四、(五)、戊. 共同欄位檢核條件」，下列各組日期或時間欄位，由上(早)至下(晚)不可早於或晚於上下相鄰欄位之時間：

| 時間序 | 通報日期檢核 | 個案日期檢核 | 旅遊日期檢核 | 病患動向檢核(隔離病房) | 病患動向檢核(加護病房) |
|---|---|---|---|---|---|
| 早 | 出生日期 | 出生日期 | 開始時間 | 首次入住隔離病房日 | 首次入住加護病房日 |
| ↓ | 發病日期\* | 發病日期 | 結束時間 | 轉出隔離病房日 | 轉出加護病房日 |
| ↓ | 診斷日期 | 死亡日期 | | | |
| ↓ | 報告日期 | | | | |
| 晚 | 衛生局收到日期 | | | | |
{:.grid}

對應之 FHIR 資料項目：出生日期 `Patient.birthDate`；發病日期 `Condition.onsetDateTime`；診斷日期 `Condition.recordedDate`；報告日期 `Composition.date`；衛生局收到日期 Composition 之 [nidrs-phb-received-date](StructureDefinition-nidrs-phb-received-date.html) 擴充；死亡日期 `Patient.deceasedDateTime`；旅遊開始/結束時間 `Observation.effectivePeriod`；隔離病房、加護病房日期 `Encounter.location.period`。

其中「發病日期 ≤ 診斷日期」以 `nidrs-con-4`、旅遊及病房日期以 `per-1` 驗證；其餘需跨 Resource 比對(例如出生日期與發病日期、診斷日期與報告日期、報告日期與衛生局收到日期、發病日期與死亡日期)者為**疾管署端商業規則**。

\*註：考量部分疾病可能透過篩檢通報後才出現臨床症狀，故下列疾病不檢核「發病日期」與「診斷日期」之先後順序(`nidrs-con-4` 已排除下列疾病代碼)：

| 疾病代碼 | 疾病名稱 | 疾病代碼 | 疾病名稱 |
|---|---|---|---|
| 010 | 結核病 | 091 | 先天性梅毒 |
| 010m | 多重抗藥性結核病 | 098 | 淋病 |
| 023 | 布氏桿菌病 | 130 | 弓形蟲感染症 |
| 030 | 漢生病 | 19CoV | 嚴重特殊傳染性肺炎(112/3/19以前病例定義版本) |
| 042 | 後天免疫缺乏症候群 | A920 | 屈公病 |
| 044 | 人類免疫缺乏病毒感染(含母子垂直感染及孕產婦疑似個案) | MPXV | M痘 |
| 0543 | 疱疹B病毒感染症 | NFluA | 新型A型流感 |
| 056 | 德國麻疹 | NiV | 立百病毒感染症 |
| 061 | 登革熱 | NoCoV | 中東呼吸症候群冠狀病毒感染症 |
| 0663a | 裂谷熱 | SFTS | 發熱伴血小板減少綜合症 |
| 071T | 狂犬病毒檢驗 | ZIKAT | 茲卡病毒篩檢 |
| 0788b | 拉薩熱 | ZIKAV | 茲卡病毒感染症 |
| 090 | 梅毒 | | |
{:.grid}

### 通報單共同欄位之條件式規則

下表整理表16「傳染病通報單結構表」(Report_Common)及表17~表19 之條件式規則：

| 規則(依工作說明書) | 本IG處理方式 |
|---|---|
| **個案證號(IDNO)**：請優先填入身分證統一編號，無法得知時始可填入居留證統一證號或護照號碼 | 至少一種證號以 `nidrs-pat-1` 驗證；填寫優先順序為商業規則 |
| **AA/BB/CC**：無法取得上述證號時，本國新生兒(報告日期－出生日期 < 6 個月)填「AA」、本國人士填「BB」、外國人士填「CC」，由系統自動編碼流水證號(例：AA11300001)；通報成功後可至 NIDRS 網頁查詢。EMR 增修通報單時填入 AA/BB/CC，NIDRS 不會覆蓋或重新編碼 | 以 `identifier[nidrsTempId]`(use = temp)傳送。AA/BB/CC 與年齡、國籍之一致性為商業規則；系統自動編碼之證號以回覆之 `Condition.subject.identifier`(IDNO)取得 |
| **國籍/國家**：國籍為本國籍(CITIZEN=0)時國家(NATIONALITY)僅可填 158；非本國籍時不可填 158，請填寫護照之發放國家；查無國家名稱時填「其他」並填寫其他國家(NATIONALITY_OTHER) | 商業規則(國家代碼以 `patient-nationality` 擴充之 code 表達，「其他國家」填於 CodeableConcept.text) |
| **非本國籍居民身分**：本國籍時不可填寫；填寫「其他」時，非本國籍居民身分說明(RESIDENCE_TYPE_OTHER)必填 | 前者以 `nidrs-pat-3` 驗證；後者為商業規則(說明填於 CodeableConcept.text) |
| **病患動向**：門診、急診待床、入住一般病房、入住加護病房、入住隔離病房、出院、轉院、無就醫，請擇一填寫；各動向之相依日期必填 | 「擇一」以病患動向擴充基數 1..1 表達；相依日期以 `nidrs-enc-1`~`nidrs-enc-4` 驗證 |
| **是否死亡**：勾選「是」時，死亡日期必填 | `nidrs-pat-2` |
| **發病日期/無發病日/有無症狀** | `nidrs-con-1`、`nidrs-con-2`、`nidrs-con-3` |
| **主要症狀(DISEASE_SYMPTOM)**：請參考「疾病與主要症狀關聯」；填寫非該疾病關聯之症狀代碼時，NIDRS 將自動改填為其他(999)，並將原症狀改填至 DISEASE_SYMPTOM_OTHER；主要症狀含其他(999)時須填寫其他症狀說明 | 疾病與症狀之關聯以 ConceptMap [疾病與主要症狀關聯](ConceptMap-cdc-disease-symptom.html) 提供參考；自動改填為疾管署系統行為；其他症狀說明填於 `Condition.evidence.code.text`(商業規則) |
| **報告日期(REPORTED_DAY)**：填入值僅可為該通報單建檔日起算往前 31 天內(含)之日期 | `nidrs-cmp-2`(warning，以驗證當日估算；正式檢核以疾管署建檔日為準) |
| **職業**：職業選擇不詳時，請於詳細職業身分說明(OCCUPATION_OTHER)說明 | `nidrs-occ-1`(說明填於 CodeableConcept.text) |
| **旅遊史**：旅遊史為「有」時需填寫旅遊史明細(TRAVEL)；國外旅遊史/國外居住史之國家代碼選擇其他時，其他國家(TRAVEL_AREA_OTHER)必填；國外居住史之開始時間為離境居住國日期、結束時間為入境我國日期 | 有旅遊史需有 Travel Observation 為跨 Resource 之商業規則；地區代碼類型以 `nidrs-trv-1` 驗證 |
| **動物接觸史**：動物接觸史為「有」時需填寫接觸動物史(ANIMAL)；接觸動物種類為其他(90)時，其他接觸動物(ANIMAL_OTHER)必填 | 商業規則(其他動物填於 CodeableConcept.text) |
| **不收集動物接觸史之疾病**：德國麻疹(056)、麻疹(055)、急性病毒性D型肝炎(070d)、腸病毒感染併發重症(0749)不收集動物接觸史題組，若傳送將不檢核且不呈現於網頁 | 疾管署系統行為；通報上述疾病時，傳送端**不應(SHOULD NOT)**傳送 HAS_ANIMAL_HISTORY 及接觸動物史 Observation |
| **人口密集機構**：是時填寫機構類別(ORG_ID) | [Observation NIDRS Dense Institution](StructureDefinition-Observation-nidrs-dense-institution.html) 之 value[x] 型別選擇 |
| **個案生母資料**：生母身分證統一編號/居留證統一證號 | 以 [RelatedPerson NIDRS Mother](StructureDefinition-RelatedPerson-nidrs-mother.html) 表達，無條件式規則 |
| **通報單修改**：當通報單之通報來源為 EMR 時，允許透過 EMR 修改一次 | 商業規則 |
{:.grid}

### 送驗單之檢核規則

| 規則(依工作說明書表14) | 本IG處理方式 |
|---|---|
| 檢體類別與「屍體解剖」及「送驗疾病」三者必須符合採檢手冊之定義 | ConceptMap [送驗疾病與檢體類別之關聯](ConceptMap-cdc-test-disease-specimen.html) 提供送驗疾病可用之檢體類別；三者一致性為商業規則 |
| 檢體類別為「其他」時，其他檢體備註說明必填 | 商業規則(說明填於 `Specimen.type.text`) |
| 送驗疾病不可重複 | 商業規則(`ServiceRequest.reasonCode` 每個疾病一筆) |
| 指定收件單位類型與送驗疾病須對應(疾管署之可送驗疾病代碼、認可實驗室/指定檢驗機構之可送驗疾病代碼)；收件單位代碼須與類型一致 | 類型與代碼之一致性以 `nidrs-lab-1` 驗證；可送驗疾病之對應為商業規則(「認可實驗室之可送驗疾病代碼」等表已改由疾管署網站維護，未轉換為 FHIR 術語，見[專門術語](terminologies.html)) |
| TB 送驗單：送驗疾病為結核病時，採檢日(SAMPLED_DAY)必須在送驗日(PHPROVIDEDATE)之前(或同日) | 跨 Resource(`Specimen.collection.collectedDateTime` 與 `ServiceRequest.authoredOn`)之商業規則 |
| TB 送驗單：法傳通報單號，非通報個案可不填 | [ServiceRequest NIDRS TB Sample](StructureDefinition-ServiceRequest-nidrs-tb-sample.html) 之 supportingInfo[report] 為 0..1(法傳送驗單為 1..1) |
{:.grid}

### 附錄一、重複通報與補正

EMR 通報時會啟動重複通報檢核：**該醫療院所在通報當日，已通報相同個案(證號)與疾病**，即為重複通報，回覆錯誤代碼 `IDA0000006`「重複通報」。結核病及多重抗藥性結核病另有特殊處理邏輯：

#### 結核病(010)
1. 先檢查個案是否有**待補正通報單**。待補正通報單限由原通報院所補正：若非原通報院所之電子病歷通報，回覆通報失敗並提示「重複通報」；若與待補正通報院所相同，則進行通報單補正，補正成功回傳「通報成功(補正)」。
2. 若個案沒有待補正通報單，檢查個案是否於結核病追管系統**追管中**；追管中個案不允許通報，回覆通報失敗並提示「追管中個案」。
3. 不符合上述條件者，成立新的法傳通報單。追管中個案清單每日一次自結核病追管系統取得。

#### 多重抗藥性結核病(010m)
1. 先檢查個案是否有多重抗藥性結核病之**待補正通報單**，處理方式同結核病(非原通報院所回覆「重複通報」；原通報院所補正成功回傳「通報成功(補正)」)。
2. 若無待補正通報單，檢查個案是否**已完成通報結核病且於結核病追管系統追管中**；不符合者不允許通報，回覆通報失敗並提示「非追管中的結核病」。
3. 若符合追管中之結核病，再檢查個案是否於結核病追管系統**多重抗藥性結核病追管中**；追管中者不允許通報，回覆通報失敗並提示「重複通報個案」。
4. 不符合上述條件者，成立新的法傳通報單。

上述邏輯皆需查詢疾管署既有通報資料及追管名單，屬疾管署端商業規則。相關錯誤代碼收錄於 [CDC-NIDRS-處理結果(錯誤)代碼](CodeSystem-cdc-processing-result.html)，例如：

| 代碼 | 說明 |
|---|---|
| `IDA0000001` | 通報成功{(補正)} \| 查詢成功 |
| `IDA0000006` | 重複通報：醫院({醫院名稱})，今天已通報過個案({ID})，疾病({疾病代碼})，通報單號({通報單號}) |
| `3000101001` | 此証號之TB通報為重複通報 |
| `3000101002` | 此証號之TB通報為追管中個案 |
{:.grid}

多重抗藥性結核病之提示訊息(「非追管中的結核病」、「重複通報個案」)於附錄四「處理結果」未列出對應之完整代碼，實際代碼以疾管署回覆為準。

### 錯誤代碼

疾管署回覆之錯誤代碼(ERROR_Code)為 10 碼，由「項目代碼(6碼)」加「檢核代碼(4碼)」組成，例如 `IDA3020002` = 通報單-個案資料(`IDA302`) + 必填檢核(`0002`)；疾病增補資料之項目代碼為「3」+疾病代碼(5碼)。本IG將附錄四「處理結果」工作表轉換為：

- [CDC-NIDRS-處理結果(錯誤)代碼](CodeSystem-cdc-processing-result.html)：特殊處理代碼(如電子簽章驗證失敗 `IDA0000003`、無憑證 `IDA0000004`、未簽章 `IDA0000005`、重複通報 `IDA0000006`、疾病禁止通報 `IDA0000007`)、各疾病通報檢核代碼及參考範例中之完整代碼；
- [CDC-NIDRS-處理結果代碼組成(項目代碼及檢核代碼)](CodeSystem-cdc-processing-result-part.html)：組成用之項目代碼與檢核代碼。

由於完整錯誤代碼為組合碼，無法完整列舉，[OperationOutcome NIDRS](StructureDefinition-OperationOutcome-nidrs.html) 之 `issue.details` 以 `extensible` 綁定，接收端應能處理未列於代碼系統中之組合碼。

### 附錄二、疾病增補欄位之檢核邏輯

附錄二各疾病增補欄位之「檢核邏輯資訊」(例如題組必勾選、相依欄位必填)保留為文字，置於各疾病增補欄位 Questionnaire 之 `Questionnaire.purpose`，未轉換為 FHIRPath 或 `enableWhen`。各疾病之 Questionnaire 及是否具有檢核邏輯，請參考[疾病增補欄位(附錄二)](supplement-fields.html)。此類檢核由疾管署於通報時處理，錯誤代碼之項目代碼為「3」+疾病代碼(例如 `30487a0101`)。
