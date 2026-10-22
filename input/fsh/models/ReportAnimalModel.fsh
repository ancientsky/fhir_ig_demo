// 表19 Report_Animal：通報單接觸動物史(Report_Animal)之資料模型
// 本檔由欄位對應定義產生；元素名稱即原 JSON 欄位名稱(保留大小寫)。
Logical: ReportAnimalModel
Id: ReportAnimalModel
Title: "通報單接觸動物史(Report_Animal)之資料模型"
Description: "NIDRS 表19 通報單接觸動物史(Report_Animal)之資料模型。"
* ^version = "0.1.0"
* ^status = #draft
* ANIMAL_ID 1..1 code "接觸動物種類" "接觸動物種類(代碼：動物代碼)。原規格資料型態：Code。"
* ANIMAL_ID from CDCAnimal (required)
* ANIMAL_ID ^example.label = "範例"
* ANIMAL_ID ^example.valueCode = #2
* ANIMAL_OTHER 0..1 string "其他接觸動物" "其他接觸動物；接觸動物種類代碼為其他，本欄位必填。原規格資料型態：String/120。"
* ANIMAL_OTHER ^maxLength = 120

Mapping: ReportAnimalModelToFHIR
Id: nidrs-to-fhir
Title: "NIDRS JSON → FHIR"
Description: "Report_Animal JSON 欄位與本 IG FHIR R4 Profile 元素之對應；格式為「Profile Id: FHIR 元素路徑」，註解為轉換說明。"
Source: ReportAnimalModel
Target: "http://hl7.org/fhir/R4"
* -> "Observation-nidrs-animal: Observation" "每一筆接觸動物建立一筆 Observation-nidrs-animal"
* ANIMAL_ID -> "Observation-nidrs-animal: Observation.valueCodeableConcept.coding" "coding.system = CodeSystem cdc-animal"
* ANIMAL_OTHER -> "Observation-nidrs-animal: Observation.valueCodeableConcept.text" "置於同一 CodeableConcept 之 text"
