// ============================================================
// 範例5：通報單送驗新增(EMRMsg04)－法傳送驗單(SAMPLE)
// 情境：範例1之登革熱個案(通報單號 1150123456789)於 2026-01-14 採集血清，
// 由臺大醫院送驗至疾管署檢體單一窗口；送驗單編號(BarCode)未填，
// 待送驗新增成功時由系統自動編號(見範例9)。
// ============================================================

Instance: specimen-dengue
InstanceOf: SpecimenNIDRS
Usage: #example
Title: "送驗檢體-登革熱血清"
Description: "法傳送驗單檢體範例：檢體類別 0 血清(符合送驗疾病 061 登革熱之檢體類別)、非屍體解剖、院內檢體編號。"
* identifier[0].system = "https://www.ntuh.gov.tw/specimen-no"
* identifier[0].value = "S1150114-0007"
* extension[autopsy].valueBoolean = false
* status = #available
* type = CDCSpecimenType#0 "血清"
* subject = Reference(patient-dengue) "張雅婷"
* collection.collectedDateTime = "2026-01-14T10:20:00+08:00"
* collection.collector = Reference(role-ntuh-reporter) "林怡君"

Instance: sr-dengue-sample
InstanceOf: ServiceRequestNIDRSSample
Usage: #example
Title: "法傳送驗單-登革熱"
Description: "法傳送驗單(SAMPLE)範例：送驗疾病 061 登革熱，以通報單號參照通報單，送驗人員為臺大醫院林怡君，指定收件單位為疾管署(類型 1)檢體單一窗口(22)。"
* extension[drugBeforeSampling].valueBoolean = false
* status = #active
* intent = #order
* code = $SCT#108252007 "Laboratory procedure"
* code.text = "傳染病檢驗送驗"
* reasonCode[0] = CDCTestDisease#061 "登革熱"
* subject = Reference(patient-dengue) "張雅婷"
* authoredOn = "2026-01-14T10:30:00+08:00"
* requester = Reference(role-ntuh-reporter) "林怡君"
* performer[0] = Reference(org-cdc-lab-22) "衛生福利部疾病管制署檢體單一窗口"
* specimen[0] = Reference(specimen-dengue)
* supportingInfo[report].type = "Condition"
* supportingInfo[report].identifier.type = CDCIdentifierType#nidrs-report "NIDRS通報單號"
* supportingInfo[report].identifier.system = $NIDRSReportId
* supportingInfo[report].identifier.value = "1150123456789"
* note[0].text = "個案 12/28-01/08 曾赴越南、泰國旅遊，NS1 快篩陽性。"

Instance: mh-sample-dengue
InstanceOf: MessageHeaderNIDRSSample
Usage: #example
Title: "通報單送驗新增訊息表頭-登革熱"
Description: "通報單送驗新增作業(EMRMsg04)之訊息表頭範例(法傳送驗單)。"
* eventCoding = CDCMessageEvent#EMRMsg04 "通報單送驗"
* destination[0].name = "疾病管制署傳染病通報系統"
* destination[0].endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* sender = Reference(org-ntuh) "國立臺灣大學醫學院附設醫院"
* source.name = "臺大醫院醫療資訊系統"
* source.endpoint = "https://his.ntuh.example.org.tw/nidrs"
* focus[0] = Reference(sr-dengue-sample)

Instance: bundle-sample
InstanceOf: BundleNIDRSSample
Usage: #example
Title: "通報單送驗新增訊息-法傳送驗單(EMRMsg04)"
Description: "通報單送驗新增作業(EMRMsg04)範例：登革熱個案血清檢體送驗至疾管署。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140114103512345"
* type = #message
* timestamp = "2026-01-14T10:35:12.345+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-sample-dengue"
* entry[0].resource = mh-sample-dengue
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/ServiceRequest/sr-dengue-sample"
* entry[1].resource = sr-dengue-sample
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Specimen/specimen-dengue"
* entry[2].resource = specimen-dengue
* entry[3].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Patient/patient-dengue"
* entry[3].resource = patient-dengue
* entry[4].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Organization/org-ntuh"
* entry[4].resource = org-ntuh
* entry[5].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Organization/org-cdc-lab-22"
* entry[5].resource = org-cdc-lab-22
* entry[6].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Practitioner/prac-ntuh-reporter"
* entry[6].resource = prac-ntuh-reporter
* entry[7].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/PractitionerRole/role-ntuh-reporter"
* entry[7].resource = role-ntuh-reporter
