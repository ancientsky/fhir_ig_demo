// ============================================================
// 訊息表頭(MessageHeader)
// ============================================================

RuleSet: MessageHeaderNIDRSRules(event)
* ^version = "0.1.0"
* eventCoding 1..1 MS
* eventCoding = CDCMessageEvent#{event}
* source MS
* source.endpoint MS
* source.endpoint ^short = "傳送端 Web API 端點"
* destination MS
* destination.endpoint ^short = "接收端 Web API 端點"

RuleSet: MessageHeaderNIDRSRequestRules(event)
* insert MessageHeaderNIDRSRules({event})
* sender 1..1 MS
* sender only Reference(OrganizationNIDRSHospital)
* sender ^short = "通報單位(醫事機構)"
* focus 1..* MS

Profile: MessageHeaderNIDRSReportCreate
Parent: TWCoreMessageHeader
Id: MessageHeader-nidrs-report-create
Title: "通報單新增訊息-MessageHeader NIDRS Report Create"
Description: "此通報單新增訊息-MessageHeader NIDRS Report Create Profile說明本IG如何進一步定義臺灣核心-訊息表頭(TW Core MessageHeader) Profile以呈現通報單新增作業(EMRMsg01)。"
* insert MessageHeaderNIDRSRequestRules(EMRMsg01)
* focus 1..10
* focus only Reference(CompositionNIDRSReport or CompositionNIDRSReportDengueBulk)
* focus ^short = "傳染病個案通報單，一次最多 10 筆"

Profile: MessageHeaderNIDRSReportUpdate
Parent: TWCoreMessageHeader
Id: MessageHeader-nidrs-report-update
Title: "通報單修改訊息-MessageHeader NIDRS Report Update"
Description: "此通報單修改訊息-MessageHeader NIDRS Report Update Profile說明本IG如何進一步定義臺灣核心-訊息表頭(TW Core MessageHeader) Profile以呈現通報單修改作業(EMRMsg02)。"
* insert MessageHeaderNIDRSRequestRules(EMRMsg02)
* focus 1..1
* focus only Reference(CompositionNIDRSReportUpdate)
* focus ^short = "傳染病個案通報單(修改)，一次可以修改一筆通報單"

Profile: MessageHeaderNIDRSDocument
Parent: TWCoreMessageHeader
Id: MessageHeader-nidrs-document
Title: "通報單病歷資料傳送訊息-MessageHeader NIDRS Document"
Description: "此通報單病歷資料傳送訊息-MessageHeader NIDRS Document Profile說明本IG如何進一步定義臺灣核心-訊息表頭(TW Core MessageHeader) Profile以呈現通報單病歷資料傳送作業(EMRMsg03)。"
* insert MessageHeaderNIDRSRequestRules(EMRMsg03)
* focus 1..1
* focus only Reference(DocumentReferenceNIDRS)

Profile: MessageHeaderNIDRSSample
Parent: TWCoreMessageHeader
Id: MessageHeader-nidrs-sample
Title: "通報單送驗新增訊息-MessageHeader NIDRS Sample"
Description: "此通報單送驗新增訊息-MessageHeader NIDRS Sample Profile說明本IG如何進一步定義臺灣核心-訊息表頭(TW Core MessageHeader) Profile以呈現通報單送驗新增作業(EMRMsg04)。"
* insert MessageHeaderNIDRSRequestRules(EMRMsg04)
* focus 1..1
* focus only Reference(ServiceRequestNIDRSSample or ServiceRequestNIDRSTBSample)

Profile: MessageHeaderNIDRSResponse
Parent: TWCoreMessageHeader
Id: MessageHeader-nidrs-response
Title: "疾管署回覆訊息-MessageHeader NIDRS Response"
Description: "此疾管署回覆訊息-MessageHeader NIDRS Response Profile說明本IG如何進一步定義臺灣核心-訊息表頭(TW Core MessageHeader) Profile以呈現疾管署回覆通報單位之處理結果(HISMsg01~HISMsg04)。"
* ^version = "0.1.0"
* eventCoding 1..1 MS
* eventCoding from CDCMessageEvent (required)
* eventCoding ^short = "回覆之訊息事件：HISMsg01(新增)、HISMsg02(修改)、HISMsg03(病歷資料)、HISMsg04(送驗)"
* source MS
* source.endpoint MS
* response 1..1 MS
* response.identifier MS
* response.identifier ^short = "所回覆請求訊息之 MessageHeader.id"
* response.code MS
* response.code ^short = "處理狀態(STATUS / Success)：全部成功→ok；任一通報單失敗→fatal-error。HISMsg01 之各 REPORT_RESULT 個別結果：成功者以 Condition(通報單號)、失敗者以各自之 OperationOutcome(issue.expression 指向請求之 entry)表達"
* response.details MS
* response.details only Reference(OperationOutcomeNIDRS)
* response.details ^short = "失敗時之錯誤清單(ERROR_LIST)"
* focus MS
* focus ^short = "成功時之通報單清單(REPORT_LIST)或送驗清單(ReturnData)"
* obeys nidrs-msg-1

Invariant: nidrs-msg-1
Description: "處理失敗(response.code 非 ok)時，須提供錯誤清單(response.details)。"
Severity: #error
Expression: "response.code != 'ok' implies response.details.exists()"

Profile: MessageHeaderNIDRSPushDetermineResult
Parent: TWCoreMessageHeader
Id: MessageHeader-nidrs-push-determine-result
Title: "研判結果主動通知訊息-MessageHeader NIDRS Push Determine Result"
Description: "此研判結果主動通知訊息-MessageHeader NIDRS Push Determine Result Profile說明本IG如何進一步定義臺灣核心-訊息表頭(TW Core MessageHeader) Profile以呈現疾管署主動回饋個案研判結果至通報單位(PushDetermineResult)。"
* insert MessageHeaderNIDRSRules(PushDetermineResult)
* destination 1..* MS
* focus 1..1 MS
* focus only Reference(ConditionNIDRSDetermineResult)

Profile: MessageHeaderNIDRSPushSampleResult
Parent: TWCoreMessageHeader
Id: MessageHeader-nidrs-push-sample-result
Title: "檢驗結果主動通知訊息-MessageHeader NIDRS Push Sample Result"
Description: "此檢驗結果主動通知訊息-MessageHeader NIDRS Push Sample Result Profile說明本IG如何進一步定義臺灣核心-訊息表頭(TW Core MessageHeader) Profile以呈現疾管署主動回饋個案檢驗結果至通報單位(PushSampleResult)。"
* insert MessageHeaderNIDRSRules(PushSampleResult)
* destination 1..* MS
* focus 1..1 MS
* focus only Reference(DiagnosticReportNIDRSSampleResult)

// ============================================================
// 訊息(Bundle)
// ============================================================

RuleSet: BundleNIDRSRules
* ^version = "0.1.0"
* type = #message
* identifier 1..1 MS
* identifier ^short = "訊息唯一識別碼：醫事機構代碼(10碼) + 月日時分秒毫秒(13碼) = 23碼(同 TWIDIR 規則)"
* identifier.system 1..1
* identifier.system = $CDCBundleId
* identifier.value 1..1
* timestamp 1..1 MS
* entry MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = false

Profile: BundleNIDRSReportCreate
Parent: TWCoreBundle
Id: Bundle-nidrs-report-create
Title: "通報單新增-Bundle NIDRS Report Create (EMRMsg01)"
Description: "此通報單新增-Bundle NIDRS Report Create Profile說明本IG如何進一步定義臺灣核心-資料交換基本單位(TW Core Bundle) Profile以呈現通報單新增作業傳送資料結構(EMRMsg01)：可一次通報多筆個案(最多10筆)，同一個案一次最多通報10個法定傳染病。"
* insert BundleNIDRSRules
* entry contains
    messageHeader 1..1 MS and
    composition 1..10 MS and
    patient 1..10 MS and
    condition 1..* MS and
    organization 1..* MS and
    practitioner 1..* MS and
    practitionerRole 1..* MS and
    encounter 0..* MS and
    observation 0..* MS and
    questionnaireResponse 0..* MS and
    relatedPerson 0..* MS
* obeys nidrs-bun-1 and nidrs-bun-2
* insert BundleReportEntries(MessageHeaderNIDRSReportCreate, CompositionNIDRSReport or CompositionNIDRSReportDengueBulk, PatientNIDRS or PatientNIDRSDengueBulk, ConditionNIDRS or ConditionNIDRSDengueBulk)

Profile: BundleNIDRSReportUpdate
Parent: TWCoreBundle
Id: Bundle-nidrs-report-update
Title: "通報單修改-Bundle NIDRS Report Update (EMRMsg02)"
Description: "此通報單修改-Bundle NIDRS Report Update Profile說明本IG如何進一步定義臺灣核心-資料交換基本單位(TW Core Bundle) Profile以呈現通報單修改作業傳送資料結構(EMRMsg02)：一次可以修改一筆通報單。"
* insert BundleNIDRSRules
* entry contains
    messageHeader 1..1 MS and
    composition 1..1 MS and
    patient 1..1 MS and
    condition 1..1 MS and
    organization 1..* MS and
    practitioner 1..* MS and
    practitionerRole 1..* MS and
    encounter 0..1 MS and
    observation 0..* MS and
    questionnaireResponse 0..* MS and
    relatedPerson 0..1 MS
* obeys nidrs-bun-1 and nidrs-bun-2
* insert BundleReportEntries(MessageHeaderNIDRSReportUpdate, CompositionNIDRSReportUpdate, PatientNIDRS, ConditionNIDRSUpdate)

Invariant: nidrs-bun-1
Description: "每一筆通報單(Composition)皆須填寫旅遊史有無(HAS_TRAVEL_HISTORY，1..1)。"
Severity: #error
Expression: "entry.resource.ofType(Observation).where(code.coding.where(code='HAS_TRAVEL_HISTORY').exists()).count() >= entry.resource.ofType(Composition).count()"

Invariant: nidrs-bun-2
Description: "MessageHeader 須為 Bundle 之第一筆 entry。"
Severity: #error
Expression: "entry.first().resource.ofType(MessageHeader).exists()"

RuleSet: BundleReportEntries(mh, comp, pat, cond)
* entry[messageHeader] ^short = "訊息表頭，須為第一筆 entry"
* entry[messageHeader].resource only {mh}
* entry[composition] ^short = "傳染病個案通報單(REPORT)"
* entry[composition].resource only {comp}
* entry[patient] ^short = "通報個案"
* entry[patient].resource only {pat}
* entry[condition] ^short = "通報疾病"
* entry[condition].resource only {cond}
* entry[organization] ^short = "通報單位、轉至院所"
* entry[organization].resource only OrganizationNIDRSHospital
* entry[practitioner] ^short = "通報單登錄者、診斷醫師"
* entry[practitioner].resource only PractitionerNIDRS
* entry[practitionerRole] ^short = "通報者角色(登錄者、通報單位、通報者聯絡電話)"
* entry[practitionerRole].resource only PractitionerRoleNIDRSReporter
* entry[encounter] ^short = "病患動向"
* entry[encounter].resource only EncounterNIDRS
* entry[observation] ^short = "流行病學資料、死亡原因"
* entry[observation].resource only ObservationNIDRSOccupation or ObservationNIDRSEpiFlag or ObservationNIDRSTravel or ObservationNIDRSAnimal or ObservationNIDRSDenseInstitution or ObservationNIDRSCauseOfDeath
* entry[questionnaireResponse] ^short = "疾病增補欄位"
* entry[questionnaireResponse].resource only QuestionnaireResponseNIDRS
* entry[relatedPerson] ^short = "個案生母"
* entry[relatedPerson].resource only RelatedPersonNIDRSMother

Profile: BundleNIDRSDocument
Parent: TWCoreBundle
Id: Bundle-nidrs-document
Title: "通報單病歷資料傳送-Bundle NIDRS Document (EMRMsg03)"
Description: "此通報單病歷資料傳送-Bundle NIDRS Document Profile說明本IG如何進一步定義臺灣核心-資料交換基本單位(TW Core Bundle) Profile以呈現通報單病歷資料傳送作業傳送資料結構(EMRMsg03)。"
* insert BundleNIDRSRules
* entry contains
    messageHeader 1..1 MS and
    documentReference 1..1 MS and
    organization 1..1 MS
* entry[messageHeader].resource only MessageHeaderNIDRSDocument
* entry[documentReference] ^short = "病歷檔案"
* entry[documentReference].resource only DocumentReferenceNIDRS
* entry[organization] ^short = "通報醫院"
* entry[organization].resource only OrganizationNIDRSHospital

Profile: BundleNIDRSSample
Parent: TWCoreBundle
Id: Bundle-nidrs-sample
Title: "通報單送驗新增-Bundle NIDRS Sample (EMRMsg04)"
Description: "此通報單送驗新增-Bundle NIDRS Sample Profile說明本IG如何進一步定義臺灣核心-資料交換基本單位(TW Core Bundle) Profile以呈現通報單送驗新增作業傳送資料結構(EMRMsg04)，包含法傳送驗單(SAMPLE)或法傳TB送驗單(TB_SAMPLE)。"
* insert BundleNIDRSRules
* entry contains
    messageHeader 1..1 MS and
    serviceRequest 1..1 MS and
    specimen 1..1 MS and
    patient 0..1 MS and
    organization 2..* MS and
    practitioner 1..1 MS and
    practitionerRole 1..1 MS
* obeys nidrs-bun-2 and nidrs-bun-3
* entry[messageHeader].resource only MessageHeaderNIDRSSample
* entry[serviceRequest] ^short = "送驗單(SAMPLE 或 TB_SAMPLE)"
* entry[serviceRequest].resource only ServiceRequestNIDRSSample or ServiceRequestNIDRSTBSample
* entry[specimen] ^short = "檢體"
* entry[specimen].resource only SpecimenNIDRS or SpecimenNIDRSTB
* entry[patient] ^short = "送驗個案；法傳TB送驗單(TB_SAMPLE)必填。法傳送驗單(SAMPLE)原規格無個案資料，ServiceRequest/Specimen.subject 可僅以個案證號(identifier)參照"
* entry[patient].resource only PatientNIDRS or PatientNIDRSTBSample
* entry[organization] ^short = "送驗單位與指定收件單位"
* entry[organization].resource only OrganizationNIDRSHospital or OrganizationNIDRSLab
* entry[practitioner] ^short = "送驗人員"
* entry[practitioner].resource only PractitionerNIDRS
* entry[practitionerRole] ^short = "送驗人員角色(送驗人員與送驗單位)"
* entry[practitionerRole].resource only PractitionerRoleNIDRS

Invariant: nidrs-bun-3
Description: "法傳TB送驗單(TB_SAMPLE)須包含送驗個案(Patient)。"
Severity: #error
Expression: "entry.resource.ofType(ServiceRequest).where(reasonCode.coding.code='010' and orderDetail.exists()).exists() implies entry.resource.ofType(Patient).exists()"

Profile: BundleNIDRSResponse
Parent: TWCoreBundle
Id: Bundle-nidrs-response
Title: "疾管署回覆-Bundle NIDRS Response (HISMsg01~04)"
Description: "此疾管署回覆-Bundle NIDRS Response Profile說明本IG如何進一步定義臺灣核心-資料交換基本單位(TW Core Bundle) Profile以呈現疾管署回覆通報單位之回應資料結構(HISMsg01~HISMsg04)：處理狀態與處理日期以 MessageHeader 及 Bundle.timestamp 表達；成功時之通報單清單(REPORT_LIST)以 Condition 表達、送驗清單(ReturnData)以 ServiceRequest/Specimen 表達；失敗時之錯誤清單(ERROR_LIST)以 OperationOutcome 表達。"
* insert BundleNIDRSRules
* identifier.system = $CDCBundleId
* timestamp ^short = "處理日期(RESULT_TIME)"
* entry contains
    messageHeader 1..1 MS and
    operationOutcome 0..* MS and
    condition 0..* MS and
    serviceRequest 0..1 MS and
    specimen 0..1 MS
* entry[messageHeader].resource only MessageHeaderNIDRSResponse
* entry[operationOutcome] ^short = "錯誤清單(ERROR_LIST)；每一通報單之處理結果一筆"
* entry[operationOutcome].resource only OperationOutcomeNIDRS
* entry[condition] ^short = "成功時，通報單清單(REPORT_LIST：REPORT_ID、DISEASE_ID、IDNO)"
* entry[condition].resource only ConditionNIDRSCaseRef
* entry[serviceRequest] ^short = "送驗新增成功時之送驗單(ReturnData.SAMPLE)；requester/performer 以 contained 或 identifier 參照，subject 以個案證號(identifier)參照"
* entry[serviceRequest].resource only ServiceRequestNIDRSSample or ServiceRequestNIDRSTBSample
* entry[specimen] ^short = "送驗新增成功時之檢體(ReturnData.SAMPLE)"
* entry[specimen].resource only SpecimenNIDRS or SpecimenNIDRSTB

Profile: BundleNIDRSPushDetermineResult
Parent: TWCoreBundle
Id: Bundle-nidrs-push-determine-result
Title: "研判結果主動通知-Bundle NIDRS Push Determine Result"
Description: "此研判結果主動通知-Bundle NIDRS Push Determine Result Profile說明本IG如何進一步定義臺灣核心-資料交換基本單位(TW Core Bundle) Profile以呈現疾管署主動回饋個案研判結果至通報單位(PushDetermineResult)。"
* insert BundleNIDRSRules
* entry contains
    messageHeader 1..1 MS and
    condition 1..1 MS
* entry[messageHeader].resource only MessageHeaderNIDRSPushDetermineResult
* entry[condition].resource only ConditionNIDRSDetermineResult

Profile: BundleNIDRSPushSampleResult
Parent: TWCoreBundle
Id: Bundle-nidrs-push-sample-result
Title: "檢驗結果主動通知-Bundle NIDRS Push Sample Result"
Description: "此檢驗結果主動通知-Bundle NIDRS Push Sample Result Profile說明本IG如何進一步定義臺灣核心-資料交換基本單位(TW Core Bundle) Profile以呈現疾管署主動回饋個案檢驗結果至通報單位(PushSampleResult)。"
* insert BundleNIDRSRules
* entry contains
    messageHeader 1..1 MS and
    diagnosticReport 1..1 MS and
    observation 0..* MS
* entry[messageHeader].resource only MessageHeaderNIDRSPushSampleResult
* entry[diagnosticReport].resource only DiagnosticReportNIDRSSampleResult
* entry[observation] ^short = "血清學檢驗結果與病原體檢驗結果"
* entry[observation].resource only ObservationNIDRSAntibodyResult or ObservationNIDRSPathogenResult
