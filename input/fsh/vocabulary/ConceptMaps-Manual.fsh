// 本 IG 手動定義之概念對應(NIDRS 原規格代碼 → FHIR 代碼)

Instance: cdc-gender-to-administrative-gender
InstanceOf: ConceptMap
Usage: #definition
Title: "性別代碼對應"
Description: "NIDRS 性別(GENDER/SEX)與 FHIR AdministrativeGender 之對應(同 TWIDIR twcdc-gender)。"
* url = "https://ancientsky.github.io/fhir_ig_demo/ConceptMap/cdc-gender-to-administrative-gender"
* name = "CDCGenderToAdministrativeGender"
* title = "性別代碼對應"
* status = #active
* experimental = false
* date = "2026-09-29"
* version = "0.1.0"
* sourceCanonical = "https://ancientsky.github.io/fhir_ig_demo/ValueSet/cdc-gender"
* targetCanonical = "http://hl7.org/fhir/ValueSet/administrative-gender"
* group[0].source = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-gender"
* group[0].target = "http://hl7.org/fhir/administrative-gender"
* group[0].element[0].code = #F
* group[0].element[0].display = "女"
* group[0].element[0].target[0].code = #female
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[1].code = #M
* group[0].element[1].display = "男"
* group[0].element[1].target[0].code = #male
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[2].code = #X
* group[0].element[2].display = "第三性別"
* group[0].element[2].target[0].code = #other
* group[0].element[2].target[0].equivalence = #wider

Instance: cdc-marital-status-to-v3
InstanceOf: ConceptMap
Usage: #definition
Title: "婚姻狀況代碼對應"
Description: "NIDRS 婚姻狀況(MARRIAGE)與 HL7 v3-MaritalStatus 之對應。"
* url = "https://ancientsky.github.io/fhir_ig_demo/ConceptMap/cdc-marital-status-to-v3"
* name = "CDCMaritalStatusToV3"
* title = "婚姻狀況代碼對應"
* status = #active
* experimental = false
* date = "2026-09-29"
* version = "0.1.0"
* sourceCanonical = "https://ancientsky.github.io/fhir_ig_demo/ValueSet/cdc-marital-status"
* targetCanonical = "http://hl7.org/fhir/ValueSet/marital-status"
* group[0].source = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-marital-status"
* group[0].target = "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"
* group[0].element[0].code = #1
* group[0].element[0].display = "未婚"
* group[0].element[0].target[0].code = #U
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[1].code = #2
* group[0].element[1].display = "已婚"
* group[0].element[1].target[0].code = #M
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[2].code = #3
* group[0].element[2].display = "喪偶"
* group[0].element[2].target[0].code = #W
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[3].code = #4
* group[0].element[3].display = "離婚"
* group[0].element[3].target[0].code = #D
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[4].code = #5
* group[0].element[4].display = "分居"
* group[0].element[4].target[0].code = #L
* group[0].element[4].target[0].equivalence = #equivalent
* group[0].element[5].code = #9
* group[0].element[5].display = "未知"
* group[1].source = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-marital-status"
* group[1].target = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor"
* group[1].element[0].code = #9
* group[1].element[0].display = "未知"
* group[1].element[0].target[0].code = #UNK
* group[1].element[0].target[0].equivalence = #equivalent

Instance: cdc-contact-type-to-contactpoint
InstanceOf: ConceptMap
Usage: #definition
Title: "聯絡資料類型對應"
Description: "NIDRS 聯絡資料類型(CONTACT_TYPE)與 FHIR ContactPoint.use 之對應；兩者 ContactPoint.system 皆為 phone。"
* url = "https://ancientsky.github.io/fhir_ig_demo/ConceptMap/cdc-contact-type-to-contactpoint"
* name = "CDCContactTypeToContactPoint"
* title = "聯絡資料類型對應"
* status = #active
* experimental = false
* date = "2026-09-29"
* version = "0.1.0"
* group[0].source = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-contact-type"
* group[0].target = "http://hl7.org/fhir/contact-point-use"
* group[0].element[0].code = #0
* group[0].element[0].display = "連絡電話"
* group[0].element[0].target[0].code = #home
* group[0].element[0].target[0].equivalence = #wider
* group[0].element[0].target[0].comment = "ContactPoint.system = phone；公司電話亦以此表達"
* group[0].element[1].code = #1
* group[0].element[1].display = "手機"
* group[0].element[1].target[0].code = #mobile
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[1].target[0].comment = "ContactPoint.system = phone"

Instance: cdc-patient-movement-to-encounter-class
InstanceOf: ConceptMap
Usage: #definition
Title: "病患動向與就醫類別對應"
Description: "NIDRS 病患動向與 Encounter.class(v3-ActCode)之對應。無就醫(none)者不產生 Encounter 之就醫類別，僅以病患動向擴充表達。"
* url = "https://ancientsky.github.io/fhir_ig_demo/ConceptMap/cdc-patient-movement-to-encounter-class"
* name = "CDCPatientMovementToEncounterClass"
* title = "病患動向與就醫類別對應"
* status = #active
* experimental = false
* date = "2026-09-29"
* version = "0.1.0"
* sourceCanonical = "https://ancientsky.github.io/fhir_ig_demo/ValueSet/cdc-patient-movement"
* group[0].source = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-patient-movement"
* group[0].target = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* group[0].element[0].code = #outpatient
* group[0].element[0].target[0].code = #AMB
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[1].code = #emergency
* group[0].element[1].target[0].code = #EMER
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[2].code = #general-ward
* group[0].element[2].target[0].code = #IMP
* group[0].element[2].target[0].equivalence = #narrower
* group[0].element[2].target[0].comment = "住院類別(IMP)涵蓋多種病患動向，細分以病患動向擴充表達"
* group[0].element[3].code = #icu
* group[0].element[3].target[0].code = #IMP
* group[0].element[3].target[0].equivalence = #narrower
* group[0].element[3].target[0].comment = "住院類別(IMP)涵蓋多種病患動向，細分以病患動向擴充表達"
* group[0].element[4].code = #isolation-room
* group[0].element[4].target[0].code = #IMP
* group[0].element[4].target[0].equivalence = #narrower
* group[0].element[4].target[0].comment = "住院類別(IMP)涵蓋多種病患動向，細分以病患動向擴充表達"
* group[0].element[5].code = #discharged
* group[0].element[5].target[0].code = #IMP
* group[0].element[5].target[0].equivalence = #narrower
* group[0].element[5].target[0].comment = "出院者以 Encounter.status = finished、period.end = 出院日表達"
* group[0].element[6].code = #transfer
* group[0].element[6].target[0].code = #IMP
* group[0].element[6].target[0].equivalence = #narrower
* group[0].element[6].target[0].comment = "轉院者以 hospitalization.destination、hospitalization.dischargeDisposition = other-hcf 表達"
* group[0].element[7].code = #none
* group[0].element[7].target[0].equivalence = #unmatched

Instance: cdc-determine-status-to-condition-ver-status
InstanceOf: ConceptMap
Usage: #definition
Title: "研判結果與病情確認狀態對應"
Description: "NIDRS 研判結果代碼(DetermineStatus，仍在使用者)與 FHIR Condition.verificationStatus 之建議對應。"
* url = "https://ancientsky.github.io/fhir_ig_demo/ConceptMap/cdc-determine-status-to-condition-ver-status"
* name = "CDCDetermineStatusToConditionVerStatus"
* title = "研判結果與病情確認狀態對應"
* status = #active
* experimental = false
* date = "2026-09-29"
* version = "0.1.0"
* sourceCanonical = "https://ancientsky.github.io/fhir_ig_demo/ValueSet/cdc-determine-status"
* targetCanonical = "http://hl7.org/fhir/ValueSet/condition-ver-status"
* group[0].source = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-determine-status"
* group[0].target = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* group[0].element[0].code = #0
* group[0].element[0].display = "尚無研判結果"
* group[0].element[0].target[0].code = #unconfirmed
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[1].code = #11
* group[0].element[1].display = "可能病例"
* group[0].element[1].target[0].code = #provisional
* group[0].element[1].target[0].equivalence = #wider
* group[0].element[2].code = #22
* group[0].element[2].display = "極可能病例"
* group[0].element[2].target[0].code = #provisional
* group[0].element[2].target[0].equivalence = #wider
* group[0].element[3].code = #30
* group[0].element[3].display = "確定病例"
* group[0].element[3].target[0].code = #confirmed
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[4].code = #31
* group[0].element[4].display = "不符合疾病分類"
* group[0].element[4].target[0].code = #refuted
* group[0].element[4].target[0].equivalence = #equivalent
* group[0].element[5].code = #32
* group[0].element[5].display = "檢出法傳病原體"
* group[0].element[5].target[0].code = #provisional
* group[0].element[5].target[0].equivalence = #wider
* group[0].element[6].code = #33
* group[0].element[6].display = "未檢出法傳病原體"
* group[0].element[6].target[0].code = #provisional
* group[0].element[6].target[0].equivalence = #wider
* group[0].element[7].code = #34
* group[0].element[7].display = "無檢驗結果"
* group[0].element[7].target[0].code = #unconfirmed
* group[0].element[7].target[0].equivalence = #wider
