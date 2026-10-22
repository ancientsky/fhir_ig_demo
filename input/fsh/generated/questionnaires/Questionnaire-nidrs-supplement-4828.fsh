Instance: nidrs-supplement-4828
InstanceOf: Questionnaire
Usage: #definition
Title: "法定傳染病增補欄位-退伍軍人病"
Description: "法定傳染病增補欄位-退伍軍人病(4828)之增補欄位(DISEASE_FIELD)。依據 NIDRS 電子病歷傳染病自動通報作業 2.0 附錄二 v1.42 自動產生。"
* url = "https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-4828"
* version = "0.1.0"
* name = "NIDRSSupplement4828"
* title = "法定傳染病增補欄位-退伍軍人病"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "fhir_ig_demo（非官方示範）"
* description = "第三類法定傳染病「法定傳染病增補欄位-退伍軍人病」之增補欄位。答題編號(KEY)即 item.linkId；以 QuestionnaireResponse 傳送答案值(VALUE)。"
* purpose = "**檢核邏輯** 通報狀態＝不可通報 If 勾選\"主要症狀.肺炎\" then 通報狀態＝可通報 End If"
* subjectType = #Patient
* useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[0].valueCodeableConcept = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#4828 "退伍軍人病"
