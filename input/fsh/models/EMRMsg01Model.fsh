// 表8 EMRMsg01：通報單新增作業傳送資料結構(EMRMsg01)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: EMRMsg01Model
Id: EMRMsg01Model
Title: "通報單新增作業傳送資料結構(EMRMsg01)之資料模型"
Description: "NIDRS 表8 傳染病通報單新增作業結構表-傳送資料結構(EMRMsg01)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* REPORTS 1..10 BackboneElement "通報單" "通報單，可一次通報多筆個案，最多10筆。"
* REPORTS.REPORT 1..1 BackboneElement "通報單個案共同欄位區塊" "通報單個案共同欄位區塊。"
* REPORTS.REPORT.REPORT 1..1 ReportCommonModel "共同欄位" "共同欄位，欄位請參考通報單共同欄位(Report_Common)。原規格資料型態：Report_Common。"
* REPORTS.REPORT.CONTACT_INFO 1..* ReportContactInfoModel "個案聯絡資料" "個案聯絡資料，欄位請參考通報單聯絡資料(Report_ContactInfo)。原規格資料型態：Report_ContactInfo。"
* REPORTS.REPORT.TRAVEL 0..* ReportTravelModel "旅遊史" "旅遊史，欄位請參考通報單旅遊史(Report_Travel)；共同欄位的旅遊史為有時，需填寫。原規格資料型態：Report_Travel。"
* REPORTS.REPORT.ANIMAL 0..* ReportAnimalModel "接觸動物史" "接觸動物史，欄位請參考通報單接觸動物史(Report_Animal)；共同欄位的動物接觸史為有時，需填寫。原規格資料型態：Report_Animal。"
* REPORTS.DISEASE 1..1 BackboneElement "通報疾病區塊" "通報疾病區塊。"
* REPORTS.DISEASE.DISEASE_ID 1..10 string "通報疾病ID" "通報疾病ID，同一個案一次最多通報10個法定傳染病。原規格資料型態：String/10。"
* REPORTS.DISEASE.DISEASE_ID ^maxLength = 10
* REPORTS.DISEASE.DISEASE_ID from CDCDisease (required)
* REPORTS.DISEASE.DISEASE_ID ^example.label = "範例"
* REPORTS.DISEASE.DISEASE_ID ^example.valueString = "061"
* REPORTS.DISEASE.DISEASE_SYMPTOM 0..* integer "主要症狀代碼" "疾病與主要症狀關聯代碼，請參考附錄四_通報代碼彙整表之「疾病與主要症狀關連」及「症狀代碼」；若此欄位填寫非該疾病關聯之主要症狀代碼，NIDRS將自動將本欄位改填入其他代碼(999)，並將醫院上傳之症狀改填至「DISEASE_SYMPTOM_OTHER」欄位中。原規格資料型態：int。"
* REPORTS.DISEASE.DISEASE_SYMPTOM ^example.label = "範例"
* REPORTS.DISEASE.DISEASE_SYMPTOM ^example.valueInteger = 2
* REPORTS.DISEASE.DISEASE_SYMPTOM_OTHER 0..1 string "其他症狀" "當主要症狀含有其他代碼「999」時須填寫。原規格資料型態：String/100。"
* REPORTS.DISEASE.DISEASE_SYMPTOM_OTHER ^maxLength = 100
* REPORTS.DISEASE.DISEASE_FIELD 0..* BackboneElement "疾病增補填答" "疾病增補填答，欄位請參考附錄二_法定傳染病增補欄位與檢核邏輯。"
* REPORTS.DISEASE.DISEASE_FIELD.KEY 1..1 string "答題編號" "答題編號。原規格資料型態：String/200。"
* REPORTS.DISEASE.DISEASE_FIELD.KEY ^maxLength = 200
* REPORTS.DISEASE.DISEASE_FIELD.KEY ^example.label = "範例"
* REPORTS.DISEASE.DISEASE_FIELD.KEY ^example.valueString = "S_QN06111000_AN06111001"
* REPORTS.DISEASE.DISEASE_FIELD.VALUE 1..1 string "答案值" "答案值。原規格資料型態：String/200。"
* REPORTS.DISEASE.DISEASE_FIELD.VALUE ^maxLength = 200
* REPORTS.DISEASE.DISEASE_FIELD.VALUE ^example.label = "範例"
* REPORTS.DISEASE.DISEASE_FIELD.VALUE ^example.valueString = "1"

Mapping: EMRMsg01ModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "EMRMsg01 JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: EMRMsg01Model
Target: "http://hl7.org/fhir/R4"
* -> "Bundle-nidrs-report-create: Bundle；MessageHeader-nidrs-report-create: MessageHeader" "Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg01；原 JSON 以醫事機構憑證進行 JWT 簽章後傳送"
* REPORTS -> "Composition-nidrs-report: Composition；MessageHeader-nidrs-report-create: MessageHeader.focus" "每一筆 REPORTS 產生一份 Composition-nidrs-report(及其 Patient、Condition…)，MessageHeader.focus 依序參照(最多 10 筆)"
* REPORTS.REPORT -> "Composition-nidrs-report: Composition" "以共同欄位建立 Composition 及其 subject(Patient)、author、custodian、各 section 之 entry"
* REPORTS.REPORT.REPORT -> "Composition-nidrs-report: Composition；Patient-nidrs: Patient；Condition-nidrs: Condition；Encounter-nidrs: Encounter" "逐欄對應見 Report_Common"
* REPORTS.REPORT.CONTACT_INFO -> "Patient-nidrs: Patient.telecom" "每一筆對應一個 Patient.telecom(phone 或 mobile slice)"
* REPORTS.REPORT.TRAVEL -> "Observation-nidrs-travel: Observation；Composition-nidrs-report: Composition.section[epidemiology].entry[travel]" "每一筆旅遊史建立一筆 Observation-nidrs-travel"
* REPORTS.REPORT.ANIMAL -> "Observation-nidrs-animal: Observation；Composition-nidrs-report: Composition.section[epidemiology].entry[animal]" "每一筆接觸動物建立一筆 Observation-nidrs-animal"
* REPORTS.DISEASE -> "Composition-nidrs-report: Composition.section[disease]" "section.code = LOINC 11450-4"
* REPORTS.DISEASE.DISEASE_ID -> "Condition-nidrs: Condition.code.coding[cdcDisease].code；Composition-nidrs-report: Composition.section[disease].entry" "每一 DISEASE_ID 建立一筆 Condition(system = CodeSystem cdc-disease)；共同欄位之日期、症狀、診斷醫師複製至每一筆"
* REPORTS.DISEASE.DISEASE_SYMPTOM -> "Condition-nidrs: Condition.evidence.code.coding" "整數轉為代碼字串(system = CodeSystem cdc-symptom)，每一症狀一筆 coding；多疾病時依 ConceptMap cdc-disease-symptom 填入相關疾病之 Condition"
* REPORTS.DISEASE.DISEASE_SYMPTOM_OTHER -> "Condition-nidrs: Condition.evidence.code.text" "置於含 coding 999(其他) 之 evidence.code.text"
* REPORTS.DISEASE.DISEASE_FIELD -> "QuestionnaireResponse-nidrs: QuestionnaireResponse.item；Composition-nidrs-report: Composition.section[supplement].entry" "依通報疾病建立 QuestionnaireResponse(questionnaire = https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-{疾病代碼})；item 須依 Questionnaire 之群組(section/group)階層巢狀"
* REPORTS.DISEASE.DISEASE_FIELD.KEY -> "QuestionnaireResponse-nidrs: QuestionnaireResponse.item.linkId" "即 Questionnaire 之 item.linkId(最內層 item)"
* REPORTS.DISEASE.DISEASE_FIELD.VALUE -> "QuestionnaireResponse-nidrs: QuestionnaireResponse.item.answer.value[x]" "依 Questionnaire item.type 轉換：boolean(答案值 1=勾選)→valueBoolean = true；date(yyyy/MM/dd)→valueDate(yyyy-MM-dd)；integer/decimal→valueInteger/valueDecimal；string/text→valueString"
