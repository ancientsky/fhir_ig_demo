// ============================================================
// 通報個案(Patient)
// ============================================================

RuleSet: PatientNIDRSRules(phoneMin, deceasedMin)
* ^version = "0.1.0"
* identifier 1..* MS
* identifier ^short = "身分證統一編號/居留證統一證號/護照號碼/NIDRS系統自動編碼證號(IDNO)"
* identifier contains
    foreignPassport 0..1 MS and
    nidrsTempId 0..1 MS and
    nhiCardNumber 0..1 MS
* identifier[idCardNumber] MS
* identifier[idCardNumber] ^short = "身分證統一編號(IDNO)，請優先填入"
* identifier[residentNumber] MS
* identifier[residentNumber] ^short = "外來人口居留證統一證號(IDNO)"
* identifier[passportNumber] MS
* identifier[passportNumber] ^short = "中華民國護照號碼(IDNO)"
* identifier[foreignPassport] ^short = "外國護照號碼(IDNO)；system 為 http://hl7.org/fhir/sid/passport-{ISO 3166-1 alpha-3}。因 TW Core passportNumber slice 以 type=PPN 區分且限定中華民國護照，外國護照以本 IG 識別碼類型 foreign-passport 表達"
* identifier[foreignPassport].use = #official
* identifier[foreignPassport].type.coding.system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-identifier-type"
* identifier[foreignPassport].type.coding.code = #foreign-passport
* identifier[foreignPassport].system 1..1
* identifier[foreignPassport].value 1..1
* identifier[nidrsTempId] ^short = "無法取得上述證號時，填入 AA(本國新生兒)、BB(本國人士)或 CC(外國人士)，由 NIDRS 自動編碼流水證號"
* identifier[nidrsTempId].use = #temp
* identifier[nidrsTempId].type.coding.system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-identifier-type"
* identifier[nidrsTempId].type.coding.code = #nidrs-temp
* identifier[nidrsTempId].system = $NIDRSTempId
* identifier[nidrsTempId].value 1..1
* identifier[nhiCardNumber] ^short = "健保卡序號(INSURANCENO)"
* identifier[nhiCardNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[nhiCardNumber].type.coding.code = #HC
* identifier[nhiCardNumber].system = $NHICard
* identifier[nhiCardNumber].value 1..1
* identifier[medicalRecord] MS
* identifier[medicalRecord] ^short = "病歷號碼(PHCASENO)"
* obeys nidrs-pat-1
* extension contains
    NIDRSCitizen named citizen 0..1 MS and
    NIDRSResidenceType named residenceType 0..1 MS
* extension[nationality] MS
* extension[nationality] ^short = "國家(NATIONALITY)：本國籍僅可填 158；非本國籍請填寫護照之發放國家"
* extension[nationality].extension[code].value[x] from CDCCountry (extensible)
* extension[nationality].extension[code].value[x] ^short = "國家代碼；查無國家名稱時填「其他(OTH)」並於 text 填寫其他國家(NATIONALITY_OTHER)"
* extension[citizen] ^short = "國籍(CITIZEN)：0-本國籍、1-非本國籍"
* extension[residenceType] ^short = "非本國籍居民身分(RESIDENCE_TYPE / RESIDENCE_TYPE_OTHER)"
* name 1..* MS
* name[usual] 1..1 MS
* name[usual] ^short = "個案姓名(NAME)"
* name[usual].text 1..1 MS
* name[usual].text ^maxLength = 200
* name[official] MS
* name[official] ^short = "姓名羅馬拼音(NAME_PINYIN)，並以 iso21090-EN-representation 擴充標示為 ABC(字母)"
* name[official].text ^maxLength = 200
* name[official].extension contains $en-representation named representation 0..1
* gender MS
* gender ^short = "性別(GENDER)：F→female、M→male、X(第三性別)→other"
* birthDate 1..1 MS
* birthDate ^short = "出生日期(BIRTHDAY)"
* telecom MS
* telecom ^slicing.discriminator[0].type = #value
* telecom ^slicing.discriminator[0].path = "system"
* telecom ^slicing.discriminator[1].type = #value
* telecom ^slicing.discriminator[1].path = "use"
* telecom ^slicing.rules = #open
* telecom ^short = "個案聯絡資料(CONTACT_INFO)"
* telecom contains
    phone {phoneMin}..1 MS and
    mobile 1..1 MS
* telecom[phone] ^short = "連絡電話(CONTACT_TYPE=0)；若無請填「無」"
* telecom[phone].system = #phone
* telecom[phone].use = #home
* telecom[phone].value 1..1
* telecom[phone].value ^maxLength = 100
* telecom[mobile] ^short = "手機(CONTACT_TYPE=1)；若無請填「無」"
* telecom[mobile].system = #phone
* telecom[mobile].use = #mobile
* telecom[mobile].value 1..1
* telecom[mobile].value ^maxLength = 100
* address 1..1 MS
* address ^short = "居住地址"
* address.extension contains NIDRSAdministrativeArea named adminArea 1..1 MS
* address.extension[adminArea] ^short = "居住縣市(RESIDENCE_COUNTY)/鄉鎮市區(RESIDENCE_TOWN)/村里(RESIDENCE_VILLAGE)代碼"
* address.extension[adminArea].extension[town] 1..1
* address.text MS
* address.text ^short = "街道地址(ADDRESS)"
* address.text ^maxLength = 150
* maritalStatus MS
* maritalStatus ^short = "婚姻狀況(MARRIAGE)：請以 CDCMaritalStatus 代碼填寫，並建議同時填寫 HL7 v3-MaritalStatus 對應代碼"
* deceased[x] {deceasedMin}..1 MS
* deceased[x] ^short = "是否死亡(DEATH)/死亡日期(DEATH_DAY)：未死亡填 deceasedBoolean=false；死亡則填 deceasedDateTime(死亡日期必填)"
* obeys nidrs-pat-2 and nidrs-pat-3

Invariant: nidrs-pat-1
Description: "須至少填寫一種個案證號：身分證統一編號、居留證統一證號、護照號碼或NIDRS系統自動編碼證號(AA/BB/CC)。"
Severity: #error
Expression: "identifier.where(system='http://www.moi.gov.tw' or system='http://www.immigration.gov.tw' or system.startsWith('http://hl7.org/fhir/sid/passport-') or system='https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-temp-id').exists()"

Invariant: nidrs-pat-2
Description: "個案死亡(DEATH=true)時，死亡日期(DEATH_DAY)必填，故 deceasedBoolean 僅可為 false。"
Severity: #error
Expression: "deceased.ofType(boolean).exists() implies deceased.ofType(boolean) = false"

Invariant: nidrs-pat-3
Description: "國籍為本國籍(CITIZEN=0)時，不可填寫非本國籍居民身分(RESIDENCE_TYPE)。"
Severity: #error
Expression: "extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-citizen').where(value.code = '0').exists() implies extension('https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/nidrs-residence-type').empty()"

Profile: PatientNIDRS
Parent: TWCorePatient
Id: Patient-nidrs
Title: "通報個案-Patient NIDRS"
Description: "此通報個案-Patient NIDRS Profile說明本IG如何進一步定義臺灣核心-病人(TW Core Patient) Profile以呈現傳染病通報單之個案資料(Report_Common 個案資料、Report_ContactInfo)。"
* insert PatientNIDRSRules(1, 1)

Profile: PatientNIDRSDengueBulk
Parent: TWCorePatient
Id: Patient-nidrs-dengue-bulk
Title: "通報個案(登革熱大量通報)-Patient NIDRS Dengue Bulk"
Description: "此通報個案(登革熱大量通報)-Patient NIDRS Dengue Bulk Profile說明本IG如何進一步定義臺灣核心-病人(TW Core Patient) Profile以呈現登革熱大量通報時之個案資料。依附錄五，聯絡電話(公司或個人住家)與個案是否死亡調整為非必填(惟死亡日期仍維持相依性必填)。"
* insert PatientNIDRSRules(0, 0)

Profile: PatientNIDRSTBSample
Parent: TWCorePatient
Id: Patient-nidrs-tb-sample
Title: "TB送驗個案-Patient NIDRS TB Sample"
Description: "此TB送驗個案-Patient NIDRS TB Sample Profile說明本IG如何進一步定義臺灣核心-病人(TW Core Patient) Profile以呈現法傳TB送驗單(TB_SAMPLE)之個案資料。"
* ^version = "0.1.0"
* identifier 1..* MS
* identifier contains
    nhiCardNumber 0..1 MS and
    nidrsTempId 0..1 MS
* identifier[idCardNumber] MS
* identifier[idCardNumber] ^short = "身分證字號(IDNO)"
* identifier[residentNumber] MS
* identifier[passportNumber] MS
* identifier[nhiCardNumber] ^short = "健保卡序號(INSURANCENO)"
* identifier[nhiCardNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[nhiCardNumber].type.coding.code = #HC
* identifier[nhiCardNumber].system = $NHICard
* identifier[nhiCardNumber].value 1..1
* identifier[nidrsTempId].use = #temp
* identifier[nidrsTempId].type.coding.system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-identifier-type"
* identifier[nidrsTempId].type.coding.code = #nidrs-temp
* identifier[nidrsTempId].system = $NIDRSTempId
* identifier[nidrsTempId].value 1..1
* identifier[medicalRecord] MS
* identifier[medicalRecord] ^short = "病歷號碼(PHCASENO)"
* name[usual] 1..1 MS
* name[usual].text 1..1 MS
* name[usual].text ^short = "姓名(NAME)"
* name[usual].text ^maxLength = 30
* gender MS
* gender ^short = "性別(SEX)：F→female、M→male"
* birthDate 1..1 MS
* birthDate ^short = "出生日期(BIRTHDAY)"
* extension[nationality] 1..1 MS
* extension[nationality] ^short = "國籍國家代碼(NATIONALITY)；本國請填寫中華民國「158」"
* extension[nationality].extension[code].value[x] from CDCCountry (extensible)
* address 1..1 MS
* address.extension contains NIDRSAdministrativeArea named adminArea 1..1 MS
* address.extension[adminArea].extension[town] 1..1
* address.text 1..1 MS
* address.text ^short = "居住詳細地址(ADDRESS)"
* address.text ^maxLength = 40
* obeys nidrs-pat-4

Invariant: nidrs-pat-4
Description: "TB送驗單性別(SEX)僅可為 F 女生或 M 男生。"
Severity: #error
Expression: "gender = 'female' or gender = 'male'"

// ============================================================
// 個案生母(RelatedPerson)
// ============================================================

Profile: RelatedPersonNIDRSMother
Parent: TWCoreRelatedPerson
Id: RelatedPerson-nidrs-mother
Title: "個案生母-RelatedPerson NIDRS Mother"
Description: "此個案生母-RelatedPerson NIDRS Mother Profile說明本IG如何進一步定義臺灣核心-關係人(TW Core RelatedPerson) Profile以呈現通報單個案生母資料(BIRTH_MOTHER_NAME、BIRTH_MOTHER_IDNO)。"
* ^version = "0.1.0"
* patient only Reference(PatientNIDRS or PatientNIDRSDengueBulk)
* relationship 1..* MS
* relationship = $v3-RoleCode#NMTH "natural mother"
* name 1..1 MS
* name.text 1..1 MS
* name.text ^short = "生母姓名(BIRTH_MOTHER_NAME)"
* name.text ^maxLength = 200
* identifier MS
* identifier ^short = "生母身分證統一編號/外來人口之居留證統一證號(BIRTH_MOTHER_IDNO)"
* identifier.system 1..1
* identifier.value 1..1
* identifier.value ^maxLength = 10

// ============================================================
// 機構(Organization)
// ============================================================

Profile: OrganizationNIDRSHospital
Parent: TWCoreOrganization
Id: Organization-nidrs-hospital
Title: "醫事機構-Organization NIDRS Hospital"
Description: "此醫事機構-Organization NIDRS Hospital Profile說明本IG如何進一步定義臺灣核心-機構(TW Core Organization) Profile以呈現通報單位(HOSPITAL)、送驗單位(SAMPLING_HOSPITAL)、轉至院所(TRANSFER_HOSPITAL)等醫事機構。"
* ^version = "0.1.0"
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains hospitalCode 1..1 MS
* identifier[hospitalCode] ^short = "醫事機構代碼(十碼章)"
* identifier[hospitalCode].type 1..1
* identifier[hospitalCode].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[hospitalCode].type.coding.code = #PRN
* identifier[hospitalCode].system 1..1
* identifier[hospitalCode].system = $TWOrgId
* identifier[hospitalCode].value 1..1
* identifier[hospitalCode].value ^maxLength = 11
* name MS
* name ^short = "醫事機構名稱(HOSPITAL_NAME)"
* name ^maxLength = 100
* address MS
* address ^short = "醫事機構地址(HOSPITAL_ADDRESS)"
* address.text ^maxLength = 100
* telecom MS
* telecom ^short = "送驗單位電子信箱(SAMPLING_HOSPITAL_EMAIL)等聯絡資料"

Profile: OrganizationNIDRSLab
Parent: TWCoreOrganization
Id: Organization-nidrs-lab
Title: "指定收件單位-Organization NIDRS Lab"
Description: "此指定收件單位-Organization NIDRS Lab Profile說明本IG如何進一步定義臺灣核心-機構(TW Core Organization) Profile以呈現送驗單之指定收件單位(RECEIVED_UNIT_TYPE、RECEIVED_UNIT)。"
* ^version = "0.1.0"
* type 1..1 MS
* type from CDCReceivedUnitType (required)
* type ^short = "指定收件單位類型(RECEIVED_UNIT_TYPE)：1 疾管署、6 認可實驗室"
* identifier 1..* MS
* identifier ^short = "指定收件單位代碼(RECEIVED_UNIT)：疾管署單位代碼或認可實驗室/指定檢驗機構代碼"
* identifier.system 1..1
* identifier.value 1..1
* identifier.value ^maxLength = 10
* name MS
* obeys nidrs-lab-1

Invariant: nidrs-lab-1
Description: "指定收件單位代碼須與指定收件單位類型一致：類型 1(疾管署)使用 CDCLabUnit 代碼；類型 6(認可實驗室)使用 CDCApprovedLab 或醫事機構代碼。"
Severity: #error
Expression: "(type.coding.where(code='1').exists() implies identifier.where(system='https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-lab-unit').exists()) and (type.coding.where(code='6').exists() implies identifier.where(system='https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-approved-lab' or system='https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw').exists())"

// ============================================================
// 醫事人員(Practitioner / PractitionerRole)
// ============================================================

Profile: PractitionerNIDRS
Parent: TWCorePractitioner
Id: Practitioner-nidrs
Title: "醫事人員-Practitioner NIDRS"
Description: "此醫事人員-Practitioner NIDRS Profile說明本IG如何進一步定義臺灣核心-健康照護服務提供者(TW Core Practitioner) Profile以呈現通報單登錄者(REPORTER_NAME)、診斷醫師(DIAGNOSTICIAN)及送驗人員(REQUESTER)。"
* ^version = "0.1.0"
* name 1..1 MS
* name.text 1..1 MS
* name.text ^short = "姓名(REPORTER_NAME/DIAGNOSTICIAN/REQUESTER)"
* name.text ^maxLength = 30

Profile: PractitionerRoleNIDRS
Parent: TWCorePractitionerRole
Id: PractitionerRole-nidrs
Title: "通報者/送驗人員角色-PractitionerRole NIDRS"
Description: "此通報者/送驗人員角色-PractitionerRole NIDRS Profile說明本IG如何進一步定義臺灣核心-健康照護服務提供者角色(TW Core PractitionerRole) Profile以呈現通報單登錄者與其所屬通報單位、通報者聯絡電話(HOSPITAL_CONTACT)，或送驗人員與送驗單位。"
* ^version = "0.1.0"
* practitioner 1..1 MS
* practitioner only Reference(PractitionerNIDRS)
* organization 1..1 MS
* organization only Reference(OrganizationNIDRSHospital)
* organization ^short = "通報單位(HOSPITAL)或送驗單位(SAMPLING_HOSPITAL)"
* telecom MS
* telecom ^short = "通報者聯絡電話(HOSPITAL_CONTACT)"
* telecom.value ^maxLength = 100

Profile: PractitionerRoleNIDRSReporter
Parent: PractitionerRoleNIDRS
Id: PractitionerRole-nidrs-reporter
Title: "通報者角色-PractitionerRole NIDRS Reporter"
Description: "此通報者角色-PractitionerRole NIDRS Reporter Profile說明通報單登錄者(REPORTER_NAME)、通報單位(HOSPITAL)及通報者聯絡電話(HOSPITAL_CONTACT，必填)。"
* ^version = "0.1.0"
* telecom 1..* MS
* telecom.value 1..1
