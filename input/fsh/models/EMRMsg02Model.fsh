// 表10 EMRMsg02：通報單修改作業傳送資料結構(EMRMsg02)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: EMRMsg02Model
Id: EMRMsg02Model
Title: "通報單修改作業傳送資料結構(EMRMsg02)之資料模型"
Description: "NIDRS 表10 傳染病通報單修改作業結構表-傳送資料結構(EMRMsg02)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* REPORT 1..1 BackboneElement "通報單" "通報單，一次可以修改一筆通報單。"
* REPORT.REPORT 1..1 BackboneElement "通報單個案共同欄位區塊" "通報單個案共同欄位區塊。"
* REPORT.REPORT.REPORT 1..1 ReportCommonModel "共同欄位" "共同欄位，欄位請參考通報單共同欄位(Report_Common)。原規格資料型態：Report_Common。"
* REPORT.REPORT.CONTACT_INFO 1..* ReportContactInfoModel "個案聯絡資料" "個案聯絡資料，欄位請參考通報單聯絡資料(Report_ContactInfo)。原規格資料型態：Report_ContactInfo。"
* REPORT.REPORT.TRAVEL 0..* ReportTravelModel "旅遊史" "旅遊史，欄位請參考通報單旅遊史(Report_Travel)；共同欄位的旅遊史為有時，需填寫。原規格資料型態：Report_Travel。"
* REPORT.REPORT.ANIMAL 0..* ReportAnimalModel "接觸動物史" "接觸動物史，欄位請參考通報單接觸動物史(Report_Animal)；共同欄位的動物接觸史為有時，需填寫。原規格資料型態：Report_Animal。"
* REPORT.DISEASE 1..1 BackboneElement "通報疾病區塊" "通報疾病區塊；修改作業不傳送 DISEASE_ID。"
* REPORT.DISEASE.DISEASE_SYMPTOM 0..* integer "主要症狀代碼" "疾病與主要症狀關聯代碼，請參考附錄四，若非疾病對應之代碼，則歸在其他(999)。原規格資料型態：int。"
* REPORT.DISEASE.DISEASE_SYMPTOM ^example.label = "範例"
* REPORT.DISEASE.DISEASE_SYMPTOM ^example.valueInteger = 2
* REPORT.DISEASE.DISEASE_SYMPTOM_OTHER 0..1 string "其他症狀" "當主要症狀含有其他時須填寫。原規格資料型態：String/100。"
* REPORT.DISEASE.DISEASE_SYMPTOM_OTHER ^maxLength = 100
* REPORT.DISEASE.DISEASE_FIELD 0..* BackboneElement "疾病增補填答" "疾病增補填答，欄位請參考附錄二_法定傳染病增補欄位與檢核邏輯。"
* REPORT.DISEASE.DISEASE_FIELD.KEY 1..1 string "答題編號" "答題編號。原規格資料型態：String/20。"
* REPORT.DISEASE.DISEASE_FIELD.KEY ^maxLength = 20
* REPORT.DISEASE.DISEASE_FIELD.KEY ^example.label = "範例"
* REPORT.DISEASE.DISEASE_FIELD.KEY ^example.valueString = "S_QN06111000_AN06111001"
* REPORT.DISEASE.DISEASE_FIELD.VALUE 1..1 string "答案值" "答案值。原規格資料型態：String/200。"
* REPORT.DISEASE.DISEASE_FIELD.VALUE ^maxLength = 200
* REPORT.DISEASE.DISEASE_FIELD.VALUE ^example.label = "範例"
* REPORT.DISEASE.DISEASE_FIELD.VALUE ^example.valueString = "1"

Mapping: EMRMsg02ModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "EMRMsg02 JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: EMRMsg02Model
Target: "http://hl7.org/fhir/R4"
* -> "Bundle-nidrs-report-update: Bundle；MessageHeader-nidrs-report-update: MessageHeader" "Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg02"
* REPORT -> "Composition-nidrs-report-update: Composition；MessageHeader-nidrs-report-update: MessageHeader.focus" "產生一份 Composition-nidrs-report-update"
* REPORT.REPORT -> "Composition-nidrs-report-update: Composition" "以共同欄位建立 Composition 及其 subject(Patient)、author、custodian、各 section 之 entry"
* REPORT.REPORT.REPORT -> "Composition-nidrs-report-update: Composition；Patient-nidrs: Patient；Condition-nidrs-update: Condition；Encounter-nidrs: Encounter" "逐欄對應見 Report_Common；修改作業時 REPORT(通報單號)與 MODIFIED_REASON 必填、NOTE 不可填"
* REPORT.REPORT.CONTACT_INFO -> "Patient-nidrs: Patient.telecom" "每一筆對應一個 Patient.telecom(phone 或 mobile slice)"
* REPORT.REPORT.TRAVEL -> "Observation-nidrs-travel: Observation；Composition-nidrs-report-update: Composition.section[epidemiology].entry[travel]" "每一筆旅遊史建立一筆 Observation-nidrs-travel"
* REPORT.REPORT.ANIMAL -> "Observation-nidrs-animal: Observation；Composition-nidrs-report-update: Composition.section[epidemiology].entry[animal]" "每一筆接觸動物建立一筆 Observation-nidrs-animal"
* REPORT.DISEASE -> "Composition-nidrs-report-update: Composition.section[disease]；Condition-nidrs-update: Condition" "原規格無 DISEASE_ID，惟 Condition.code 為必填：請填入原通報疾病代碼(即通報時之 DISEASE_ID / HISMsg01 REPORT_LIST.DISEASE_ID)，section[disease].entry 僅 1 筆"
* REPORT.DISEASE.DISEASE_SYMPTOM -> "Condition-nidrs-update: Condition.evidence.code.coding" "整數轉為代碼字串(system = CodeSystem cdc-symptom)"
* REPORT.DISEASE.DISEASE_SYMPTOM_OTHER -> "Condition-nidrs-update: Condition.evidence.code.text" "置於含 coding 999(其他) 之 evidence.code.text"
* REPORT.DISEASE.DISEASE_FIELD -> "QuestionnaireResponse-nidrs: QuestionnaireResponse.item；Composition-nidrs-report: Composition.section[supplement].entry" "依通報疾病建立 QuestionnaireResponse(questionnaire = https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-{疾病代碼})；item 須依 Questionnaire 之群組(section/group)階層巢狀"
* REPORT.DISEASE.DISEASE_FIELD.KEY -> "QuestionnaireResponse-nidrs: QuestionnaireResponse.item.linkId" "即 Questionnaire 之 item.linkId(最內層 item)"
* REPORT.DISEASE.DISEASE_FIELD.VALUE -> "QuestionnaireResponse-nidrs: QuestionnaireResponse.item.answer.value[x]" "依 Questionnaire item.type 轉換：boolean(答案值 1=勾選)→valueBoolean = true；date(yyyy/MM/dd)→valueDate(yyyy-MM-dd)；integer/decimal→valueInteger/valueDecimal；string/text→valueString"
