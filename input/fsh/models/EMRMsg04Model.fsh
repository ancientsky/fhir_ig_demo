// 表14 EMRMsg04：通報單送驗新增作業傳送資料結構(EMRMsg04)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: EMRMsg04Model
Id: EMRMsg04Model
Title: "通報單送驗新增作業傳送資料結構(EMRMsg04)之資料模型"
Description: "NIDRS 表14 傳染病通報單送驗新增作業結構表-傳送資料結構(EMRMsg04)之資料模型，包含法傳送驗單(SAMPLE)與法傳TB送驗單(TB_SAMPLE)。"
* ^version = "0.1.0"
* ^status = #draft
* SAMPLE 0..1 BackboneElement "法傳送驗單欄位" "法傳送驗單欄位；原規格未列基數，依 Bundle-nidrs-sample 一則訊息傳送 SAMPLE 或 TB_SAMPLE 其中之一。"
* SAMPLE.Report 1..1 string "法傳通報單編號" "法傳通報單編號。原規格資料型態：String/13。"
* SAMPLE.Report ^maxLength = 13
* SAMPLE.Report ^example.label = "範例"
* SAMPLE.Report ^example.valueString = "1140300012345"
* SAMPLE.BarCode 0..1 string "送驗單編號" "送驗單編號；此欄位可不填，填寫內容為疾管署所發放bar-Code，格式為XX-XXX-XXXXXX共13碼之編號，若未填將於送驗單新增成功時由系統自動編號格式為15碼數字。原規格資料型態：String/20。"
* SAMPLE.BarCode ^maxLength = 20
* SAMPLE.BarCode ^example.label = "範例"
* SAMPLE.BarCode ^example.valueString = "AB-123-456789"
* SAMPLE.HOSPITAL_SAMPLING_NO 0..1 string "院內檢體編號" "院內檢體編號。原規格資料型態：String/20。"
* SAMPLE.HOSPITAL_SAMPLING_NO ^maxLength = 20
* SAMPLE.HOSPITAL_SAMPLING_NO ^example.label = "範例"
* SAMPLE.HOSPITAL_SAMPLING_NO ^example.valueString = "S2025080301"
* SAMPLE.ISCORPSEDISSECTION 0..1 code "屍體解剖" "屍體解剖；0否(預設值)；1是。原規格資料型態：Code。"
* SAMPLE.ISCORPSEDISSECTION ^example.label = "範例"
* SAMPLE.ISCORPSEDISSECTION ^example.valueCode = #0
* SAMPLE.SAMPLE_TYPE 1..1 code "檢體類別" "檢體類別；檢體類別與「屍體解剖」及「送驗疾病」有其關聯性，三者必須符合採檢手冊之定義；代碼定義請參考附錄四代碼彙整表中的「送驗疾病與檢體類別之關聯」代碼。原規格資料型態：Code。"
* SAMPLE.SAMPLE_TYPE from CDCSpecimenType (required)
* SAMPLE.SAMPLE_TYPE ^example.label = "範例"
* SAMPLE.SAMPLE_TYPE ^example.valueCode = #40
* SAMPLE.SAMPLE_TYPE_OTHER 0..1 string "其他檢體備註說明" "其他檢體備註說明；若「檢體類別」為「其他」，此欄位為必填。原規格資料型態：String/120。"
* SAMPLE.SAMPLE_TYPE_OTHER ^maxLength = 120
* SAMPLE.DISEASE 1..1 string "送驗疾病代碼" "送驗疾病代碼；每個疾病之間以逗號區隔；「送驗疾病」不可重複。原規格資料型態：String/100。"
* SAMPLE.DISEASE ^maxLength = 100
* SAMPLE.DISEASE ^example.label = "範例"
* SAMPLE.DISEASE ^example.valueString = "061,A920"
* SAMPLE.DRUG_BEFORE_SAMPLING 0..1 code "採檢前投藥情形" "採檢前投藥情形；0:否 1:是。原規格資料型態：Code。"
* SAMPLE.DRUG_BEFORE_SAMPLING ^example.label = "範例"
* SAMPLE.DRUG_BEFORE_SAMPLING ^example.valueCode = #0
* SAMPLE.COMMENTS 0..1 string "個案備註" "個案備註。原規格資料型態：String/100。"
* SAMPLE.COMMENTS ^maxLength = 100
* SAMPLE.REQUESTER 1..1 string "送驗人員" "送驗人員。原規格資料型態：String/20。"
* SAMPLE.REQUESTER ^maxLength = 20
* SAMPLE.REQUESTER ^example.label = "範例"
* SAMPLE.REQUESTER ^example.valueString = "張護理師"
* SAMPLE.SAMPLING_HOSPITAL 1..1 string "送驗單位代碼" "送驗單位代碼；醫事機構代碼。原規格資料型態：String/10。"
* SAMPLE.SAMPLING_HOSPITAL ^maxLength = 10
* SAMPLE.SAMPLING_HOSPITAL ^example.label = "範例"
* SAMPLE.SAMPLING_HOSPITAL ^example.valueString = "0101090517"
* SAMPLE.SAMPLING_HOSPITAL_EMAIL 0..1 string "送驗單位電子信箱" "送驗單位電子信箱。原規格資料型態：String/60。"
* SAMPLE.SAMPLING_HOSPITAL_EMAIL ^maxLength = 60
* SAMPLE.SAMPLING_HOSPITAL_EMAIL ^example.label = "範例"
* SAMPLE.SAMPLING_HOSPITAL_EMAIL ^example.valueString = "lab@example.org.tw"
* SAMPLE.RECEIVED_UNIT_TYPE 1..1 string "指定收件單位類型" "指定收件單位類型；代碼定義：1:疾管署、6:認可實驗室；送件單位類型可選填項目與送驗疾病對應，對應關係可參考附錄四代碼彙整表(疾管署之可送驗疾病代碼；認可實驗室之可送驗疾病代碼、指定檢驗機構之可送驗疾病代碼)。原規格資料型態：String/3。"
* SAMPLE.RECEIVED_UNIT_TYPE ^maxLength = 3
* SAMPLE.RECEIVED_UNIT_TYPE from CDCReceivedUnitType (required)
* SAMPLE.RECEIVED_UNIT_TYPE ^example.label = "範例"
* SAMPLE.RECEIVED_UNIT_TYPE ^example.valueString = "1"
* SAMPLE.RECEIVED_UNIT 1..1 string "指定收件單位代碼" "指定收件單位代碼；單位代碼與指定收件單位類型對應，類型須一致；代碼定義請參考附錄四代碼彙整表(指定送驗單位_疾管署單位代碼；指定送驗單位_認可實驗室代碼、指定送驗單位_指定檢驗機構代碼)。原規格資料型態：String/10。"
* SAMPLE.RECEIVED_UNIT ^maxLength = 10
* SAMPLE.RECEIVED_UNIT ^example.label = "範例"
* SAMPLE.RECEIVED_UNIT ^example.valueString = "15"
* SAMPLE.SAMPLED_DAY 1..1 string "檢體採檢日" "檢體採檢日；西元日期YYYYMMDD。原規格資料型態：String/8。日期以原格式字串表達。"
* SAMPLE.SAMPLED_DAY ^maxLength = 8
* SAMPLE.SAMPLED_DAY ^example.label = "範例"
* SAMPLE.SAMPLED_DAY ^example.valueString = "20250803"
* TB_SAMPLE 0..1 BackboneElement "法傳TB送驗單欄位" "法傳TB送驗單欄位；原規格未列基數，依 Bundle-nidrs-sample 一則訊息傳送 SAMPLE 或 TB_SAMPLE 其中之一。"
* TB_SAMPLE.ReportID 0..1 string "法傳通報單號" "法傳通報單號；非通報個案可不填。原規格資料型態：String/13。"
* TB_SAMPLE.ReportID ^maxLength = 13
* TB_SAMPLE.ReportID ^example.label = "範例"
* TB_SAMPLE.ReportID ^example.valueString = "1140300012345"
* TB_SAMPLE.BarCode 0..1 string "送驗單編號" "送驗單編號；此欄位可不填，填寫內容為疾管署所發放bar-Code，格式為XX-XXX-XXXXXX共13碼之編號，若未填將於送驗單新增成功時由系統自動編號格式為15碼數字。原規格資料型態：String/20。"
* TB_SAMPLE.BarCode ^maxLength = 20
* TB_SAMPLE.HOSPITAL_SAMPLING_NO 0..1 string "院內檢體編號" "院內檢體編號。原規格資料型態：String/20。"
* TB_SAMPLE.HOSPITAL_SAMPLING_NO ^maxLength = 20
* TB_SAMPLE.SAMPLE_TYPE 1..1 string "檢體類別" "檢體類別；代碼定義請參考附錄四代碼彙整表中的「結核病檢體類別」代碼。原規格資料型態：String/3。"
* TB_SAMPLE.SAMPLE_TYPE ^maxLength = 3
* TB_SAMPLE.SAMPLE_TYPE from CDCTBSpecimenType (required)
* TB_SAMPLE.SAMPLE_TYPE ^example.label = "範例"
* TB_SAMPLE.SAMPLE_TYPE ^example.valueString = "14"
* TB_SAMPLE.SAMPLE_TYPE_OTHER_DESC 0..1 string "其他檢體備註說明" "其他檢體備註說明。原規格資料型態：String/120。"
* TB_SAMPLE.SAMPLE_TYPE_OTHER_DESC ^maxLength = 120
* TB_SAMPLE.PHTESTITEM 1..* string "送驗項目" "送驗項目，可多選格式必須為陣列，例如：[1,8]；代碼定義請參考附錄四代碼彙整表中的「結核病送驗項目代碼」。原規格基數記為 1..1、型態 String/20，惟其值為陣列，故本模型以 1..* 表達。原規格資料型態：String/20。"
* TB_SAMPLE.PHTESTITEM ^maxLength = 20
* TB_SAMPLE.PHTESTITEM from CDCTBTestItem (required)
* TB_SAMPLE.PHTESTITEM ^example.label = "範例"
* TB_SAMPLE.PHTESTITEM ^example.valueString = "1"
* TB_SAMPLE.PHTESTITEM_OTHER_DESC 0..1 string "送驗項目其他說明" "送驗項目其他說明。原規格資料型態：String/100。"
* TB_SAMPLE.PHTESTITEM_OTHER_DESC ^maxLength = 100
* TB_SAMPLE.SampleReasonXPERT 0..1 string "疾管署分子快速檢測送驗原因" "送驗項目：疾管署分子快速檢測；代碼定義：1失落再治、2失敗再治、3結核病復發、4重開非復發曾使用抗結核藥物4週以上、5抗藥性結核病個案接觸者、6高風險鄉鎮新發生個案、7曾長期停留高負擔國家、8RMP抗藥、9治療2個月之痰培養仍為陽性者、10INH抗藥擬申請二線藥者、11因藥物副作用擬申請二線藥者、12通報結核病之畜牧場人員、13M. bovis結核個案或動物之接觸者轉為個案者、14潛伏結核感染治療(LTBI)個案結核病發病者、15其他。原規格資料型態：String/20。"
* TB_SAMPLE.SampleReasonXPERT ^maxLength = 20
* TB_SAMPLE.SampleReasonXPERT from CDCXpertReason (required)
* TB_SAMPLE.SampleReasonXPERT ^example.label = "範例"
* TB_SAMPLE.SampleReasonXPERT ^example.valueString = "3"
* TB_SAMPLE.SampleReasonXPERT_other 0..1 string "疾管署分子快速檢測其他說明" "疾管署分子快速檢測其他說明。原規格資料型態：String/50。"
* TB_SAMPLE.SampleReasonXPERT_other ^maxLength = 50
* TB_SAMPLE.TB_MEDICINE_USE_ID 0..1 string "抗結核菌藥物" "抗結核菌藥物；代碼定義：N未用藥物；1服用<2週；2服用>2週。原規格資料型態：String/1。"
* TB_SAMPLE.TB_MEDICINE_USE_ID ^maxLength = 1
* TB_SAMPLE.TB_MEDICINE_USE_ID from CDCTBMedicineUse (required)
* TB_SAMPLE.TB_MEDICINE_USE_ID ^example.label = "範例"
* TB_SAMPLE.TB_MEDICINE_USE_ID ^example.valueString = "N"
* TB_SAMPLE.REQUESTER 1..1 string "送驗人員" "送驗人員。原規格資料型態：String/10。"
* TB_SAMPLE.REQUESTER ^maxLength = 10
* TB_SAMPLE.REQUESTER ^example.label = "範例"
* TB_SAMPLE.REQUESTER ^example.valueString = "張護理師"
* TB_SAMPLE.SAMPLING_HOSPITAL 1..1 string "送驗單位" "送驗單位(IDA醫事機構代碼表)。原規格資料型態：String/10。"
* TB_SAMPLE.SAMPLING_HOSPITAL ^maxLength = 10
* TB_SAMPLE.SAMPLING_HOSPITAL ^example.label = "範例"
* TB_SAMPLE.SAMPLING_HOSPITAL ^example.valueString = "0101090517"
* TB_SAMPLE.RECEIVED_UNIT_TYPE 1..1 string "指定收件單位類型" "指定收件單位類型；代碼定義：1:疾管署、6:認可實驗室；送件單位類型可選填項目與送驗疾病對應，對應關係可參考附錄四代碼彙整表(疾管署之可送驗疾病代碼；認可實驗室之可送驗疾病代碼、指定檢驗機構之可送驗疾病代碼)。原規格資料型態：String/3。"
* TB_SAMPLE.RECEIVED_UNIT_TYPE ^maxLength = 3
* TB_SAMPLE.RECEIVED_UNIT_TYPE from CDCReceivedUnitType (required)
* TB_SAMPLE.RECEIVED_UNIT_TYPE ^example.label = "範例"
* TB_SAMPLE.RECEIVED_UNIT_TYPE ^example.valueString = "1"
* TB_SAMPLE.RECEIVED_UNIT 1..1 string "指定收件單位代碼" "指定收件單位代碼；單位代碼與指定收件單位類型對應，類型須一致；代碼定義請參考附錄四代碼彙整表(指定送驗單位_疾管署單位代碼；指定送驗單位_認可實驗室代碼、指定送驗單位_指定檢驗機構代碼)。原規格資料型態：String/10。"
* TB_SAMPLE.RECEIVED_UNIT ^maxLength = 10
* TB_SAMPLE.RECEIVED_UNIT ^example.label = "範例"
* TB_SAMPLE.RECEIVED_UNIT ^example.valueString = "15"
* TB_SAMPLE.SAMPLED_DAY 1..1 string "採檢日" "採檢日；西元日期YYYYMMDD，若送驗疾病為結核病時，此欄位必須在送驗日之前(或同日)。原規格資料型態：String/8。日期以原格式字串表達。"
* TB_SAMPLE.SAMPLED_DAY ^maxLength = 8
* TB_SAMPLE.SAMPLED_DAY ^example.label = "範例"
* TB_SAMPLE.SAMPLED_DAY ^example.valueString = "20250803"
* TB_SAMPLE.PHPROVIDEDATE 1..1 string "送驗日" "送驗日；西元日期YYYYMMDD，若送驗疾病為結核病時，此欄位必須在採檢日之後(或同日)。原規格資料型態：String/8。日期以原格式字串表達。"
* TB_SAMPLE.PHPROVIDEDATE ^maxLength = 8
* TB_SAMPLE.PHPROVIDEDATE ^example.label = "範例"
* TB_SAMPLE.PHPROVIDEDATE ^example.valueString = "20250804"
* TB_SAMPLE.IDNO 1..1 string "身分證字號" "身分證字號。原規格資料型態：String/10。"
* TB_SAMPLE.IDNO ^maxLength = 10
* TB_SAMPLE.IDNO ^example.label = "範例"
* TB_SAMPLE.IDNO ^example.valueString = "A123456789"
* TB_SAMPLE.NAME 1..1 string "姓名" "姓名。原規格資料型態：String/30。"
* TB_SAMPLE.NAME ^maxLength = 30
* TB_SAMPLE.NAME ^example.label = "範例"
* TB_SAMPLE.NAME ^example.valueString = "陳大華"
* TB_SAMPLE.INSURANCENO 0..1 string "健保卡序號" "健保卡序號，若無請填寫「無」。原規格資料型態：String/20。"
* TB_SAMPLE.INSURANCENO ^maxLength = 20
* TB_SAMPLE.INSURANCENO ^example.label = "範例"
* TB_SAMPLE.INSURANCENO ^example.valueString = "000012345678"
* TB_SAMPLE.BIRTHDAY 1..1 string "出生日期" "出生日期；西元日期YYYYMMDD。原規格資料型態：String/8。日期以原格式字串表達。"
* TB_SAMPLE.BIRTHDAY ^maxLength = 8
* TB_SAMPLE.BIRTHDAY ^example.label = "範例"
* TB_SAMPLE.BIRTHDAY ^example.valueString = "19900520"
* TB_SAMPLE.SEX 1..1 string "性別" "性別；代碼定義：F女生；M男生。原規格資料型態：String/1。"
* TB_SAMPLE.SEX ^maxLength = 1
* TB_SAMPLE.SEX from CDCGender (required)
* TB_SAMPLE.SEX ^example.label = "範例"
* TB_SAMPLE.SEX ^example.valueString = "M"
* TB_SAMPLE.PHCASENO 0..1 string "病歷號碼" "病歷號碼。原規格資料型態：String/20。"
* TB_SAMPLE.PHCASENO ^maxLength = 20
* TB_SAMPLE.PHCASENO ^example.label = "範例"
* TB_SAMPLE.PHCASENO ^example.valueString = "0012345"
* TB_SAMPLE.NATIONALITY 1..1 string "國籍國家代碼" "國籍國家代碼；本國請填寫中華民國「158」；代碼定義請參考附錄四代碼彙整表中的「國家代碼」。原規格資料型態：String/3。"
* TB_SAMPLE.NATIONALITY ^maxLength = 3
* TB_SAMPLE.NATIONALITY from CDCCountry (required)
* TB_SAMPLE.NATIONALITY ^example.label = "範例"
* TB_SAMPLE.NATIONALITY ^example.valueString = "158"
* TB_SAMPLE.NATIONALITY_OTHER 0..1 string "其他國家" "其他國家。原規格資料型態：String/20。"
* TB_SAMPLE.NATIONALITY_OTHER ^maxLength = 20
* TB_SAMPLE.RESIDENCE_COUNTY 1..1 string "居住縣市" "居住縣市；代碼定義請參考附錄四代碼彙整表中的「縣市代碼」。原規格資料型態：String/5。"
* TB_SAMPLE.RESIDENCE_COUNTY ^maxLength = 5
* TB_SAMPLE.RESIDENCE_COUNTY from CDCCounty (required)
* TB_SAMPLE.RESIDENCE_COUNTY ^example.label = "範例"
* TB_SAMPLE.RESIDENCE_COUNTY ^example.valueString = "65000"
* TB_SAMPLE.RESIDENCE_TOWN 1..1 string "居住市區鄉鎮" "居住市區鄉鎮；代碼定義請參考附錄四代碼彙整表中的「縣市代碼」。原規格資料型態：String/8。"
* TB_SAMPLE.RESIDENCE_TOWN ^maxLength = 8
* TB_SAMPLE.RESIDENCE_TOWN from CDCTown (required)
* TB_SAMPLE.RESIDENCE_TOWN ^example.label = "範例"
* TB_SAMPLE.RESIDENCE_TOWN ^example.valueString = "65000010"
* TB_SAMPLE.ADDRESS 1..1 string "居住詳細地址" "居住詳細地址。原規格資料型態：String/40。"
* TB_SAMPLE.ADDRESS ^maxLength = 40
* TB_SAMPLE.ADDRESS ^example.label = "範例"
* TB_SAMPLE.ADDRESS ^example.valueString = "文化路一段100號"

Mapping: EMRMsg04ModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "EMRMsg04 JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: EMRMsg04Model
Target: "http://hl7.org/fhir/R4"
* -> "Bundle-nidrs-sample: Bundle；MessageHeader-nidrs-sample: MessageHeader" "Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg04；MessageHeader.focus 參照 ServiceRequest"
* SAMPLE -> "ServiceRequest-nidrs-sample: ServiceRequest；Specimen-nidrs: Specimen" "建立 ServiceRequest-nidrs-sample 與 Specimen-nidrs；Patient(subject)不在原欄位內，須依通報單號由 HIS 帶入或以 identifier 參照"
* SAMPLE.Report -> "ServiceRequest-nidrs-sample: ServiceRequest.supportingInfo[report].identifier.value" "supportingInfo[report] 以 identifier(system = nidrs-report-id)參照 Condition-nidrs-case-ref"
* SAMPLE.BarCode -> "ServiceRequest-nidrs-sample: ServiceRequest.identifier[barcode].value" "system = https://lims.cdc.gov.tw/"
* SAMPLE.HOSPITAL_SAMPLING_NO -> "Specimen-nidrs: Specimen.identifier.value" "identifier.system 由送驗單位自訂(如院所網域 URL)"
* SAMPLE.ISCORPSEDISSECTION -> "Specimen-nidrs: Specimen.extension[autopsy].valueBoolean" "0→false、1→true；未填視為 false"
* SAMPLE.SAMPLE_TYPE -> "Specimen-nidrs: Specimen.type.coding.code" "system = CodeSystem cdc-specimen-type；組合檢核見 ConceptMap cdc-test-disease-specimen"
* SAMPLE.SAMPLE_TYPE_OTHER -> "Specimen-nidrs: Specimen.type.text" "置於同一 CodeableConcept 之 text"
* SAMPLE.DISEASE -> "ServiceRequest-nidrs-sample: ServiceRequest.reasonCode.coding.code" "以逗號拆分，每一送驗疾病建立一個 reasonCode(system = CodeSystem cdc-test-disease)，不可重複"
* SAMPLE.DRUG_BEFORE_SAMPLING -> "ServiceRequest-nidrs-sample: ServiceRequest.extension[drugBeforeSampling].valueBoolean" "0→false、1→true"
* SAMPLE.COMMENTS -> "ServiceRequest-nidrs-sample: ServiceRequest.note.text" "直接對應"
* SAMPLE.REQUESTER -> "Practitioner-nidrs: Practitioner.name.text；ServiceRequest-nidrs-sample: ServiceRequest.requester" "建立 Practitioner 與 PractitionerRole-nidrs(organization = 送驗單位)，requester 參照該 PractitionerRole"
* SAMPLE.SAMPLING_HOSPITAL -> "Organization-nidrs-hospital: Organization.identifier[hospitalCode].value；PractitionerRole-nidrs: PractitionerRole.organization；MessageHeader-nidrs-sample: MessageHeader.sender" "建立 Organization-nidrs-hospital"
* SAMPLE.SAMPLING_HOSPITAL_EMAIL -> "Organization-nidrs-hospital: Organization.telecom.value" "telecom.system = email"
* SAMPLE.RECEIVED_UNIT_TYPE -> "Organization-nidrs-lab: Organization.type.coding.code；ServiceRequest-nidrs-sample: ServiceRequest.performer" "system = CodeSystem cdc-received-unit-type；建立 Organization-nidrs-lab，ServiceRequest.performer 參照之"
* SAMPLE.RECEIVED_UNIT -> "Organization-nidrs-lab: Organization.identifier.value" "類型 1→identifier.system = CodeSystem cdc-lab-unit 之 URL；類型 6→cdc-approved-lab 或醫事機構代碼(invariant nidrs-lab-1)"
* SAMPLE.SAMPLED_DAY -> "Specimen-nidrs: Specimen.collection.collectedDateTime" "日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01)"
* TB_SAMPLE -> "ServiceRequest-nidrs-tb-sample: ServiceRequest；Specimen-nidrs-tb: Specimen；Patient-nidrs-tb-sample: Patient" "建立 ServiceRequest-nidrs-tb-sample、Specimen-nidrs-tb 與 Patient-nidrs-tb-sample；reasonCode 固定為 CDCTestDisease#010(結核病)"
* TB_SAMPLE.ReportID -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.supportingInfo[report].identifier.value" "以 identifier(system = nidrs-report-id)參照；未填則不產生 supportingInfo[report]"
* TB_SAMPLE.BarCode -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.identifier[barcode].value" "system = https://lims.cdc.gov.tw/"
* TB_SAMPLE.HOSPITAL_SAMPLING_NO -> "Specimen-nidrs-tb: Specimen.identifier.value" "identifier.system 由送驗單位自訂"
* TB_SAMPLE.SAMPLE_TYPE -> "Specimen-nidrs-tb: Specimen.type.coding.code" "system = CodeSystem cdc-tb-specimen-type"
* TB_SAMPLE.SAMPLE_TYPE_OTHER_DESC -> "Specimen-nidrs-tb: Specimen.type.text" "置於同一 CodeableConcept 之 text"
* TB_SAMPLE.PHTESTITEM -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.orderDetail.coding.code" "陣列之每一項目建立一個 orderDetail(system = CodeSystem cdc-tb-test-item)"
* TB_SAMPLE.PHTESTITEM_OTHER_DESC -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.orderDetail.text" "置於「其他」項目之 orderDetail.text"
* TB_SAMPLE.SampleReasonXPERT -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.extension[xpertReason].valueCodeableConcept.coding.code" "system = CodeSystem cdc-xpert-reason"
* TB_SAMPLE.SampleReasonXPERT_other -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.extension[xpertReason].valueCodeableConcept.text" "置於同一 CodeableConcept 之 text"
* TB_SAMPLE.TB_MEDICINE_USE_ID -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.extension[tbMedicineUse].valueCodeableConcept.coding.code" "system = CodeSystem cdc-tb-medicine-use"
* TB_SAMPLE.REQUESTER -> "Practitioner-nidrs: Practitioner.name.text；ServiceRequest-nidrs-tb-sample: ServiceRequest.requester" "建立 Practitioner 與 PractitionerRole-nidrs，requester 參照該 PractitionerRole"
* TB_SAMPLE.SAMPLING_HOSPITAL -> "Organization-nidrs-hospital: Organization.identifier[hospitalCode].value；PractitionerRole-nidrs: PractitionerRole.organization；MessageHeader-nidrs-sample: MessageHeader.sender" "建立 Organization-nidrs-hospital"
* TB_SAMPLE.RECEIVED_UNIT_TYPE -> "Organization-nidrs-lab: Organization.type.coding.code；ServiceRequest-nidrs-tb-sample: ServiceRequest.performer" "system = CodeSystem cdc-received-unit-type；建立 Organization-nidrs-lab，ServiceRequest.performer 參照之"
* TB_SAMPLE.RECEIVED_UNIT -> "Organization-nidrs-lab: Organization.identifier.value" "類型 1→identifier.system = CodeSystem cdc-lab-unit 之 URL；類型 6→cdc-approved-lab 或醫事機構代碼(invariant nidrs-lab-1)"
* TB_SAMPLE.SAMPLED_DAY -> "Specimen-nidrs-tb: Specimen.collection.collectedDateTime" "日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01)"
* TB_SAMPLE.PHPROVIDEDATE -> "ServiceRequest-nidrs-tb-sample: ServiceRequest.authoredOn" "日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01)"
* TB_SAMPLE.IDNO -> "Patient-nidrs-tb-sample: Patient.identifier[idCardNumber|residentNumber|passportNumber|nidrsTempId].value" "依證號種類擇一 slice(同 Report_Common.IDNO)"
* TB_SAMPLE.NAME -> "Patient-nidrs-tb-sample: Patient.name[usual].text" "直接對應"
* TB_SAMPLE.INSURANCENO -> "Patient-nidrs-tb-sample: Patient.identifier[nhiCardNumber].value" "值為「無」時不產生 identifier；system = https://www.nhi.gov.tw"
* TB_SAMPLE.BIRTHDAY -> "Patient-nidrs-tb-sample: Patient.birthDate" "日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01)"
* TB_SAMPLE.SEX -> "Patient-nidrs-tb-sample: Patient.gender" "F→female、M→male"
* TB_SAMPLE.PHCASENO -> "Patient-nidrs-tb-sample: Patient.identifier[medicalRecord].value" "identifier.type = v2-0203#MR；system 由院所自訂"
* TB_SAMPLE.NATIONALITY -> "Patient-nidrs-tb-sample: Patient.extension[nationality].extension[code].valueCodeableConcept.coding" "system = CodeSystem cdc-country"
* TB_SAMPLE.NATIONALITY_OTHER -> "Patient-nidrs-tb-sample: Patient.extension[nationality].extension[code].valueCodeableConcept.text" "置於同一 CodeableConcept 之 text"
* TB_SAMPLE.RESIDENCE_COUNTY -> "Patient-nidrs-tb-sample: Patient.address.extension[adminArea].extension[county].valueCoding" "system = CodeSystem cdc-county"
* TB_SAMPLE.RESIDENCE_TOWN -> "Patient-nidrs-tb-sample: Patient.address.extension[adminArea].extension[town].valueCoding" "system = CodeSystem cdc-town"
* TB_SAMPLE.ADDRESS -> "Patient-nidrs-tb-sample: Patient.address.text" "直接對應"
