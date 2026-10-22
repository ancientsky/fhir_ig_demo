// ============================================================
// 範例共用資源：醫事機構、指定收件單位、醫事人員及其角色
// 所有人物、電話與病歷號碼皆為虛構，僅供示範。
// ============================================================

// ---- 範例用規則集 ----

RuleSet: ExIdCardNumber(value)
* identifier[idCardNumber].use = #official
* identifier[idCardNumber].type = $v2-0203#NNxxx
* identifier[idCardNumber].type.coding[0].code.extension[identifier-suffix].extension[suffix].valueString = "TWN"
* identifier[idCardNumber].type.coding[0].code.extension[identifier-suffix].extension[valueSet].valueCanonical = "http://hl7.org/fhir/ValueSet/iso3166-1-3"
* identifier[idCardNumber].system = $MOI
* identifier[idCardNumber].value = "{value}"

RuleSet: ExHospitalCode(code)
* identifier[hospitalCode].use = #official
* identifier[hospitalCode].type = $v2-0203#PRN
* identifier[hospitalCode].system = $TWOrgId
* identifier[hospitalCode].value = "{code}"

RuleSet: ExReportIdIdentifier(value)
* identifier[reportId].use = #official
* identifier[reportId].type = CDCIdentifierType#nidrs-report "NIDRS通報單號"
* identifier[reportId].system = $NIDRSReportId
* identifier[reportId].value = "{value}"

// ---- 醫事機構 ----

Instance: org-ntuh
InstanceOf: OrganizationNIDRSHospital
Usage: #example
Title: "通報單位-國立臺灣大學醫學院附設醫院"
Description: "通報單位(HOSPITAL)及送驗單位(SAMPLING_HOSPITAL)範例：國立臺灣大學醫學院附設醫院，醫事機構代碼 0401180014。"
* insert ExHospitalCode(0401180014)
* active = true
* name = "國立臺灣大學醫學院附設醫院"
* telecom[0].system = #phone
* telecom[0].value = "02-23123456"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "nidrs-ic@ntuh.example.org.tw"
* telecom[1].use = #work
* address.use = #work
* address.text = "臺北市中正區中山南路7號"
* address.district = "臺北市"
* address.city = "中正區"
* address.line = "中山南路7號"
* address.country = "TW"

Instance: org-ncku
InstanceOf: OrganizationNIDRSHospital
Usage: #example
Title: "通報單位-國立成功大學醫學院附設醫院"
Description: "登革熱大量通報範例之通報單位：國立成功大學醫學院附設醫院，醫事機構代碼 0421040011。"
* insert ExHospitalCode(0421040011)
* active = true
* name = "國立成功大學醫學院附設醫院"
* telecom[0].system = #phone
* telecom[0].value = "06-2353535"
* telecom[0].use = #work
* address.use = #work
* address.text = "臺南市北區勝利路138號"
* address.district = "臺南市"
* address.city = "北區"
* address.line = "勝利路138號"
* address.country = "TW"

Instance: org-mmh
InstanceOf: OrganizationNIDRSHospital
Usage: #example
Title: "送驗單位-馬偕紀念醫院"
Description: "法傳TB送驗單範例之送驗單位(SAMPLING_HOSPITAL)：馬偕紀念醫院，醫事機構代碼 1101100011。"
* insert ExHospitalCode(1101100011)
* active = true
* name = "馬偕紀念醫院"
* telecom[0].system = #phone
* telecom[0].value = "02-25433535"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "tb-lab@mmh.example.org.tw"
* telecom[1].use = #work
* address.use = #work
* address.text = "臺北市中山區中山北路二段92號"
* address.district = "臺北市"
* address.city = "中山區"
* address.line = "中山北路二段92號"
* address.country = "TW"

// ---- 指定收件單位 ----

Instance: org-cdc-lab-22
InstanceOf: OrganizationNIDRSLab
Usage: #example
Title: "指定收件單位-疾管署檢體單一窗口"
Description: "送驗單指定收件單位範例：指定收件單位類型 1(疾管署)，指定收件單位代碼 22(檢體單一窗口)。"
* type = CDCReceivedUnitType#1 "疾管署"
* identifier[0].system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-lab-unit"
* identifier[0].value = "22"
* active = true
* name = "衛生福利部疾病管制署檢體單一窗口"

// ---- 醫事人員：臺大醫院 ----

Instance: prac-ntuh-reporter
InstanceOf: PractitionerNIDRS
Usage: #example
Title: "通報單登錄者-林怡君"
Description: "通報單登錄者(REPORTER_NAME)及送驗人員(REQUESTER)範例：臺大醫院感染管制中心護理師林怡君(虛構人物)。"
* active = true
* name.use = #official
* name.text = "林怡君"
* telecom[0].system = #phone
* telecom[0].value = "02-23123456#62345"
* telecom[0].use = #work

Instance: prac-ntuh-doctor
InstanceOf: PractitionerNIDRS
Usage: #example
Title: "診斷醫師-王志明"
Description: "診斷醫師(DIAGNOSTICIAN)範例：臺大醫院感染科主治醫師王志明(虛構人物)。"
* active = true
* name.use = #official
* name.text = "王志明"

Instance: role-ntuh-reporter
InstanceOf: PractitionerRoleNIDRSReporter
Usage: #example
Title: "通報者角色-林怡君(臺大醫院)"
Description: "通報單登錄者林怡君所屬通報單位(臺大醫院)及通報者聯絡電話(HOSPITAL_CONTACT)；亦作為送驗單之送驗人員與送驗單位。"
* active = true
* practitioner = Reference(prac-ntuh-reporter) "林怡君"
* organization = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* telecom[0].system = #phone
* telecom[0].value = "02-23123456#62345"
* telecom[0].use = #work

// ---- 醫事人員：成大醫院 ----

Instance: prac-ncku-reporter
InstanceOf: PractitionerNIDRS
Usage: #example
Title: "通報單登錄者-陳淑芬"
Description: "登革熱大量通報範例之通報單登錄者：成大醫院感染管制中心護理師陳淑芬(虛構人物)。"
* active = true
* name.use = #official
* name.text = "陳淑芬"

Instance: prac-ncku-doctor
InstanceOf: PractitionerNIDRS
Usage: #example
Title: "診斷醫師-黃俊傑"
Description: "登革熱大量通報範例之診斷醫師：成大醫院急診部主治醫師黃俊傑(虛構人物)。"
* active = true
* name.use = #official
* name.text = "黃俊傑"

Instance: role-ncku-reporter
InstanceOf: PractitionerRoleNIDRSReporter
Usage: #example
Title: "通報者角色-陳淑芬(成大醫院)"
Description: "登革熱大量通報範例之通報者角色：陳淑芬所屬通報單位(成大醫院)及通報者聯絡電話。"
* active = true
* practitioner = Reference(prac-ncku-reporter) "陳淑芬"
* organization = Reference(org-ncku) "國立成功大學醫學院附設醫院"
* telecom[0].system = #phone
* telecom[0].value = "06-2353535#3456"
* telecom[0].use = #work

// ---- 醫事人員：馬偕醫院 ----

Instance: prac-mmh-requester
InstanceOf: PractitionerNIDRS
Usage: #example
Title: "送驗人員-吳佩珊"
Description: "法傳TB送驗單範例之送驗人員(REQUESTER)：馬偕紀念醫院檢驗科醫檢師吳佩珊(虛構人物)。"
* active = true
* name.use = #official
* name.text = "吳佩珊"

Instance: role-mmh-requester
InstanceOf: PractitionerRoleNIDRS
Usage: #example
Title: "送驗人員角色-吳佩珊(馬偕紀念醫院)"
Description: "法傳TB送驗單範例之送驗人員吳佩珊及其送驗單位(馬偕紀念醫院)。"
* active = true
* practitioner = Reference(prac-mmh-requester) "吳佩珊"
* organization = Reference(org-mmh) "馬偕紀念醫院"
* telecom[0].system = #phone
* telecom[0].value = "02-25433535#2210"
* telecom[0].use = #work
