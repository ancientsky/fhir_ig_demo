// ============================================================
// 範例9：通報單送驗新增結果回覆(HISMsg04)－成功
// 情境：範例5(訊息 mh-sample-dengue)送驗新增成功，疾管署回覆送驗清單
// (ReturnData.SAMPLE)，送驗單編號由系統自動編號(15碼數字)。
// 本回覆不含個案、送驗人員及收件單位資源，故以 identifier/display 參照。
// ============================================================

Instance: specimen-dengue-created
InstanceOf: SpecimenNIDRS
Usage: #inline
Title: "送驗檢體-登革熱血清(送驗新增結果)"
Description: "送驗新增成功回覆之檢體範例：檢體類別 0 血清、採檢日、院內檢體編號，個案以身分證統一編號參照。"
* identifier[0].system = "https://www.ntuh.gov.tw/specimen-no"
* identifier[0].value = "S1150114-0007"
* extension[autopsy].valueBoolean = false
* status = #available
* type = CDCSpecimenType#0 "血清"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"
* collection.collectedDateTime = "2026-01-14T10:20:00+08:00"

Instance: sr-dengue-sample-created
InstanceOf: ServiceRequestNIDRSSample
Usage: #inline
Title: "法傳送驗單-登革熱(送驗新增結果)"
Description: "送驗新增成功回覆之送驗單範例：系統自動編號之送驗單編號(BarCode 115011400000123)、送驗單建立日(CREATE_DAY)。"
* identifier[barcode].type = CDCIdentifierType#lims-barcode "送驗單編號"
* identifier[barcode].system = $LIMSBarcode
* identifier[barcode].value = "115011400000123"
* extension[drugBeforeSampling].valueBoolean = false
* status = #active
* intent = #order
* code = $SCT#108252007 "Laboratory procedure"
* code.text = "傳染病檢驗送驗"
* reasonCode[0] = CDCTestDisease#061 "登革熱"
* subject.identifier.system = $MOI
* subject.identifier.value = "A223456781"
* subject.display = "張雅婷"
* authoredOn = "2026-01-14"
* requester.display = "林怡君(國立臺灣大學醫學院附設醫院 0401180014)"
* performer[0].identifier.system = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-lab-unit"
* performer[0].identifier.value = "22"
* performer[0].display = "衛生福利部疾病管制署檢體單一窗口"
* specimen[0] = Reference(specimen-dengue-created)
* supportingInfo[report].type = "Condition"
* supportingInfo[report].identifier.type = CDCIdentifierType#nidrs-report "NIDRS通報單號"
* supportingInfo[report].identifier.system = $NIDRSReportId
* supportingInfo[report].identifier.value = "1150123456789"

Instance: mh-response-sample-success
InstanceOf: MessageHeaderNIDRSResponse
Usage: #inline
Title: "通報單送驗新增結果訊息表頭-成功"
Description: "通報單送驗新增結果(HISMsg04)成功之訊息表頭範例：response.identifier 為範例5請求訊息之 MessageHeader.id。"
* eventCoding = CDCMessageEvent#HISMsg04 "通報單送驗新增結果"
* destination[0].name = "臺大醫院醫療資訊系統"
* destination[0].endpoint = "https://his.ntuh.example.org.tw/nidrs"
* destination[0].receiver.identifier.system = $TWOrgId
* destination[0].receiver.identifier.value = "0401180014"
* destination[0].receiver.display = "國立臺灣大學醫學院附設醫院"
* source.name = "疾病管制署傳染病通報系統"
* source.endpoint = "https://nidrs.example.cdc.gov.tw/emr/api"
* response.identifier = "mh-sample-dengue"
* response.code = #ok
* focus[0] = Reference(sr-dengue-sample-created)

Instance: bundle-response-sample-success
InstanceOf: BundleNIDRSResponse
Usage: #example
Title: "通報單送驗新增結果回覆-成功(HISMsg04)"
Description: "通報單送驗新增結果(HISMsg04)成功範例：回覆新增之法傳送驗單(含送驗單編號)及檢體。"
* identifier.system = $CDCBundleId
* identifier.value = "04011800140114103515002"
* type = #message
* timestamp = "2026-01-14T10:35:15.002+08:00"
* entry[0].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/MessageHeader/mh-response-sample-success"
* entry[0].resource = mh-response-sample-success
* entry[1].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/ServiceRequest/sr-dengue-sample-created"
* entry[1].resource = sr-dengue-sample-created
* entry[2].fullUrl = "https://ancientsky.github.io/fhir_ig_demo/Specimen/specimen-dengue-created"
* entry[2].resource = specimen-dengue-created
