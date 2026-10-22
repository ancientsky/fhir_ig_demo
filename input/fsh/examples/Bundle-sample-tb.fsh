// ============================================================
// 範例6：通報單送驗新增(EMRMsg04)－法傳TB送驗單(TB_SAMPLE)
// 情境：李建國(虛構)咳嗽逾三週，胸部 X 光異常，於 2026-03-09 晨間採痰，
// 2026-03-10 由馬偕紀念醫院送驗抹片及培養至疾管署；尚未使用抗結核藥物。
// ============================================================

Instance: patient-tb
InstanceOf: PatientNIDRSTBSample
Usage: #inline
Title: "TB送驗個案-李建國"
Description: "法傳TB送驗單個案範例：身分證字號、健保卡序號、病歷號碼、國籍及居住地址(含縣市、鄉鎮市區代碼)。"
* insert ExIdCardNumber(A112580327)
* identifier[nhiCardNumber].use = #official
* identifier[nhiCardNumber].type = $v2-0203#HC
* identifier[nhiCardNumber].system = $NHICard
* identifier[nhiCardNumber].value = "000012345678"
* identifier[medicalRecord].use = #official
* identifier[medicalRecord].type = $v2-0203#MR
* identifier[medicalRecord].system = "https://www.mmh.org.tw/mrn"
* identifier[medicalRecord].value = "M0098765"
* extension[nationality].extension[code].valueCodeableConcept = CDCCountry#158 "中華民國"
* name[usual].use = #usual
* name[usual].text = "李建國"
* gender = #male
* birthDate = "1958-03-02"
* address.use = #home
* address.extension[adminArea].extension[county].valueCoding = CDCCounty#63000 "台北市"
* address.extension[adminArea].extension[town].valueCoding = CDCTown#63000040 "台北市中山區"
* address.text = "臺北市中山區正守里民生東路一段25號4樓"
* address.district = "臺北市"
* address.city = "中山區"
* address.line = "民生東路一段25號4樓"
* address.country = "TW"

Instance: specimen-tb
InstanceOf: SpecimenNIDRSTB
Usage: #inline
Title: "TB送驗檢體-痰"
Description: "法傳TB送驗單檢體範例：結核病檢體類別 14 痰，採檢日 2026-03-09。"
* identifier[0].system = "https://www.mmh.org.tw/specimen-no"
* identifier[0].value = "TB1150309-0042"
* status = #available
* type = CDCTBSpecimenType#14 "痰"
* subject = Reference(patient-tb) "李建國"
* collection.collectedDateTime = "2026-03-09T07:30:00+08:00"

Instance: sr-tb-sample
InstanceOf: ServiceRequestNIDRSTBSample
Usage: #inline
Title: "法傳TB送驗單"
Description: "法傳TB送驗單(TB_SAMPLE)範例：送驗項目 0 抹片、1 培養，抗結核菌藥物 N 未用藥物，送驗日 2026-03-10，指定收件單位為疾管署(類型 1)。"
* extension[tbMedicineUse].valueCodeableConcept = CDCTBMedicineUse#N "未用藥物"
* status = #active
* intent = #order
* code = $SCT#108252007 "Laboratory procedure"
* code.text = "傳染病檢驗送驗"
* orderDetail[0] = CDCTBTestItem#0 "抹片"
* orderDetail[1] = CDCTBTestItem#1 "培養"
// reasonCode(送驗疾病 010 結核病)由 ServiceRequestNIDRSTBSample 之固定值自動帶入
* subject = Reference(patient-tb) "李建國"
* authoredOn = "2026-03-10"
* requester = Reference(role-mmh-requester) "吳佩珊"
* performer[0] = Reference(org-cdc-lab-22) "衛生福利部疾病管制署檢體單一窗口"
* specimen[0] = Reference(specimen-tb)
* supportingInfo[report].type = "Condition"
* supportingInfo[report].identifier.type = CDCIdentifierType#nidrs-report "NIDRS通報單號"
* supportingInfo[report].identifier.system = $NIDRSReportId
* supportingInfo[report].identifier.value = "1150309004567"
* note[0].text = "咳嗽逾三週，胸部X光右上肺葉浸潤。"

Instance: mh-sample-tb
InstanceOf: MessageHeaderNIDRSSample
Usage: #inline
Title: "通報單送驗新增訊息表頭-法傳TB送驗單"
Description: "通報單送驗新增作業(EMRMsg04)之訊息表頭範例(法傳TB送驗單)。"
* eventCoding = CDCMessageEvent#EMRMsg04 "通報單送驗"
* destination[0].name = "疾病管制署傳染病通報系統"
* destination[0].endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* sender = Reference(org-mmh) "馬偕紀念醫院"
* source.name = "馬偕紀念醫院醫療資訊系統"
* source.endpoint = "https://his.mmh.example.org.tw/nidrs"
* focus[0] = Reference(sr-tb-sample)

Instance: bundle-sample-tb
InstanceOf: BundleNIDRSSample
Usage: #example
Title: "通報單送驗新增訊息-法傳TB送驗單(EMRMsg04)"
Description: "通報單送驗新增作業(EMRMsg04)範例：馬偕紀念醫院送驗結核病痰檢體(抹片、培養)。"
* identifier.system = $CDCBundleId
* identifier.value = "11011000110310091508001"
* type = #message
* timestamp = "2026-03-10T09:15:08.001+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-sample-tb"
* entry[0].resource = mh-sample-tb
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/ServiceRequest/sr-tb-sample"
* entry[1].resource = sr-tb-sample
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Specimen/specimen-tb"
* entry[2].resource = specimen-tb
* entry[3].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Patient/patient-tb"
* entry[3].resource = patient-tb
* entry[4].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Organization/org-mmh"
* entry[4].resource = org-mmh
* entry[5].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Organization/org-cdc-lab-22"
* entry[5].resource = org-cdc-lab-22
* entry[6].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Practitioner/prac-mmh-requester"
* entry[6].resource = prac-mmh-requester
* entry[7].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/PractitionerRole/role-mmh-requester"
* entry[7].resource = role-mmh-requester
