// ===== 個案(Patient) =====

Extension: NIDRSCitizen
Id: nidrs-citizen
Title: "國籍別(CITIZEN)"
Description: "通報個案國籍別：0-本國籍、1-非本國籍(Report_Common.CITIZEN)。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Patient"
* value[x] only Coding
* value[x] from CDCCitizen (required)

Extension: NIDRSResidenceType
Id: nidrs-residence-type
Title: "非本國籍居民身分(RESIDENCE_TYPE)"
Description: "非本國籍居民身分(居留代碼)；選擇其他時，請於 text 填寫非本國籍居民身分說明(RESIDENCE_TYPE_OTHER)。「國籍」為本國籍時不可填寫。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Patient"
* value[x] only CodeableConcept
* value[x] from CDCResidenceType (required)

Extension: NIDRSAdministrativeArea
Id: nidrs-admin-area
Title: "居住縣市/鄉鎮市區/村里代碼"
Description: "以疾管署「縣市代碼(含鄉鎮市區.村里)」表達之居住地區(RESIDENCE_COUNTY、RESIDENCE_TOWN、RESIDENCE_VILLAGE)。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Address"
* extension contains
    county 1..1 MS and
    town 0..1 MS and
    village 0..1 MS
* extension[county] ^short = "居住縣市(RESIDENCE_COUNTY)"
* extension[county].value[x] only Coding
* extension[county].value[x] from CDCCounty (required)
* extension[town] ^short = "鄉鎮市區(RESIDENCE_TOWN)"
* extension[town].value[x] only Coding
* extension[town].value[x] from CDCTown (required)
* extension[village] ^short = "居住村里(RESIDENCE_VILLAGE)"
* extension[village].value[x] only Coding
* extension[village].value[x] from CDCVillage (required)

// ===== 通報單(Composition) =====

Extension: NIDRSPHBReceivedDate
Id: nidrs-phb-received-date
Title: "衛生局收到日(PHB_RECEIVED_DAY)"
Description: "衛生局收到通報單之日期。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Composition"
* ^context[1].type = #element
* ^context[1].expression = "Condition"
* value[x] only date

Extension: NIDRSCDCReceivedDate
Id: nidrs-cdc-received-date
Title: "建檔日(CDC_RECEIVED_DATE)"
Description: "疾管署傳染病通報系統建檔日(研判結果主動通知 ReportDetermineResult.CDC_RECEIVED_DATE)。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Condition"
* value[x] only date

Extension: NIDRSReportNote
Id: nidrs-report-note
Title: "通報單備註(NOTE)"
Description: "通報單備註；新增通報時可填寫，修改通報時不可填寫。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Composition"
* value[x] only string
* valueString ^maxLength = 250

Extension: NIDRSModifiedReason
Id: nidrs-modified-reason
Title: "修改原因(MODIFIED_REASON)"
Description: "通報單修改原因；修改通報時必填，新增通報時不可填寫。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Composition"
* value[x] only string
* valueString ^maxLength = 250

// ===== 通報疾病(Condition) =====

Extension: NIDRSHasSymptom
Id: nidrs-has-symptom
Title: "有無症狀(HAS_SYMPTOM)"
Description: "通報個案有無症狀；若有症狀，發病日必填並請以 Condition.evidence 填寫主要症狀(DISEASE_SYMPTOM)；若無症狀，「無發病日」需為 true。通報結核病時本欄位與主要症狀不可填寫。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Condition"
* value[x] only boolean

Extension: NIDRSNoOnsetDate
Id: nidrs-no-onset-date
Title: "無發病日(NO_SICK_DAY)"
Description: "通報個案無發病日；為 true 時，不可填寫發病日期(Condition.onsetDateTime)。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Condition"
* value[x] only boolean

Extension: NIDRSDetermineResult
Id: nidrs-determine-result
Title: "研判結果(DetermineStatus)"
Description: "疾管署個案研判結果與研判時間(ReportDetermineResult.DetermineStatus、DetermineDate)。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Condition"
* extension contains
    status 1..1 MS and
    date 0..1 MS and
    nonconformReason 0..1 MS
* extension[status] ^short = "研判結果代碼(DetermineStatus)"
* extension[status].value[x] only CodeableConcept
* extension[status].value[x] from CDCDetermineStatus (required)
* extension[date] ^short = "研判時間(DetermineDate)"
* extension[date].value[x] only dateTime
* extension[nonconformReason] ^short = "研判結果為「不符合疾病分類」(31)之細項"
* extension[nonconformReason].value[x] only CodeableConcept
* extension[nonconformReason].value[x] from CDCDetermineNonconformReason (required)

// ===== 病患動向(Encounter) =====

Extension: NIDRSPatientMovement
Id: nidrs-patient-movement
Title: "病患動向"
Description: "通報時病患動向(HOSPITALIZED_OUTPATIENT、HOSPITALIZED_EMERGENCY、HOSPITALIZED_GENERAL_WARD、HOSPITALIZED_ICU、HOSPITALIZED_ISOLATION_ROOM、HOSPITALIZED_DISCHARGED、HOSPITALIZED_TRANSFER、HOSPITALIZED_NONE)。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only CodeableConcept
* value[x] from CDCPatientMovement (required)

// ===== 送驗(ServiceRequest / Specimen) =====

Extension: NIDRSAutopsy
Id: nidrs-autopsy
Title: "屍體解剖(ISCORPSEDISSECTION)"
Description: "檢體是否來自屍體解剖：false 否(預設值)、true 是。檢體類別與「屍體解剖」及「送驗疾病」三者須符合採檢手冊之定義。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "Specimen"
* value[x] only boolean

Extension: NIDRSDrugBeforeSampling
Id: nidrs-drug-before-sampling
Title: "採檢前投藥情形(DRUG_BEFORE_SAMPLING)"
Description: "採檢前是否投藥：false 否、true 是。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "ServiceRequest"
* value[x] only boolean

Extension: NIDRSTBMedicineUse
Id: nidrs-tb-medicine-use
Title: "抗結核菌藥物(TB_MEDICINE_USE_ID)"
Description: "TB 送驗個案抗結核菌藥物使用情形：N 未用藥物；1 服用<2週；2 服用>2週。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "ServiceRequest"
* value[x] only CodeableConcept
* value[x] from CDCTBMedicineUse (required)

Extension: NIDRSXpertReason
Id: nidrs-xpert-reason
Title: "疾管署分子快速檢測送驗原因(SampleReasonXPERT)"
Description: "TB 送驗項目為「疾管署分子快速檢測」時之送驗原因；選擇其他(15)時請於 text 填寫說明(SampleReasonXPERT_other)。"
* ^version = "0.1.0"
* ^context[0].type = #element
* ^context[0].expression = "ServiceRequest"
* value[x] only CodeableConcept
* value[x] from CDCXpertReason (required)
