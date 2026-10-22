// ============================================================
// 能力聲明(CapabilityStatement)
// 風格參考：臺灣傳染病檢驗報告實作指引 TWIDIR (CapabilityStatementCDCTWIDIRServer)
// 依據：NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書 V1.42 第二章(系統架構)及第三章(功能流程)
// ============================================================

Alias: $cs-expectation = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation
Alias: $restful-security-service = http://terminology.hl7.org/CodeSystem/restful-security-service
Alias: $process-message = http://hl7.org/fhir/OperationDefinition/MessageHeader-process-message

RuleSet: NIDRSCapabilityCommon(id, name)
* url = "https://ancientsky.github.io/fhir_ig_demo/CapabilityStatement/{id}"
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
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* implementationGuide = "https://ancientsky.github.io/fhir_ig_demo/ImplementationGuide/tw.demo.nidrs"

// 於 rest.resource 列出 Profile(本 IG 交換皆以 $process-message 傳送訊息 Bundle，故不要求個別資源之 RESTful 互動)
RuleSet: NIDRSResource(type)
* rest[=].resource[+].type = #{type}

RuleSet: NIDRSSupportedProfile(profile)
* rest[=].resource[=].supportedProfile[+] = Canonical({profile})

RuleSet: NIDRSProcessMessageOperation(expectation)
* rest[=].operation[+].extension[0].url = $cs-expectation
* rest[=].operation[=].extension[0].valueCode = #{expectation}
* rest[=].operation[=].name = "process-message"
* rest[=].operation[=].definition = $process-message

RuleSet: NIDRSSupportedMessage(mode, expectation, definition)
* messaging[=].supportedMessage[+].extension[0].url = $cs-expectation
* messaging[=].supportedMessage[=].extension[0].valueCode = #{expectation}
* messaging[=].supportedMessage[=].mode = #{mode}
* messaging[=].supportedMessage[=].definition = Canonical({definition})

RuleSet: NIDRSSecurity
* rest[=].security.service = $restful-security-service#Certificates "Certificates"
* rest[=].security.description = "雙方必須(SHALL)：(1)以 HTTPS(TLS 1.2 以上)傳輸；(2)通報單位提供固定 IP 位置予疾管署，疾管署傳染病自動通報系統亦設置固定 IP，雙方開放防火牆；(3)通報單位以醫事機構憑證對傳送資料進行電子簽章(JWT 格式)，疾管署進行驗章，無法通過驗章時以對應之 HISMsg 回覆錯誤訊息；(4)透過回傳 HTTP 401「未授權」、HTTP 403「禁止」或 HTTP 404「未找到」拒絕任何未經授權的請求。"

// ============================================================
// 疾管署傳染病自動通報系統-伺服端
// ============================================================

Instance: nidrs-server
InstanceOf: CapabilityStatement
Usage: #definition
Title: "疾管署傳染病自動通報系統-伺服端(NIDRS Server)"
Description: "臺灣法定傳染病電子病歷自動通報實作指引(TWNIDRS IG)疾管署傳染病自動通報系統-伺服端(Server)之能力聲明"
* insert NIDRSCapabilityCommon(nidrs-server, NIDRSServer)
* title = "疾管署傳染病自動通報系統-伺服端(NIDRS Server)"
* description = "臺灣法定傳染病電子病歷自動通報實作指引(TWNIDRS IG)疾管署傳染病自動通報系統-伺服端(Server)之能力聲明：接收通報單位以 `$process-message` 傳送之通報單新增(EMRMsg01)、通報單修改(EMRMsg02)、通報單病歷資料傳送(EMRMsg03)及通報單送驗新增(EMRMsg04)訊息，並以同步回應回覆處理結果(HISMsg01~HISMsg04)；個案研判結果或送驗單檢驗結果異動時，主動以 `$process-message` 傳送研判結果主動通知(PushDetermineResult)及檢驗結果主動通知(PushSampleResult)至通報單位。"
* purpose = "說明疾管署傳染病自動通報系統(伺服端)應支援之 FHIR 訊息交換能力。"

* rest[0].mode = #server
* rest[=].documentation = "疾管署傳染病自動通報系統-伺服端必須(SHALL)：(1)支援本實作指引中所有通報單位傳送訊息之 profiles (2)根據 FHIR Messaging 規範，於 [base]/$process-message 接收訊息 Bundle(Bundle.type = message)，並以同步方式回傳符合 Bundle-nidrs-response 之回覆訊息(HISMsg01~HISMsg04) (3)回傳狀態碼-①(Status 400)：無效參數(invalid parameter)、②(Status 401/4xx)：未經授權的請求(unauthorized request)、③(Status 403)：未充分授權的資料存取範圍(insufficient permission scope)、④(Status 404)：未知的resource(unknown resource)、⑤(Status 422)：無法通過驗章或 JSON 語意邏輯檢查(unprocessable entity，並於回覆訊息中以 OperationOutcome 提供錯誤清單) (4)支援JSON格式 (5)可識別每個傳送至 Server 之實例(instance)之 meta.profile 是否為本實作指引 Profiles Defining URL，並確認實例是否依循 Profile 製作。疾管署傳染病自動通報系統-伺服端建議應該(SHOULD)：(1)支援XML格式。"
* insert NIDRSSecurity
* insert NIDRSProcessMessageOperation(SHALL)
* rest[=].operation[=].documentation = "接收通報單位傳送之 EMRMsg01(Bundle-nidrs-report-create)、EMRMsg02(Bundle-nidrs-report-update)、EMRMsg03(Bundle-nidrs-document)、EMRMsg04(Bundle-nidrs-sample)訊息，並同步回覆 HISMsg01~HISMsg04(Bundle-nidrs-response)。"

* insert NIDRSResource(Bundle)
* rest[=].resource[=].documentation = "通報單位傳送之訊息 Bundle(EMRMsg01~EMRMsg04)及疾管署回覆之訊息 Bundle(HISMsg01~HISMsg04)。"
* insert NIDRSSupportedProfile(BundleNIDRSReportCreate)
* insert NIDRSSupportedProfile(BundleNIDRSReportUpdate)
* insert NIDRSSupportedProfile(BundleNIDRSDocument)
* insert NIDRSSupportedProfile(BundleNIDRSSample)
* insert NIDRSSupportedProfile(BundleNIDRSResponse)
* insert NIDRSResource(MessageHeader)
* rest[=].resource[=].documentation = "訊息表頭：eventCoding 為 EMRMsg01~EMRMsg04(請求)或 HISMsg01~HISMsg04(回覆)。"
* insert NIDRSSupportedProfile(MessageHeaderNIDRSReportCreate)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSReportUpdate)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSDocument)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSSample)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSResponse)
* insert NIDRSResource(Composition)
* rest[=].resource[=].documentation = "傳染病個案通報單(REPORTS)。"
* insert NIDRSSupportedProfile(CompositionNIDRSReport)
* insert NIDRSSupportedProfile(CompositionNIDRSReportUpdate)
* insert NIDRSSupportedProfile(CompositionNIDRSReportDengueBulk)
* insert NIDRSResource(Patient)
* rest[=].resource[=].documentation = "通報個案及送驗個案基本資料。"
* insert NIDRSSupportedProfile(PatientNIDRS)
* insert NIDRSSupportedProfile(PatientNIDRSDengueBulk)
* insert NIDRSSupportedProfile(PatientNIDRSTBSample)
* insert NIDRSResource(Condition)
* rest[=].resource[=].documentation = "通報疾病；回覆訊息中之通報單清單(REPORT_LIST)。"
* insert NIDRSSupportedProfile(ConditionNIDRS)
* insert NIDRSSupportedProfile(ConditionNIDRSUpdate)
* insert NIDRSSupportedProfile(ConditionNIDRSDengueBulk)
* insert NIDRSSupportedProfile(ConditionNIDRSCaseRef)
* insert NIDRSResource(Encounter)
* rest[=].resource[=].documentation = "就醫資料(就醫日期、住院、病患動向等)。"
* insert NIDRSSupportedProfile(EncounterNIDRS)
* insert NIDRSResource(Observation)
* rest[=].resource[=].documentation = "職業、流行病學註記、旅遊史、接觸動物史、人口密集機構及死亡原因等觀察結果。"
* insert NIDRSSupportedProfile(ObservationNIDRSOccupation)
* insert NIDRSSupportedProfile(ObservationNIDRSEpiFlag)
* insert NIDRSSupportedProfile(ObservationNIDRSTravel)
* insert NIDRSSupportedProfile(ObservationNIDRSAnimal)
* insert NIDRSSupportedProfile(ObservationNIDRSDenseInstitution)
* insert NIDRSSupportedProfile(ObservationNIDRSCauseOfDeath)
* insert NIDRSResource(QuestionnaireResponse)
* rest[=].resource[=].documentation = "疾病增補欄位(附錄二)。"
* insert NIDRSSupportedProfile(QuestionnaireResponseNIDRS)
* insert NIDRSResource(RelatedPerson)
* rest[=].resource[=].documentation = "新生兒個案之母親資料。"
* insert NIDRSSupportedProfile(RelatedPersonNIDRSMother)
* insert NIDRSResource(Organization)
* rest[=].resource[=].documentation = "通報單位(醫事機構)及檢驗單位。"
* insert NIDRSSupportedProfile(OrganizationNIDRSHospital)
* insert NIDRSSupportedProfile(OrganizationNIDRSLab)
* insert NIDRSResource(Practitioner)
* rest[=].resource[=].documentation = "通報醫師/通報人。"
* insert NIDRSSupportedProfile(PractitionerNIDRS)
* insert NIDRSResource(PractitionerRole)
* rest[=].resource[=].documentation = "通報人於通報單位之角色。"
* insert NIDRSSupportedProfile(PractitionerRoleNIDRS)
* insert NIDRSResource(DocumentReference)
* rest[=].resource[=].documentation = "通報單病歷資料或檔案(EMRMsg03)。"
* insert NIDRSSupportedProfile(DocumentReferenceNIDRS)
* insert NIDRSResource(ServiceRequest)
* rest[=].resource[=].documentation = "法傳送驗單(SAMPLE)及法傳TB送驗單(TB_SAMPLE)。"
* insert NIDRSSupportedProfile(ServiceRequestNIDRSSample)
* insert NIDRSSupportedProfile(ServiceRequestNIDRSTBSample)
* insert NIDRSResource(Specimen)
* rest[=].resource[=].documentation = "送驗檢體。"
* insert NIDRSSupportedProfile(SpecimenNIDRS)
* insert NIDRSSupportedProfile(SpecimenNIDRSTB)
* insert NIDRSResource(OperationOutcome)
* rest[=].resource[=].documentation = "回覆訊息中之錯誤清單(ERROR_LIST)。"
* rest[=].resource[=].profile = Canonical(OperationOutcomeNIDRS)

* messaging[0].documentation = "疾管署傳染病自動通報系統-伺服端必須(SHALL)接收 EMRMsg01~EMRMsg04 訊息並同步回覆 HISMsg01~HISMsg04；個案研判結果或送驗單檢驗結果有異動時，必須(SHALL)主動傳送 PushDetermineResult/PushSampleResult 訊息至通報單位所提供之 `$process-message` 端點。"
* insert NIDRSSupportedMessage(receiver, SHALL, nidrs-emrmsg01)
* insert NIDRSSupportedMessage(receiver, SHALL, nidrs-emrmsg02)
* insert NIDRSSupportedMessage(receiver, SHALL, nidrs-emrmsg03)
* insert NIDRSSupportedMessage(receiver, SHALL, nidrs-emrmsg04)
* insert NIDRSSupportedMessage(sender, SHALL, nidrs-push-determine-result)
* insert NIDRSSupportedMessage(sender, SHALL, nidrs-push-sample-result)

// ============================================================
// 通報醫院端
// ============================================================

Instance: nidrs-client
InstanceOf: CapabilityStatement
Usage: #definition
Title: "通報醫院端(NIDRS Client)"
Description: "臺灣法定傳染病電子病歷自動通報實作指引(TWNIDRS IG)通報醫院端(Client)之能力聲明"
* insert NIDRSCapabilityCommon(nidrs-client, NIDRSClient)
* title = "通報醫院端(NIDRS Client)"
* description = "臺灣法定傳染病電子病歷自動通報實作指引(TWNIDRS IG)通報醫院端(Client)之能力聲明：通報單位彙整 HIS 中個案資訊，以 `$process-message` 傳送通報單新增(EMRMsg01)、通報單修改(EMRMsg02)、通報單病歷資料傳送(EMRMsg03)及通報單送驗新增(EMRMsg04)訊息至疾管署，並處理疾管署回覆之 HISMsg01~HISMsg04；通報單位建議應該(SHOULD)提供 `$process-message` 端點，接收疾管署主動傳送之研判結果主動通知(PushDetermineResult)及檢驗結果主動通知(PushSampleResult)。"
* purpose = "說明通報醫院端應支援之 FHIR 訊息交換能力。"

* rest[0].mode = #client
* rest[=].documentation = "通報醫院端必須(SHALL)：(1)依本實作指引之 profiles 產製訊息 Bundle(Bundle.type = message)，並於 meta.profile 宣告所依循之 Profile (2)以 HTTP POST 呼叫疾管署 [base]/$process-message 傳送 EMRMsg01~EMRMsg04 訊息 (3)處理疾管署同步回覆之 Bundle-nidrs-response(HISMsg01~HISMsg04)，包括成功時之通報單電腦編號/送驗清單及失敗時之錯誤清單(OperationOutcome) (4)支援JSON格式。通報醫院端建議應該(SHOULD)：(1)支援XML格式。"
* insert NIDRSSecurity
* insert NIDRSProcessMessageOperation(SHALL)
* rest[=].operation[=].documentation = "呼叫疾管署 [base]/$process-message 傳送 EMRMsg01(Bundle-nidrs-report-create)、EMRMsg02(Bundle-nidrs-report-update)、EMRMsg03(Bundle-nidrs-document)、EMRMsg04(Bundle-nidrs-sample)訊息。"
* insert NIDRSResource(Bundle)
* rest[=].resource[=].documentation = "通報單位傳送之訊息 Bundle(EMRMsg01~EMRMsg04)及疾管署回覆之訊息 Bundle(HISMsg01~HISMsg04)。"
* insert NIDRSSupportedProfile(BundleNIDRSReportCreate)
* insert NIDRSSupportedProfile(BundleNIDRSReportUpdate)
* insert NIDRSSupportedProfile(BundleNIDRSDocument)
* insert NIDRSSupportedProfile(BundleNIDRSSample)
* insert NIDRSSupportedProfile(BundleNIDRSResponse)
* insert NIDRSResource(MessageHeader)
* rest[=].resource[=].documentation = "訊息表頭：eventCoding 為 EMRMsg01~EMRMsg04(請求)或 HISMsg01~HISMsg04(回覆)。"
* insert NIDRSSupportedProfile(MessageHeaderNIDRSReportCreate)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSReportUpdate)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSDocument)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSSample)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSResponse)

* rest[+].mode = #server
* rest[=].documentation = "通報醫院端建議應該(SHOULD)提供 Web API 伺服器(固定 IP、HTTPS)，於 [base]/$process-message 接收疾管署主動傳送之研判結果主動通知(Bundle-nidrs-push-determine-result)及檢驗結果主動通知(Bundle-nidrs-push-sample-result)。成功接收時回傳 HTTP 200；失敗時回傳 4xx/5xx 及 OperationOutcome(對應原規格 Web Service 回傳值 Boolean：True=成功，False=失敗)。"
* insert NIDRSProcessMessageOperation(SHOULD)
* rest[=].operation[=].documentation = "接收疾管署主動傳送之 PushDetermineResult(Bundle-nidrs-push-determine-result)及 PushSampleResult(Bundle-nidrs-push-sample-result)訊息。"
* insert NIDRSResource(Bundle)
* rest[=].resource[=].documentation = "疾管署主動傳送之研判結果/檢驗結果通知訊息 Bundle。"
* insert NIDRSSupportedProfile(BundleNIDRSPushDetermineResult)
* insert NIDRSSupportedProfile(BundleNIDRSPushSampleResult)
* insert NIDRSResource(MessageHeader)
* rest[=].resource[=].documentation = "訊息表頭：eventCoding 為 PushDetermineResult 或 PushSampleResult。"
* insert NIDRSSupportedProfile(MessageHeaderNIDRSPushDetermineResult)
* insert NIDRSSupportedProfile(MessageHeaderNIDRSPushSampleResult)
* insert NIDRSResource(Condition)
* rest[=].resource[=].documentation = "個案研判結果(ReportDetermineResult)。"
* insert NIDRSSupportedProfile(ConditionNIDRSDetermineResult)
* insert NIDRSResource(DiagnosticReport)
* rest[=].resource[=].documentation = "送驗單綜合檢驗結果(SampleResult)。"
* insert NIDRSSupportedProfile(DiagnosticReportNIDRSSampleResult)
* insert NIDRSResource(Observation)
* rest[=].resource[=].documentation = "抗體/病原體檢驗結果。"
* insert NIDRSSupportedProfile(ObservationNIDRSAntibodyResult)
* insert NIDRSSupportedProfile(ObservationNIDRSPathogenResult)

* messaging[0].documentation = "通報醫院端必須(SHALL)傳送 EMRMsg01~EMRMsg04 訊息並處理同步回覆之 HISMsg01~HISMsg04；建議應該(SHOULD)接收疾管署主動傳送之 PushDetermineResult/PushSampleResult 訊息。"
* insert NIDRSSupportedMessage(sender, SHALL, nidrs-emrmsg01)
* insert NIDRSSupportedMessage(sender, SHALL, nidrs-emrmsg02)
* insert NIDRSSupportedMessage(sender, SHALL, nidrs-emrmsg03)
* insert NIDRSSupportedMessage(sender, SHALL, nidrs-emrmsg04)
* insert NIDRSSupportedMessage(receiver, SHOULD, nidrs-push-determine-result)
* insert NIDRSSupportedMessage(receiver, SHOULD, nidrs-push-sample-result)
