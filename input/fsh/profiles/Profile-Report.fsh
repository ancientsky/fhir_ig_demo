// ============================================================
// 傳染病個案通報單(Composition)
// ============================================================

RuleSet: CompositionReportRules(patientProfile, conditionProfile, occupationMin, epiMin, sectionMin)
* ^version = "0.1.0"
* status = #final
* type = $LNC#55751-2 "Public health Case report"
* type ^short = "文件類型：Public health Case report(LOINC 55751-2)"
* subject 1..1 MS
* subject only Reference({patientProfile})
* subject ^short = "通報個案"
* date MS
* date ^short = "報告日期(REPORTED_DAY)；僅可為建檔日起算往前31天內(含)之日期"
* date obeys nidrs-date-1
* obeys nidrs-cmp-1 and nidrs-cmp-2
* author 1..1 MS
* author only Reference(PractitionerRoleNIDRSReporter)
* author ^short = "通報單登錄者(REPORTER_NAME)、通報單位(HOSPITAL)與通報者聯絡電話(HOSPITAL_CONTACT)"
* title = "傳染病個案通報單"
* custodian 1..1 MS
* custodian only Reference(OrganizationNIDRSHospital)
* custodian ^short = "通報單位(HOSPITAL、HOSPITAL_NAME、HOSPITAL_ADDRESS)"
* extension contains
    NIDRSPHBReceivedDate named phbReceivedDate 1..1 MS and
    NIDRSReportNote named note 0..1 MS and
    NIDRSModifiedReason named modifiedReason 0..1 MS
* extension[phbReceivedDate] ^short = "衛生局收到日(PHB_RECEIVED_DAY)"
* extension[note] ^short = "備註(NOTE)；新增通報時可填寫，修改通報時不可填寫"
* extension[modifiedReason] ^short = "修改原因(MODIFIED_REASON)；修改通報時必填，新增通報時不可填寫"
* section {sectionMin}..* MS
* section ^slicing.discriminator.type = #pattern
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false
* section contains
    disease 1..1 MS and
    patientMovement 0..1 MS and
    epidemiology {epiMin}..1 MS and
    supplement 0..1 MS and
    death 0..1 MS and
    mother 0..1 MS
// 通報疾病
* section[disease] ^short = "通報疾病區塊(DISEASE)"
* section[disease].title = "通報疾病"
* section[disease].code = $LNC#11450-4 "Problem list - Reported"
* section[disease].entry 1..10 MS
* section[disease].entry only Reference({conditionProfile})
* section[disease].entry ^short = "通報疾病(DISEASE_ID)，同一個案一次最多通報10個法定傳染病"
// 病患動向
* section[patientMovement] ^short = "病患動向"
* section[patientMovement].title = "病患動向"
* section[patientMovement].code = $LNC#46240-8 "History of Hospitalizations+Outpatient visits Narrative"
* section[patientMovement].entry 1..1 MS
* section[patientMovement].entry only Reference(EncounterNIDRS)
// 流行病學資料
* section[epidemiology] ^short = "流行病學資料(職業、旅遊史、接觸動物史、暴露史、人口密集機構)"
* section[epidemiology].title = "流行病學資料"
* section[epidemiology].code = $LNC#29762-2 "Social history Narrative"
* section[epidemiology].entry 1..* MS
* section[epidemiology].entry ^slicing.discriminator.type = #profile
* section[epidemiology].entry ^slicing.discriminator.path = "resolve()"
* section[epidemiology].entry ^slicing.rules = #open
* section[epidemiology].entry contains
    occupation {occupationMin}..1 MS and
    epiFlag 0..* MS and
    travel 0..* MS and
    animal 0..* MS and
    denseInstitution 0..1 MS
* section[epidemiology].entry[occupation] only Reference(ObservationNIDRSOccupation)
* section[epidemiology].entry[occupation] ^short = "職業(OCCUPATION)"
* section[epidemiology].entry[epiFlag] only Reference(ObservationNIDRSEpiFlag)
* section[epidemiology].entry[epiFlag] ^short = "旅遊史/動物接觸史有無及暴露史(HAS_TRAVEL_HISTORY、HAS_ANIMAL_HISTORY、EXPLORE_*)"
* section[epidemiology].entry[travel] only Reference(ObservationNIDRSTravel)
* section[epidemiology].entry[travel] ^short = "旅遊史(TRAVEL)；旅遊史為有時需填寫"
* section[epidemiology].entry[animal] only Reference(ObservationNIDRSAnimal)
* section[epidemiology].entry[animal] ^short = "接觸動物史(ANIMAL)；動物接觸史為有時需填寫"
* section[epidemiology].entry[denseInstitution] only Reference(ObservationNIDRSDenseInstitution)
* section[epidemiology].entry[denseInstitution] ^short = "人口密集機構(HAS_ORG、ORG_ID)"
// 疾病增補欄位
* section[supplement] ^short = "疾病增補欄位(DISEASE_FIELD)，請參考附錄二"
* section[supplement].title = "疾病增補欄位"
* section[supplement].code = CDCReportSection#supplement
* section[supplement].entry 1..* MS
* section[supplement].entry only Reference(QuestionnaireResponseNIDRS)
// 死亡資料
* section[death] ^short = "死亡原因(DEATH_REASON_A~D、DEATH_REASON_OTHER)"
* section[death].title = "死亡資料"
* section[death].code = CDCReportSection#death
* section[death].entry 1..1 MS
* section[death].entry only Reference(ObservationNIDRSCauseOfDeath)
// 個案生母資料
* section[mother] ^short = "個案生母資料(BIRTH_MOTHER_NAME、BIRTH_MOTHER_IDNO)"
* section[mother].title = "個案生母資料"
* section[mother].code = CDCReportSection#mother
* section[mother].entry 1..1 MS
* section[mother].entry only Reference(RelatedPersonNIDRSMother)

Profile: CompositionNIDRSReport
Parent: TWCoreComposition
Id: Composition-nidrs-report
Title: "傳染病個案通報單-Composition NIDRS Report"
Description: "此傳染病個案通報單-Composition NIDRS Report Profile說明本IG如何進一步定義臺灣核心-臨床文件架構(TW Core Composition) Profile以呈現一筆傳染病個案通報單(EMRMsg01 REPORTS.REPORT)，整合通報單共同欄位、通報疾病、流行病學資料與疾病增補欄位。"
* insert CompositionReportRules(PatientNIDRS, ConditionNIDRS, 1, 1, 2)
* extension[modifiedReason] 0..0

Profile: CompositionNIDRSReportUpdate
Parent: TWCoreComposition
Id: Composition-nidrs-report-update
Title: "傳染病個案通報單修改-Composition NIDRS Report Update"
Description: "此傳染病個案通報單修改-Composition NIDRS Report Update Profile說明本IG如何進一步定義臺灣核心-臨床文件架構(TW Core Composition) Profile以呈現通報單修改作業(EMRMsg02)。修改時必須填寫修改原因(MODIFIED_REASON)且不可填寫備註(NOTE)，通報疾病須帶入原通報單號；當通報單之通報來源為EMR時，允許透過EMR修改一次。"
* insert CompositionReportRules(PatientNIDRS, ConditionNIDRSUpdate, 1, 1, 2)
* extension[modifiedReason] 1..1
* extension[note] 0..0
* section[disease].entry 1..1

Profile: CompositionNIDRSReportDengueBulk
Parent: TWCoreComposition
Id: Composition-nidrs-report-dengue-bulk
Title: "傳染病個案通報單(登革熱大量通報)-Composition NIDRS Report Dengue Bulk"
Description: "此傳染病個案通報單(登革熱大量通報)-Composition NIDRS Report Dengue Bulk Profile說明本IG如何進一步定義臺灣核心-臨床文件架構(TW Core Composition) Profile以呈現附錄五登革熱大量通報必填欄位縮減之通報單：聯絡電話、個案是否死亡、職業及有無症狀調整為非必填(待疾病管制署通知後上版啟用)。"
* insert CompositionReportRules(PatientNIDRSDengueBulk, ConditionNIDRSDengueBulk, 0, 0, 1)
* extension[modifiedReason] 0..0

// ============================================================
// 通報疾病(Condition)
// ============================================================

Invariant: nidrs-cmp-1
Description: "報告日期(REPORTED_DAY)不得晚於衛生局收到日(PHB_RECEIVED_DAY)。"
Severity: #error
Expression: "extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-phb-received-date').value.exists() and date.exists() implies date.toString().substring(0, 10) <= extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-phb-received-date').value.toString()"

Invariant: nidrs-cmp-2
Description: "報告日期(REPORTED_DAY)僅可為通報單建檔日起算往前31天內(含)之日期(以驗證當日估算，正式檢核以 NIDRS 建檔日為準)。"
Severity: #warning
Expression: "date.exists() implies date.toString().substring(0, 10) >= (today() - 31 days).toString()"

RuleSet: ConditionNIDRSRules(patientProfile)
* ^version = "0.1.0"
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains reportId 0..1 MS
* identifier[reportId] ^short = "通報單號(REPORT_ID，13碼)；通報成功後由疾管署產生"
* identifier[reportId].type = CDCIdentifierType#nidrs-report
* identifier[reportId].system = $NIDRSReportId
* identifier[reportId].value 1..1
* identifier[reportId].value ^maxLength = 13
* clinicalStatus = $condition-clinical#active
* verificationStatus MS
* verificationStatus ^short = "通報時建議填寫 provisional；研判結果回饋後依研判結果更新"
* category = $condition-category#encounter-diagnosis
* code 1..1 MS
* code.coding contains cdcDisease 1..1 MS
* code.coding[cdcDisease] ^short = "通報疾病代碼(DISEASE_ID)"
* code ^short = "通報疾病；除 CDC 疾病代碼外，建議同時以 TW Core sct slice 填寫 SNOMED CT 編碼(ConceptMap cdc-disease-to-snomed)"
* code.coding[cdcDisease] from CDCDisease (required)
* code.coding[cdcDisease].system 1..1
* code.coding[cdcDisease].system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease"
* code.coding[cdcDisease].code 1..1
* subject only Reference({patientProfile})
* onset[x] only dateTime
* onset[x] MS
* onset[x] ^short = "發病日期(SICK_DAY)；有發病日時必填，無發病日時不可填寫"
* recordedDate 1..1 MS
* recordedDate ^short = "診斷日期(DIAGNOSE_DAY)"
* asserter 1..1 MS
* asserter only Reference(PractitionerNIDRS)
* asserter ^short = "診斷醫師(DIAGNOSTICIAN)"
* extension contains
    NIDRSHasSymptom named hasSymptom 0..1 MS and
    NIDRSNoOnsetDate named noOnsetDate 0..1 MS
* extension[hasSymptom] ^short = "有無症狀(HAS_SYMPTOM)；除結核病/多重抗藥性結核病外必填(登革熱大量通報除外)"
* extension[noOnsetDate] ^short = "無發病日(NO_SICK_DAY)"
* evidence MS
* evidence ^short = "主要症狀(DISEASE_SYMPTOM)；若有症狀請填寫"
* evidence.code 1..* MS
* evidence.code from CDCSymptom (extensible)
* evidence.code ^short = "症狀代碼(請參考 ConceptMap 疾病與主要症狀關聯)；其他(999)時請於 text 填寫其他症狀(DISEASE_SYMPTOM_OTHER，100字)。建議同時填寫 SNOMED CT 編碼(ConceptMap cdc-symptom-to-snomed)"
* evidence.code obeys nidrs-con-6
* onsetDateTime obeys nidrs-date-1
* recordedDate obeys nidrs-date-1
* obeys nidrs-con-1 and nidrs-con-2 and nidrs-con-3 and nidrs-con-4

Invariant: nidrs-con-6
Description: "主要症狀填寫「其他」(999)時，其他主要症狀(DISEASE_SYMPTOM_OTHER，填於 code.text)必填。"
Severity: #error
Expression: "coding.where(code = '999').exists() implies text.exists()"

Invariant: nidrs-con-1
Description: "無發病日(NO_SICK_DAY)為 true 時，不可填寫發病日期(SICK_DAY)。"
Severity: #error
Expression: "extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-no-onset-date').where(value = true).exists() implies onset.empty()"

Invariant: nidrs-con-2
Description: "有症狀(HAS_SYMPTOM=true)時，發病日期必填；無症狀(HAS_SYMPTOM=false)時，「無發病日」需為 true。"
Severity: #error
Expression: "(extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-has-symptom').where(value = true).exists() implies onset.exists()) and (extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-has-symptom').where(value = false).exists() implies extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-no-onset-date').where(value = true).exists())"

Invariant: nidrs-con-3
Description: "通報結核病(010)或多重抗藥性結核病(010m)時，有無症狀(HAS_SYMPTOM)與主要症狀(DISEASE_SYMPTOM)不可填寫。"
Severity: #error
Expression: "code.coding.where(system='https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease' and (code='010' or code='010m')).exists() implies (extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-has-symptom').empty() and evidence.empty())"

Invariant: nidrs-con-4
Description: "發病日期不可晚於診斷日期(共同欄位檢核條件)；結核病、HIV、梅毒、登革熱等附註疾病不檢核此先後順序。"
Severity: #error
Expression: "onset.exists() and code.coding.where(system='https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease' and ('010' | '010m' | '023' | '030' | '042' | '044' | '0543' | '056' | '061' | '0663a' | '071T' | '0788b' | '090' | '091' | '098' | '130' | '19CoV' | 'A920' | 'MPXV' | 'NFluA' | 'NiV' | 'NoCoV' | 'SFTS' | 'ZIKAT' | 'ZIKAV').contains(code)).empty() implies onset.ofType(dateTime) <= recordedDate"

Profile: ConditionNIDRS
Parent: TWCoreCondition
Id: Condition-nidrs
Title: "通報疾病-Condition NIDRS"
Description: "此通報疾病-Condition NIDRS Profile說明本IG如何進一步定義臺灣核心-病情、問題或診斷(TW Core Condition) Profile以呈現通報單之通報疾病區塊(DISEASE)與相關日期、臨床症狀。每一通報疾病為一筆 Condition，通報成功後疾管署依疾病分別產生通報單號。"
* insert ConditionNIDRSRules(PatientNIDRS)
* obeys nidrs-con-5

Invariant: nidrs-con-5
Description: "有無症狀(HAS_SYMPTOM)為必填；惟通報結核病(010)或多重抗藥性結核病(010m)時不可填寫。"
Severity: #error
Expression: "code.coding.where(system='https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease' and (code='010' or code='010m')).empty() implies extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-has-symptom').exists()"

Profile: ConditionNIDRSUpdate
Parent: ConditionNIDRS
Id: Condition-nidrs-update
Title: "通報疾病(修改)-Condition NIDRS Update"
Description: "此通報疾病(修改)-Condition NIDRS Update Profile說明修改通報單(EMRMsg02)時之通報疾病，必須帶入通報單號(REPORT)。原規格修改作業不傳送 DISEASE_ID，本IG仍要求 Condition.code 且須與原通報疾病相同。"
* ^version = "0.1.0"
* identifier[reportId] 1..1

Profile: ConditionNIDRSDengueBulk
Parent: TWCoreCondition
Id: Condition-nidrs-dengue-bulk
Title: "通報疾病(登革熱大量通報)-Condition NIDRS Dengue Bulk"
Description: "此通報疾病(登革熱大量通報)-Condition NIDRS Dengue Bulk Profile說明附錄五登革熱大量通報時之通報疾病；有無症狀調整為非必填(惟主要症狀仍維持相依性必填)。"
* insert ConditionNIDRSRules(PatientNIDRSDengueBulk)

// ============================================================
// 病患動向(Encounter)
// ============================================================

Profile: EncounterNIDRS
Parent: TWCoreEncounter
Id: Encounter-nidrs
Title: "病患動向-Encounter NIDRS"
Description: "此病患動向-Encounter NIDRS Profile說明本IG如何進一步定義臺灣核心-就醫事件(TW Core Encounter) Profile以呈現通報時之病患動向(門診、急診待床、入住一般病房、入住加護病房、入住隔離病房、出院、轉院、無就醫)及相關日期。"
* ^version = "0.1.0"
* extension contains NIDRSPatientMovement named patientMovement 1..1 MS
* extension[patientMovement] ^short = "病患動向(門診、急診待床、入住一般病房、入住加護病房、入住隔離病房、出院、轉院、無就醫，請擇一填寫)"
* class MS
* class ^short = "門診→AMB、急診待床→EMER、住院(一般病房/加護病房/隔離病房/出院/轉院)→IMP；無就醫時 class 僅填 data-absent-reason 擴充(not-applicable)"
* subject 1..1 MS
* subject only Reference(PatientNIDRS or PatientNIDRSDengueBulk)
* period MS
* period.start ^short = "入住一般病房日(HOSPITALIZED_DAY)"
* period obeys nidrs-period-1
* period.start obeys nidrs-date-1
* period.end obeys nidrs-date-1
* location.period obeys nidrs-period-1
* location.period.start obeys nidrs-date-1
* location.period.end obeys nidrs-date-1
* period.end ^short = "出院日(DISCHARGE)或轉院日期(TRANSFER_DAY)"
* serviceProvider MS
* serviceProvider only Reference(OrganizationNIDRSHospital)
* location MS
* location ^slicing.discriminator.type = #pattern
* location ^slicing.discriminator.path = "physicalType"
* location ^slicing.rules = #open
* location contains
    icu 0..1 MS and
    isolationRoom 0..1 MS
* location[icu] ^short = "加護病房：首次入住加護病房日(STAY_IN_ICU)、轉出加護病房日(LEAVE_ICU)"
* location[icu].physicalType = CDCPatientMovement#icu
* location[icu].location.display = "加護病房"
* location[icu].period 1..1 MS
* location[icu].period.start 1..1 MS
* location[isolationRoom] ^short = "隔離病房：首次入住隔離病房日(STAY_IN_IW)、轉出隔離病房日(LEAVE_IW)"
* location[isolationRoom].physicalType = CDCPatientMovement#isolation-room
* location[isolationRoom].location.display = "隔離病房"
* location[isolationRoom].period 1..1 MS
* location[isolationRoom].period.start 1..1 MS
* hospitalization MS
* hospitalization.dischargeDisposition MS
* hospitalization.dischargeDisposition ^short = "轉院時填寫 other-hcf"
* hospitalization.destination MS
* hospitalization.destination only Reference(OrganizationNIDRSHospital)
* hospitalization.destination ^short = "轉至院所(TRANSFER_HOSPITAL，醫事機構代碼)"
* obeys nidrs-enc-1 and nidrs-enc-2 and nidrs-enc-3 and nidrs-enc-4

Invariant: nidrs-enc-1
Description: "病患動向為入住一般病房時，入住一般病房日必填(period.start)。"
Severity: #error
Expression: "extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-patient-movement').value.coding.where(code='general-ward').exists() implies period.start.exists()"

Invariant: nidrs-enc-2
Description: "病患動向為入住加護病房/隔離病房時，須填寫對應之 location 與首次入住日。"
Severity: #error
Expression: "(extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-patient-movement').value.coding.where(code='icu').exists() implies location.where(physicalType.coding.code='icu').exists()) and (extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-patient-movement').value.coding.where(code='isolation-room').exists() implies location.where(physicalType.coding.code='isolation-room').exists())"

Invariant: nidrs-enc-3
Description: "病患動向為出院時，出院日必填(period.end)。"
Severity: #error
Expression: "extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-patient-movement').value.coding.where(code='discharged').exists() implies period.end.exists()"

Invariant: nidrs-enc-4
Description: "病患動向為轉院時，轉至院所名稱(hospitalization.destination)及轉院日期(period.end)必填。"
Severity: #error
Expression: "extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-patient-movement').value.coding.where(code='transfer').exists() implies (hospitalization.destination.exists() and period.end.exists())"

// ============================================================
// 流行病學資料(Observation)
// ============================================================

RuleSet: ObservationNIDRSBase(category)
* ^version = "0.1.0"
* status = #final
* category = $observation-category#{category}
* subject 1..1 MS
* subject only Reference(PatientNIDRS or PatientNIDRSDengueBulk)

Profile: ObservationNIDRSOccupation
Parent: Observation
Id: Observation-nidrs-occupation
Title: "職業-Observation NIDRS Occupation"
Description: "此職業-Observation NIDRS Occupation Profile說明本IG如何定義 Observation 以呈現通報個案之職業(OCCUPATION)及詳細職業身分說明(OCCUPATION_OTHER)。"
* insert ObservationNIDRSBase(social-history)
* code = $LNC#85658-3 "Occupation [Type]"
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from CDCOccupation (required)
* valueCodeableConcept ^short = "職業代碼(OCCUPATION)；職業選擇不詳時，請於 text 說明(OCCUPATION_OTHER，100字)"
* valueCodeableConcept obeys nidrs-occ-1

Invariant: nidrs-occ-1
Description: "職業選擇「不詳」(63)時，詳細職業身分說明(OCCUPATION_OTHER，填於 text)必填。"
Severity: #error
Expression: "coding.where(code = '63').exists() implies text.exists()"

Profile: ObservationNIDRSEpiFlag
Parent: Observation
Id: Observation-nidrs-epi-flag
Title: "流行病學是非題-Observation NIDRS Epi Flag"
Description: "此流行病學是非題-Observation NIDRS Epi Flag Profile說明本IG如何定義 Observation 以呈現通報單共同欄位中以布林值表示之流行病學資料：旅遊史(HAS_TRAVEL_HISTORY)、動物接觸史(HAS_ANIMAL_HISTORY)、與病例接觸或暴露共同感染源(EXPLORE_POSITIVE)、血體液接觸(EXPLORE_BODY_FLUID)、實驗室暴露史(EXPLORE_LAB)、食用受汙染的水或食物(EXPLORE_POLLUTED_FOOD)、醫源型(EXPLORE_IATROGENIC)。"
* insert ObservationNIDRSBase(social-history)
* code from NIDRSEpiFlag (required)
* value[x] 1..1 MS
* value[x] only boolean

Profile: ObservationNIDRSTravel
Parent: Observation
Id: Observation-nidrs-travel
Title: "旅遊史-Observation NIDRS Travel"
Description: "此旅遊史-Observation NIDRS Travel Profile說明本IG如何定義 Observation 以呈現通報單旅遊史(Report_Travel)。"
* insert ObservationNIDRSBase(social-history)
* code = $LNC#8691-8 "History of Travel"
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from NIDRSTravelArea (required)
* valueCodeableConcept ^short = "地區(TRAVEL_AREA)：國內旅遊填縣市代碼；國外填國家代碼，選擇其他時請於 text 填寫其他國家(TRAVEL_AREA_OTHER)"
* valueCodeableConcept obeys nidrs-trv-2
* effectivePeriod obeys nidrs-period-1
* effectivePeriod.start obeys nidrs-date-1
* effectivePeriod.end obeys nidrs-date-1
* effective[x] 1..1 MS
* effective[x] only Period
* effectivePeriod.start 1..1 MS
* effectivePeriod.start ^short = "開始時間(TRAVEL_DATE_FROM)；國外居住史為離境居住國日期"
* effectivePeriod.end 1..1 MS
* effectivePeriod.end ^short = "結束時間(TRAVEL_DATE_TO)；國外居住史為入境我國日期"
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    travelType 1..1 MS and
    subArea 0..1 MS
* component[travelType] ^short = "旅遊類型(TRAVEL_TYPE)"
* component[travelType].code = CDCNIDRSObservation#TRAVEL_TYPE
* component[travelType].value[x] 1..1
* component[travelType].value[x] only CodeableConcept
* component[travelType].valueCodeableConcept from CDCTravelType (required)
* component[subArea] ^short = "次級行政區(TRAVEL_SUB_AREA)；國外旅遊史/國外居住史可選填"
* component[subArea].code = CDCNIDRSObservation#TRAVEL_SUB_AREA
* component[subArea].value[x] 1..1
* component[subArea].value[x] only string
* obeys nidrs-trv-1

Invariant: nidrs-trv-2
Description: "國外旅遊史/國外居住史國家代碼選擇「其他」(OTH)時，其他國家(TRAVEL_AREA_OTHER，填於 text)必填。"
Severity: #error
Expression: "coding.where(code = 'OTH').exists() implies text.exists()"

Invariant: nidrs-trv-1
Description: "旅遊類型為國內旅遊(0)時，地區須為縣市代碼；國外旅遊史(1)/國外居住史(2)時，地區須為國家代碼。"
Severity: #error
Expression: "(component.where(code.coding.code='TRAVEL_TYPE').value.coding.code = '0') = value.coding.where(system='https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-county').exists()"

Profile: ObservationNIDRSAnimal
Parent: Observation
Id: Observation-nidrs-animal
Title: "接觸動物史-Observation NIDRS Animal"
Description: "此接觸動物史-Observation NIDRS Animal Profile說明本IG如何定義 Observation 以呈現通報單接觸動物史(Report_Animal)。德國麻疹、麻疹、急性病毒性D型肝炎、腸病毒感染併發重症不收集動物接觸史。"
* insert ObservationNIDRSBase(social-history)
* code = CDCNIDRSObservation#ANIMAL
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from CDCAnimal (required)
* valueCodeableConcept ^short = "接觸動物種類(ANIMAL_ID)；代碼為其他(90)時，請於 text 填寫其他接觸動物(ANIMAL_OTHER，120字)"
* valueCodeableConcept obeys nidrs-ani-1

Invariant: nidrs-ani-1
Description: "接觸動物種類代碼為「其他」(90)時，其他接觸動物(ANIMAL_OTHER，填於 text)必填。"
Severity: #error
Expression: "coding.where(code = '90').exists() implies text.exists()"

Profile: ObservationNIDRSDenseInstitution
Parent: Observation
Id: Observation-nidrs-dense-institution
Title: "人口密集機構-Observation NIDRS Dense Institution"
Description: "此人口密集機構-Observation NIDRS Dense Institution Profile說明本IG如何定義 Observation 以呈現個案是否為人口密集機構(HAS_ORG)及其機構類別(ORG_ID)。"
* insert ObservationNIDRSBase(social-history)
* code = CDCNIDRSObservation#HAS_ORG
* value[x] 1..1 MS
* value[x] only boolean or CodeableConcept
* value[x] ^short = "否：valueBoolean=false；是：valueCodeableConcept 填寫機構類別(ORG_ID)，未知類別時 valueBoolean=true"
* valueCodeableConcept from CDCDenseInstitution (required)

Profile: ObservationNIDRSCauseOfDeath
Parent: Observation
Id: Observation-nidrs-cause-of-death
Title: "死亡原因-Observation NIDRS Cause of Death"
Description: "此死亡原因-Observation NIDRS Cause of Death Profile說明本IG如何定義 Observation 以呈現通報單死亡原因甲、乙、丙、丁及其他(DEATH_REASON_A~D、DEATH_REASON_OTHER)。"
* insert ObservationNIDRSBase(exam)
* code = CDCNIDRSObservation#DEATH_REASON
* code ^short = "死亡原因；建議同時填寫 LOINC 69453-9 Cause of death"
* component 1..* MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component contains
    reasonA 0..1 MS and
    reasonB 0..1 MS and
    reasonC 0..1 MS and
    reasonD 0..1 MS and
    reasonOther 0..1 MS
* component[reasonA].code = CDCNIDRSObservation#DEATH_REASON_A
* component[reasonA].value[x] only string
* component[reasonA].valueString ^maxLength = 400
* component[reasonB].code = CDCNIDRSObservation#DEATH_REASON_B
* component[reasonB].value[x] only string
* component[reasonB].valueString ^maxLength = 400
* component[reasonC].code = CDCNIDRSObservation#DEATH_REASON_C
* component[reasonC].value[x] only string
* component[reasonC].valueString ^maxLength = 400
* component[reasonD].code = CDCNIDRSObservation#DEATH_REASON_D
* component[reasonD].value[x] only string
* component[reasonD].valueString ^maxLength = 400
* component[reasonOther].code = CDCNIDRSObservation#DEATH_REASON_OTHER
* component[reasonOther].value[x] only string
* component[reasonOther].valueString ^maxLength = 400

// ============================================================
// 疾病增補欄位(QuestionnaireResponse)
// ============================================================

Profile: QuestionnaireResponseNIDRS
Parent: QuestionnaireResponse
Id: QuestionnaireResponse-nidrs
Title: "增補欄位填答-QuestionnaireResponse NIDRS"
Description: "此增補欄位填答-QuestionnaireResponse NIDRS Profile說明本IG如何定義 QuestionnaireResponse 以呈現通報疾病增補欄位(DISEASE_FIELD)：questionnaire 指向該疾病之增補欄位 Questionnaire(附錄二)，item.linkId 為答題編號(KEY)，answer.value[x] 為答案值(VALUE)。(註：TW Core QuestionnaireResponse 繼承自 SDC，為避免額外相依性，本 Profile 直接繼承 FHIR R4 QuestionnaireResponse。)"
* ^version = "0.1.0"
* questionnaire 1..1 MS
* questionnaire ^short = "疾病增補欄位 Questionnaire 之 canonical，例如 https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-061"
* status = #completed
* subject 1..1 MS
* subject only Reference(PatientNIDRS or PatientNIDRSDengueBulk)
* item 1..* MS
* item.linkId MS
* item.linkId ^short = "答題編號(KEY，200字)"
* item.linkId ^maxLength = 200
* item.answer MS
* item.answer.value[x] only boolean or string or date or integer or decimal
* item.answer.value[x] ^short = "答案值(VALUE，200字)：勾選→valueBoolean=true；文字/代碼→valueString；日期→valueDate；數字→valueInteger/valueDecimal"
