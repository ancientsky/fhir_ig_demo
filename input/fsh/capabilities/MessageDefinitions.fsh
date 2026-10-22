// ============================================================
// 訊息定義(MessageDefinition)
// 供能力聲明(CapabilityStatement.messaging.supportedMessage.definition)引用。
// 依據：NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書 V1.42 表1「傳送機制主要功能表」。
// ============================================================

RuleSet: NIDRSMessageDefinitionCommon(id, name, event)
* url = "https://ancientsky.github.io/fhir_ig_demo/MessageDefinition/{id}"
* version = "0.1.0"
* name = "{name}"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* contact.name = "fhir_ig_demo（非官方示範）"
* contact.telecom.system = #url
* contact.telecom.value = "https://github.com/ancientsky/fhir_ig_demo"
* jurisdiction = urn:iso:std:iso:3166#TW
* eventCoding = CDCMessageEvent#{event}

// ---------------- 通報單位 → 疾管署 ----------------

Instance: nidrs-emrmsg01
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單新增訊息定義(EMRMsg01)"
* insert NIDRSMessageDefinitionCommon(nidrs-emrmsg01, NIDRSEMRMsg01, EMRMsg01)
* title = "通報單新增訊息定義(EMRMsg01)"
* description = "通報單位傳送通報單新增資訊至疾管署傳染病自動通報系統。訊息 Bundle 須符合 [Bundle-nidrs-report-create](StructureDefinition-Bundle-nidrs-report-create.html)，MessageHeader 須符合 [MessageHeader-nidrs-report-create](StructureDefinition-MessageHeader-nidrs-report-create.html)；可一次通報多筆個案(最多10筆)。疾管署以 HISMsg01 回覆處理結果。"
* purpose = "法定傳染病個案電子病歷自動通報(通報單新增)。"
* category = #consequence
* focus[0].code = #Composition
* focus[=].profile = Canonical(CompositionNIDRSReport)
* focus[=].min = 0
* focus[=].max = "10"
* focus[+].code = #Composition
* focus[=].profile = Canonical(CompositionNIDRSReportDengueBulk)
* focus[=].min = 0
* focus[=].max = "10"
* responseRequired = #always
* allowedResponse.message = Canonical(nidrs-hismsg01)
* allowedResponse.situation = "疾管署完成驗章、JSON語意邏輯檢查及通報單登錄後回覆通報單電腦編號；驗章或檢核失敗時回覆錯誤清單。"

Instance: nidrs-emrmsg02
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單修改訊息定義(EMRMsg02)"
* insert NIDRSMessageDefinitionCommon(nidrs-emrmsg02, NIDRSEMRMsg02, EMRMsg02)
* title = "通報單修改訊息定義(EMRMsg02)"
* description = "通報單位傳送通報單修改資訊至疾管署傳染病自動通報系統。訊息 Bundle 須符合 [Bundle-nidrs-report-update](StructureDefinition-Bundle-nidrs-report-update.html)，MessageHeader 須符合 [MessageHeader-nidrs-report-update](StructureDefinition-MessageHeader-nidrs-report-update.html)；一次可以修改一筆通報單。疾管署以 HISMsg02 回覆處理結果。"
* purpose = "法定傳染病個案電子病歷自動通報(通報單修改)。"
* category = #consequence
* focus.code = #Composition
* focus.profile = Canonical(CompositionNIDRSReportUpdate)
* focus.min = 1
* focus.max = "1"
* responseRequired = #always
* allowedResponse.message = Canonical(nidrs-hismsg02)
* allowedResponse.situation = "疾管署完成驗章、JSON語意邏輯檢查及是否允許EMR修改之檢查後回覆處理結果。"

Instance: nidrs-emrmsg03
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單病歷資料傳送訊息定義(EMRMsg03)"
* insert NIDRSMessageDefinitionCommon(nidrs-emrmsg03, NIDRSEMRMsg03, EMRMsg03)
* title = "通報單病歷資料傳送訊息定義(EMRMsg03)"
* description = "通報單位傳送病歷資料或檔案至疾管署傳染病自動通報系統。訊息 Bundle 須符合 [Bundle-nidrs-document](StructureDefinition-Bundle-nidrs-document.html)，MessageHeader 須符合 [MessageHeader-nidrs-document](StructureDefinition-MessageHeader-nidrs-document.html)。疾管署以 HISMsg03 回覆處理結果。"
* purpose = "法定傳染病通報個案病歷資料上傳。"
* category = #consequence
* focus.code = #DocumentReference
* focus.profile = Canonical(DocumentReferenceNIDRS)
* focus.min = 1
* focus.max = "1"
* responseRequired = #always
* allowedResponse.message = Canonical(nidrs-hismsg03)
* allowedResponse.situation = "疾管署完成驗章、JSON語意邏輯檢查及病歷資料儲存後回覆處理結果。"

Instance: nidrs-emrmsg04
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單送驗新增訊息定義(EMRMsg04)"
* insert NIDRSMessageDefinitionCommon(nidrs-emrmsg04, NIDRSEMRMsg04, EMRMsg04)
* title = "通報單送驗新增訊息定義(EMRMsg04)"
* description = "通報單位傳送送驗單(需含通報單電腦編號)至疾管署傳染病自動通報系統。訊息 Bundle 須符合 [Bundle-nidrs-sample](StructureDefinition-Bundle-nidrs-sample.html)，MessageHeader 須符合 [MessageHeader-nidrs-sample](StructureDefinition-MessageHeader-nidrs-sample.html)。疾管署將送驗資料轉至實驗室資訊管理系統處理後，以 HISMsg04 回覆處理結果。"
* purpose = "法定傳染病通報個案送驗(法傳送驗單 SAMPLE 或法傳TB送驗單 TB_SAMPLE)。"
* category = #consequence
* focus[0].code = #ServiceRequest
* focus[=].profile = Canonical(ServiceRequestNIDRSSample)
* focus[=].min = 0
* focus[=].max = "1"
* focus[+].code = #ServiceRequest
* focus[=].profile = Canonical(ServiceRequestNIDRSTBSample)
* focus[=].min = 0
* focus[=].max = "1"
* responseRequired = #always
* allowedResponse.message = Canonical(nidrs-hismsg04)
* allowedResponse.situation = "實驗室資訊管理系統回覆送驗單處理結果後，疾管署回覆送驗清單(ReturnData)；失敗時回覆錯誤清單。"

// ---------------- 疾管署 → 通報單位(回覆) ----------------

RuleSet: NIDRSResponseMessageDefinition(id, name, event, request)
* insert NIDRSMessageDefinitionCommon({id}, {name}, {event})
* purpose = "疾管署回覆通報單位 {request} 訊息之處理結果。"
* category = #consequence
* responseRequired = #never

Instance: nidrs-hismsg01
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單新增結果訊息定義(HISMsg01)"
* insert NIDRSResponseMessageDefinition(nidrs-hismsg01, NIDRSHISMsg01, HISMsg01, EMRMsg01)
* title = "通報單新增結果訊息定義(HISMsg01)"
* description = "疾管署回覆通報單新增(EMRMsg01)處理結果。訊息 Bundle 須符合 [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)，MessageHeader 須符合 [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html)；成功時以 Condition 回覆通報單清單(REPORT_LIST，含通報單電腦編號)，失敗時以 OperationOutcome 回覆錯誤清單(ERROR_LIST)。"
* focus.code = #Condition
* focus.profile = Canonical(ConditionNIDRSCaseRef)
* focus.min = 0
* focus.max = "*"

Instance: nidrs-hismsg02
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單修改結果訊息定義(HISMsg02)"
* insert NIDRSResponseMessageDefinition(nidrs-hismsg02, NIDRSHISMsg02, HISMsg02, EMRMsg02)
* title = "通報單修改結果訊息定義(HISMsg02)"
* description = "疾管署回覆通報單修改(EMRMsg02)處理結果。訊息 Bundle 須符合 [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)，MessageHeader 須符合 [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html)；失敗時以 OperationOutcome 回覆錯誤清單(ERROR_LIST)。"
* focus.code = #Condition
* focus.profile = Canonical(ConditionNIDRSCaseRef)
* focus.min = 0
* focus.max = "1"

Instance: nidrs-hismsg03
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單病歷資料傳送結果訊息定義(HISMsg03)"
* insert NIDRSResponseMessageDefinition(nidrs-hismsg03, NIDRSHISMsg03, HISMsg03, EMRMsg03)
* title = "通報單病歷資料傳送結果訊息定義(HISMsg03)"
* description = "疾管署回覆通報單病歷資料傳送(EMRMsg03)處理結果。訊息 Bundle 須符合 [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)，MessageHeader 須符合 [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html)；失敗時以 OperationOutcome 回覆錯誤清單(ERROR_LIST)。"

Instance: nidrs-hismsg04
InstanceOf: MessageDefinition
Usage: #definition
Title: "通報單送驗新增結果訊息定義(HISMsg04)"
* insert NIDRSResponseMessageDefinition(nidrs-hismsg04, NIDRSHISMsg04, HISMsg04, EMRMsg04)
* title = "通報單送驗新增結果訊息定義(HISMsg04)"
* description = "疾管署回覆通報單送驗新增(EMRMsg04)處理結果。訊息 Bundle 須符合 [Bundle-nidrs-response](StructureDefinition-Bundle-nidrs-response.html)，MessageHeader 須符合 [MessageHeader-nidrs-response](StructureDefinition-MessageHeader-nidrs-response.html)；成功時以 ServiceRequest/Specimen 回覆送驗清單(ReturnData)，失敗時以 OperationOutcome 回覆錯誤清單(ERROR_LIST)。"
* focus[0].code = #ServiceRequest
* focus[=].profile = Canonical(ServiceRequestNIDRSSample)
* focus[=].min = 0
* focus[=].max = "*"
* focus[+].code = #ServiceRequest
* focus[=].profile = Canonical(ServiceRequestNIDRSTBSample)
* focus[=].min = 0
* focus[=].max = "*"

// ---------------- 疾管署 → 通報單位(主動通知) ----------------

Instance: nidrs-push-determine-result
InstanceOf: MessageDefinition
Usage: #definition
Title: "研判結果主動通知訊息定義(PushDetermineResult)"
* insert NIDRSMessageDefinitionCommon(nidrs-push-determine-result, NIDRSPushDetermineResult, PushDetermineResult)
* title = "研判結果主動通知訊息定義(PushDetermineResult)"
* description = "通報單研判結果有異動時，疾管署主動通知通報醫療院所(原 Web Service：PushDetermineResult，傳送參數 ReportDetermineResult)。訊息 Bundle 須符合 [Bundle-nidrs-push-determine-result](StructureDefinition-Bundle-nidrs-push-determine-result.html)，MessageHeader 須符合 [MessageHeader-nidrs-push-determine-result](StructureDefinition-MessageHeader-nidrs-push-determine-result.html)。原規格回傳值為 Boolean(True=成功，False=失敗)，本 IG 以 HTTP 狀態碼表達成功，失敗時回傳 OperationOutcome。"
* purpose = "疾管署主動回饋個案研判結果至通報單位。"
* category = #notification
* focus.code = #Condition
* focus.profile = Canonical(ConditionNIDRSDetermineResult)
* focus.min = 1
* focus.max = "1"
* responseRequired = #on-error

Instance: nidrs-push-sample-result
InstanceOf: MessageDefinition
Usage: #definition
Title: "檢驗結果主動通知訊息定義(PushSampleResult)"
* insert NIDRSMessageDefinitionCommon(nidrs-push-sample-result, NIDRSPushSampleResult, PushSampleResult)
* title = "檢驗結果主動通知訊息定義(PushSampleResult)"
* description = "通報單之送驗單檢驗結果有異動時，疾管署主動通知通報醫療院所(原 Web Service：PushSampleResult，傳送參數 SampleResult)。訊息 Bundle 須符合 [Bundle-nidrs-push-sample-result](StructureDefinition-Bundle-nidrs-push-sample-result.html)，MessageHeader 須符合 [MessageHeader-nidrs-push-sample-result](StructureDefinition-MessageHeader-nidrs-push-sample-result.html)。原規格回傳值為 Boolean(True=成功，False=失敗)，本 IG 以 HTTP 狀態碼表達成功，失敗時回傳 OperationOutcome。"
* purpose = "疾管署主動回饋個案檢驗結果至通報單位。"
* category = #notification
* focus.code = #DiagnosticReport
* focus.profile = Canonical(DiagnosticReportNIDRSSampleResult)
* focus.min = 1
* focus.max = "1"
* responseRequired = #on-error
