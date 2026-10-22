// ============================================================
// 病歷資料上傳(DocumentReference) - EMRMsg03
// ============================================================

Profile: DocumentReferenceNIDRS
Parent: TWCoreDocumentReference
Id: DocumentReference-nidrs
Title: "通報單病歷資料-DocumentReference NIDRS"
Description: "此通報單病歷資料-DocumentReference NIDRS Profile說明本IG如何進一步定義臺灣核心-文件參照(TW Core DocumentReference) Profile以呈現通報單病歷資料傳送作業(EMRMsg03)之病歷檔案。"
* ^version = "0.1.0"
* status = #current
* category 1..1 MS
* category from CDCFileCategory (required)
* category ^short = "檔案類別(FILE_CATEGORY)：1 出院病摘、2 門診病歷、3 檢驗報告、4 醫療影像及報告、0 其他"
* type MS
* type ^short = "LOINC 文件類型：出院病摘 18842-5、門診病歷 34108-1、檢驗報告 11502-2、醫療影像及報告 18748-4(ConceptMap cdc-file-category-to-loinc)；其他類別可不填"
* subject MS
* subject ^short = "通報個案；原規格未傳送個案資料，請以個案證號(identifier)參照"
* custodian 1..1 MS
* custodian only Reference(OrganizationNIDRSHospital)
* custodian ^short = "通報醫院醫事機構代碼(HOSPITAL)"
* context 1..1 MS
* context.related 1..1 MS
* context.related only Reference(ConditionNIDRSCaseRef)
* context.related ^short = "通報單號(REPORT_ID)；以 identifier 參照通報疾病"
* content 1..1 MS
* content.attachment.contentType 1..1 MS
* content.attachment.contentType from NIDRSFileMimeType (required)
* content.attachment.contentType ^short = "檔案類型(FILE_TYPE)：1 docx、2 pdf、3 odt"
* content.attachment.data 1..1 MS
* content.attachment.data ^short = "病歷資料(ANAMNESIS)，以 base64 編碼"
* content.attachment.title 1..1 MS
* content.attachment.title ^short = "病歷檔案名稱(FILE_NAME)"
* content.attachment.title ^maxLength = 255

// ============================================================
// 通報疾病參照(Condition) - 回應與研判結果
// ============================================================

Profile: ConditionNIDRSCaseRef
Parent: TWCoreCondition
Id: Condition-nidrs-case-ref
Title: "通報單參照-Condition NIDRS Case Reference"
Description: "此通報單參照-Condition NIDRS Case Reference Profile說明本IG如何以最少欄位之 Condition 表達一筆已成立之通報單：通報單號(REPORT_ID)、通報疾病(DISEASE_ID)及個案證號(IDNO)。用於通報結果回覆(HISMsg01/HISMsg02 REPORT_LIST)及研判結果主動通知。"
* ^version = "0.1.0"
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains reportId 1..1 MS
* identifier[reportId] ^short = "通報單號(REPORT_ID，13碼)"
* identifier[reportId].type = CDCIdentifierType#nidrs-report
* identifier[reportId].system = $NIDRSReportId
* identifier[reportId].value 1..1
* identifier[reportId].value ^maxLength = 13
* clinicalStatus = $condition-clinical#active
* category = $condition-category#encounter-diagnosis
* code 1..1 MS
* code from CDCDisease (required)
* code ^short = "通報疾病代碼(DISEASE_ID)"
* subject MS
* subject.identifier 1..1 MS
* subject.identifier ^short = "個案證號(IDNO)"

Profile: ConditionNIDRSDetermineResult
Parent: ConditionNIDRSCaseRef
Id: Condition-nidrs-determine-result
Title: "研判結果-Condition NIDRS Determine Result"
Description: "此研判結果-Condition NIDRS Determine Result Profile說明疾管署主動回饋個案研判結果(PushDetermineResult / ReportDetermineResult)時之通報疾病研判資訊。"
* ^version = "0.1.0"
* extension contains
    NIDRSDetermineResult named determineResult 1..1 MS and
    NIDRSPHBReceivedDate named phbReceivedDate 0..1 MS and
    NIDRSCDCReceivedDate named cdcReceivedDate 0..1 MS
* extension[determineResult] ^short = "研判結果代碼(DetermineStatus)與研判時間(DetermineDate)"
* extension[phbReceivedDate] ^short = "衛生局收到日(PHB_RECEIVED_DAY)"
* extension[cdcReceivedDate] ^short = "建檔日(CDC_RECEIVED_DATE)"
* verificationStatus MS
* verificationStatus ^short = "依研判結果對應：確定病例(30)→confirmed、不符合疾病分類(31)→refuted，其餘→provisional"

// ============================================================
// 送驗(ServiceRequest / Specimen) - EMRMsg04
// ============================================================

RuleSet: ServiceRequestNIDRSRules(specimenProfile, patientProfile)
* ^version = "0.1.0"
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains barcode 0..1 MS
* identifier[barcode] ^short = "送驗單編號(BarCode)：疾管署所發放 bar-code(XX-XXX-XXXXXX 共13碼)；未填者於送驗單新增成功時由系統自動編號(15碼數字)"
* identifier[barcode].type = CDCIdentifierType#lims-barcode
* identifier[barcode].system = $LIMSBarcode
* identifier[barcode].value 1..1
* identifier[barcode].value ^maxLength = 20
* status = #active
* intent = #order
* code = $SCT#108252007 "Laboratory procedure"
* code ^short = "傳染病檢驗送驗"
* subject 1..1 MS
* subject only Reference({patientProfile})
* requester 1..1 MS
* requester only Reference(PractitionerRoleNIDRS)
* requester ^short = "送驗人員(REQUESTER)及送驗單位(SAMPLING_HOSPITAL)"
* performer 1..1 MS
* performer only Reference(OrganizationNIDRSLab)
* performer ^short = "指定收件單位(RECEIVED_UNIT_TYPE、RECEIVED_UNIT)"
* specimen 1..1 MS
* specimen only Reference({specimenProfile})
* note MS
* note ^short = "個案備註(COMMENTS，100字)"
* supportingInfo MS
* supportingInfo ^slicing.discriminator.type = #value
* supportingInfo ^slicing.discriminator.path = "identifier.system"
* supportingInfo ^slicing.rules = #open
* supportingInfo contains report 0..1 MS
* supportingInfo[report] only Reference(ConditionNIDRSCaseRef)
* supportingInfo[report] ^short = "法傳通報單號(Report/ReportID)；以 identifier 參照通報單"
* supportingInfo[report].identifier 1..1 MS
* supportingInfo[report].identifier.system = $NIDRSReportId
* authoredOn MS

Profile: ServiceRequestNIDRSSample
Parent: TWCoreServiceRequest
Id: ServiceRequest-nidrs-sample
Title: "法傳送驗單-ServiceRequest NIDRS Sample"
Description: "此法傳送驗單-ServiceRequest NIDRS Sample Profile說明本IG如何進一步定義臺灣核心-服務請求(TW Core ServiceRequest) Profile以呈現通報單送驗新增作業(EMRMsg04)之法傳送驗單(SAMPLE)。"
* insert ServiceRequestNIDRSRules(SpecimenNIDRS, PatientNIDRS)
* supportingInfo[report] 1..1
* reasonCode 1..* MS
* reasonCode from CDCTestDisease (required)
* reasonCode ^short = "送驗疾病代碼(DISEASE)，每個疾病一筆，不可重複"
* extension contains NIDRSDrugBeforeSampling named drugBeforeSampling 0..1 MS
* extension[drugBeforeSampling] ^short = "採檢前投藥情形(DRUG_BEFORE_SAMPLING)"
* authoredOn ^short = "送驗單建立日(回應之 CREATE_DAY)"

Profile: ServiceRequestNIDRSTBSample
Parent: TWCoreServiceRequest
Id: ServiceRequest-nidrs-tb-sample
Title: "法傳TB送驗單-ServiceRequest NIDRS TB Sample"
Description: "此法傳TB送驗單-ServiceRequest NIDRS TB Sample Profile說明本IG如何進一步定義臺灣核心-服務請求(TW Core ServiceRequest) Profile以呈現通報單送驗新增作業(EMRMsg04)之法傳TB送驗單(TB_SAMPLE)。非通報個案可不填法傳通報單號。"
* insert ServiceRequestNIDRSRules(SpecimenNIDRSTB, PatientNIDRSTBSample)
* reasonCode 1..1 MS
* reasonCode = CDCTestDisease#010
* orderDetail 1..* MS
* orderDetail from CDCTBTestItem (required)
* orderDetail ^short = "送驗項目(PHTESTITEM，可多選)；送驗項目其他說明(PHTESTITEM_OTHER_DESC)請填於 text"
* extension contains
    NIDRSXpertReason named xpertReason 0..1 MS and
    NIDRSTBMedicineUse named tbMedicineUse 0..1 MS
* extension[xpertReason] ^short = "疾管署分子快速檢測送驗原因(SampleReasonXPERT / SampleReasonXPERT_other)"
* extension[tbMedicineUse] ^short = "抗結核菌藥物(TB_MEDICINE_USE_ID)"
* authoredOn 1..1
* authoredOn ^short = "送驗日(PHPROVIDEDATE)；須在採檢日之後(或同日)"

RuleSet: SpecimenNIDRSRules(typeValueSet, patientProfile)
* ^version = "0.1.0"
* identifier MS
* identifier ^short = "院內檢體編號(HOSPITAL_SAMPLING_NO，20字)"
* identifier.system 1..1
* identifier.value 1..1
* identifier.value ^maxLength = 20
* subject MS
* subject only Reference({patientProfile})
* type 1..1 MS
* type from {typeValueSet} (required)
* type ^short = "檢體類別(SAMPLE_TYPE)；其他時請於 text 填寫其他檢體備註說明(SAMPLE_TYPE_OTHER，120字)。建議同時填寫 SNOMED CT 檢體編碼(ConceptMap cdc-specimen-type-to-snomed)"
* collection.collectedDateTime obeys nidrs-date-1
* collection 1..1 MS
* collection.collected[x] 1..1 MS
* collection.collected[x] only dateTime
* collection.collected[x] ^short = "檢體採檢日(SAMPLED_DAY)"

Profile: SpecimenNIDRS
Parent: TWCoreSpecimen
Id: Specimen-nidrs
Title: "送驗檢體-Specimen NIDRS"
Description: "此送驗檢體-Specimen NIDRS Profile說明本IG如何進一步定義臺灣核心-檢體(TW Core Specimen) Profile以呈現法傳送驗單之檢體資料；檢體類別與「屍體解剖」及「送驗疾病」三者須符合採檢手冊之定義(ConceptMap 送驗疾病與檢體類別之關聯)。"
* insert SpecimenNIDRSRules(CDCSpecimenType, PatientNIDRS)
* extension contains NIDRSAutopsy named autopsy 0..1 MS
* extension[autopsy] ^short = "屍體解剖(ISCORPSEDISSECTION)：false 否(預設值)、true 是"

Profile: SpecimenNIDRSTB
Parent: TWCoreSpecimen
Id: Specimen-nidrs-tb
Title: "TB送驗檢體-Specimen NIDRS TB"
Description: "此TB送驗檢體-Specimen NIDRS TB Profile說明本IG如何進一步定義臺灣核心-檢體(TW Core Specimen) Profile以呈現法傳TB送驗單之檢體資料(結核病檢體類別)。"
* insert SpecimenNIDRSRules(CDCTBSpecimenType, PatientNIDRSTBSample)

// ============================================================
// 檢驗結果主動通知(DiagnosticReport / Observation) - PushSampleResult
// ============================================================

Profile: DiagnosticReportNIDRSSampleResult
Parent: TWCoreDiagnosticReport
Id: DiagnosticReport-nidrs-sample-result
Title: "送驗單綜合檢驗結果-DiagnosticReport NIDRS Sample Result"
Description: "此送驗單綜合檢驗結果-DiagnosticReport NIDRS Sample Result Profile說明本IG如何進一步定義臺灣核心-診斷報告(TW Core DiagnosticReport) Profile以呈現疾管署主動回饋個案檢驗結果(PushSampleResult / SampleResult)。"
* ^version = "0.1.0"
* extension contains $workflow-reasonReference named report 1..1 MS
* extension[report] ^short = "通報單號(ReportId)；以 identifier 參照通報疾病"
* extension[report].valueReference only Reference(ConditionNIDRSCaseRef)
* extension[report].valueReference.identifier 1..1
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains barcode 1..1 MS
* identifier[barcode] ^short = "送驗單編號(SampleId)"
* identifier[barcode].type = CDCIdentifierType#lims-barcode
* identifier[barcode].system = $LIMSBarcode
* identifier[barcode].value 1..1
* basedOn 1..1 MS
* basedOn only Reference(ServiceRequestNIDRSSample or ServiceRequestNIDRSTBSample)
* basedOn.identifier 1..1
* basedOn ^short = "送驗單(以送驗單編號參照)"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code MS
* code.coding contains testDisease 1..1 MS
* code.coding[testDisease] from CDCTestDisease (required)
* code.coding[testDisease].system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-test-disease"
* code.coding[testDisease] ^short = "送驗疾病代碼(DiseaseId)；display 填送驗疾病中文名稱(DiseaseName)"
* subject ^short = "通報個案；原規格 SampleResult 無個案證號，疾管署依通報單號(ReportId)查得之個案證號以 identifier 參照"
* subject.identifier MS
* issued 1..1 MS
* issued ^short = "檢驗結果時間(ResultInformDay)"
* conclusionCode 1..1 MS
* conclusionCode ^short = "檢驗結果代碼(ResultId)與名稱(ResultName)，使用 TWIDIR CDC-LIMS系統-檢驗結果代碼"
* conclusionCode.coding.system = $TWIDIRTestResult
* result MS
* result only Reference(ObservationNIDRSAntibodyResult or ObservationNIDRSPathogenResult)
* result ^short = "血清學檢驗結果(SampleAntibodyResults)及病原體檢驗結果(SamplePathogenResults)"

RuleSet: ObservationNIDRSLabRules
* ^version = "0.1.0"
* status = #final
* identifier MS
* identifier ^short = "檢驗序號(SeqNo)"
* subject MS
* effective[x] only dateTime
* effective[x] ^short = "檢驗日期(ResultDay)"
* note MS
* note ^short = "檢驗結果備註(Comments)"
* interpretation MS
* interpretation ^short = "檢驗結果代碼與名稱(ResultId/ResultName)，使用 TWIDIR CDC-LIMS系統-檢驗結果代碼"
* interpretation.coding.system = $TWIDIRTestResult

Profile: ObservationNIDRSAntibodyResult
Parent: TWCoreObservationLaboratoryResult
Id: Observation-nidrs-antibody-result
Title: "血清學檢驗結果-Observation NIDRS Antibody Result"
Description: "此血清學檢驗結果-Observation NIDRS Antibody Result Profile說明本IG如何進一步定義臺灣核心-檢驗檢查(TW Core Observation Laboratory Result) Profile以呈現 SampleAntibodyResult。"
* insert ObservationNIDRSLabRules
* code ^short = "血清學檢驗方法代碼(AntibodyId)與名稱(AntibodyName)"
* code.coding.system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-antibody-method"
* interpretation 1..1
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    titer 0..1 MS and
    fourFoldRise 0..1 MS
* component[titer] ^short = "效價(Titer)"
* component[titer].code = CDCNIDRSObservation#TITER
* component[titer].value[x] only string
* component[fourFoldRise] ^short = "是否四倍上升(FourFoldRise)"
* component[fourFoldRise].code = CDCNIDRSObservation#FOUR_FOLD_RISE
* component[fourFoldRise].value[x] only boolean

Profile: ObservationNIDRSPathogenResult
Parent: TWCoreObservationLaboratoryResult
Id: Observation-nidrs-pathogen-result
Title: "病原體檢驗結果-Observation NIDRS Pathogen Result"
Description: "此病原體檢驗結果-Observation NIDRS Pathogen Result Profile說明本IG如何進一步定義臺灣核心-檢驗檢查(TW Core Observation Laboratory Result) Profile以呈現 SamplePathogenResult。"
* insert ObservationNIDRSLabRules
* code ^short = "病原體檢驗方法代碼(PathogenId)與名稱(PathogenName)"
* code from CDCPathogenMethod (extensible)
* code.coding.system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-pathogen-method"
* interpretation 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from CDCPathogen (required)
* valueCodeableConcept ^short = "病原體細類代碼(DetailId)，或僅有大類時填病原體大類代碼(MasterId)；建議同時填寫 SNOMED CT 生物體編碼(ConceptMap cdc-pathogen-to-snomed)"
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains subtype 0..1 MS
* component[subtype] ^short = "病原體次分型(SubTypeId/SubTypeName)"
* component[subtype].code = CDCNIDRSObservation#PATHOGEN_SUBTYPE
* component[subtype].value[x] only CodeableConcept

// ============================================================
// 系統回應訊息(OperationOutcome)
// ============================================================

Profile: OperationOutcomeNIDRS
Parent: OperationOutcome
Id: OperationOutcome-nidrs
Title: "處理結果-OperationOutcome NIDRS"
Description: "此處理結果-OperationOutcome NIDRS Profile說明本IG如何定義 OperationOutcome 以呈現疾管署回覆之錯誤清單(ERROR_LIST)。"
* ^version = "0.1.0"
* issue MS
* issue.severity MS
* issue.code MS
* issue.details 1..1 MS
* issue.details from CDCProcessingResult (extensible)
* issue.details ^short = "錯誤代碼(ERROR_Code，10碼)：{項目代碼(6碼)}{檢核代碼(4碼)}或特殊處理代碼"
* issue.diagnostics MS
* issue.diagnostics ^short = "錯誤訊息(ERROR_MESSAGE，2000字)"
* issue.expression MS
* issue.expression ^short = "錯誤所在之 Bundle entry(FHIRPath)，例如 Bundle.entry[1].resource"
