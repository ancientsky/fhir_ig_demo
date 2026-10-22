本頁列出「附錄二_法定傳染病增補欄位與檢核邏輯」(v1.42) 所轉換之 Questionnaire。各疾病之增補欄位(DISEASE_FIELD)以 [增補欄位填答-QuestionnaireResponse NIDRS](StructureDefinition-QuestionnaireResponse-nidrs.html) 傳送，`QuestionnaireResponse.questionnaire` 指向下表之 Questionnaire，`item.linkId` 即原規格之答題編號(KEY)，`answer.value[x]` 即答案值(VALUE)。

### 答案值轉換規則

| 原規格資料型別 | 原規格填寫方式 | Questionnaire item.type | QuestionnaireResponse answer |
|---|---|---|---|
| 布林型別 | `1`=勾選；不勾選則不傳送該答題編號 | boolean | `valueBoolean = true`（不勾選者不傳送該 item） |
| 文字型態 String/N | 字串，長度 N | string（maxLength = N） | `valueString` |
| 日期型別 | `yyyy/MM/dd`，長度 10 | date | `valueDate`（`yyyy-MM-dd`） |
| 數字型態 Number | 整數；備註說明可填小數者為小數 | integer / decimal | `valueInteger` / `valueDecimal` |
| 代碼型別 | 依附錄四代碼表之代碼字串 | string | `valueString`（代碼值） |

### 各疾病增補欄位

| 分類 | 疾病 | 疾病代碼 | Questionnaire | 答題數 | 檢核邏輯 |
|---|---|---|---|---|---|
| 第一類法定傳染病 | 天花 | `050` | [nidrs-supplement-050](Questionnaire-nidrs-supplement-050.html) | 5 | 無 |
| 第一類法定傳染病 | 嚴重急性呼吸道症候群 | `SARS` | [nidrs-supplement-SARS](Questionnaire-nidrs-supplement-SARS.html) | 131 | 有 |
| 第二類法定傳染病 | 桿菌性痢疾 | `004` | [nidrs-supplement-004](Questionnaire-nidrs-supplement-004.html) | 21 | 無 |
| 第二類法定傳染病 | 阿米巴性痢疾 | `006` | [nidrs-supplement-006](Questionnaire-nidrs-supplement-006.html) | 22 | 無 |
| 第二類法定傳染病 | 麻疹 | `055` | [nidrs-supplement-055](Questionnaire-nidrs-supplement-055.html) | 9 | 有 |
| 第二類法定傳染病 | 德國麻疹 | `056` | [nidrs-supplement-056](Questionnaire-nidrs-supplement-056.html) | 5 | 無 |
| 第二類法定傳染病 | 登革熱 | `061` | [nidrs-supplement-061](Questionnaire-nidrs-supplement-061.html) | 18 | 無 |
| 第二類法定傳染病 | 急性病毒性A型肝炎 | `0701` | [nidrs-supplement-0701](Questionnaire-nidrs-supplement-0701.html) | 5 | 無 |
| 第二類法定傳染病 | 多重抗藥性結核病 | `010m` | [nidrs-supplement-010m](Questionnaire-nidrs-supplement-010m.html) | 75 | 無 |
| 第二類法定傳染病 | M痘 | `MPXV` | [nidrs-supplement-MPXV](Questionnaire-nidrs-supplement-MPXV.html) | 3 | 無 |
| 第三類法定傳染病 | 結核病 | `010` | [nidrs-supplement-010](Questionnaire-nidrs-supplement-010.html) | 77 | 無 |
| 第三類法定傳染病 | 漢生病 | `030` | [nidrs-supplement-030](Questionnaire-nidrs-supplement-030.html) | 3 | 無 |
| 第三類法定傳染病 | 破傷風 | `037` | [nidrs-supplement-037](Questionnaire-nidrs-supplement-037.html) | 19 | 無 |
| 第三類法定傳染病 | 後天免疫缺乏症候群 | `042` | [nidrs-supplement-042](Questionnaire-nidrs-supplement-042.html) | 58 | 有 |
| 第三類法定傳染病 | HIV感染(含母子垂直感染疑似個案)(出生月齡18個月以下) | `044` | [nidrs-supplement-044-lt18m](Questionnaire-nidrs-supplement-044-lt18m.html) | 52 | 有 |
| 第三類法定傳染病 | HIV感染(含母子垂直感染疑似個案)(出生月齡18個月以上) | `044` | [nidrs-supplement-044-ge18m](Questionnaire-nidrs-supplement-044-ge18m.html) | 64 | 有 |
| 第三類法定傳染病 | 急性病毒性B型肝炎 | `0703` | [nidrs-supplement-0703](Questionnaire-nidrs-supplement-0703.html) | 11 | 有 |
| 第三類法定傳染病 | 急性病毒性C型肝炎 | `0705` | [nidrs-supplement-0705](Questionnaire-nidrs-supplement-0705.html) | 25 | 有 |
| 第三類法定傳染病 | 急性病毒性D型肝炎 | `070d` | [nidrs-supplement-070d](Questionnaire-nidrs-supplement-070d.html) | 3 | 無 |
| 第三類法定傳染病 | 急性病毒性E型肝炎 | `070e` | [nidrs-supplement-070e](Questionnaire-nidrs-supplement-070e.html) | 3 | 無 |
| 第三類法定傳染病 | 急性病毒性肝炎未定型 | `070x` | [nidrs-supplement-070x](Questionnaire-nidrs-supplement-070x.html) | 18 | 有 |
| 第三類法定傳染病 | 腸病毒感染併發重症 | `0749` | [nidrs-supplement-0749](Questionnaire-nidrs-supplement-0749.html) | 7 | 有 |
| 第三類法定傳染病 | 梅毒 | `090` | [nidrs-supplement-090](Questionnaire-nidrs-supplement-090.html) | 26 | 有 |
| 第三類法定傳染病 | 先天性梅毒 | `091` | [nidrs-supplement-091](Questionnaire-nidrs-supplement-091.html) | 35 | 有 |
| 第三類法定傳染病 | 淋病 | `098` | [nidrs-supplement-098](Questionnaire-nidrs-supplement-098.html) | 14 | 有 |
| 第三類法定傳染病 | 侵襲性b型嗜血桿菌感染症 | `3200` | [nidrs-supplement-3200](Questionnaire-nidrs-supplement-3200.html) | 8 | 有 |
| 第三類法定傳染病 | 退伍軍人病 | `4828` | [nidrs-supplement-4828](Questionnaire-nidrs-supplement-4828.html) | 0 | 有 |
| 第三類法定傳染病 | 先天性德國麻疹症候群 | `7710` | [nidrs-supplement-7710](Questionnaire-nidrs-supplement-7710.html) | 17 | 無 |
| 第三類法定傳染病 | 新生兒破傷風 | `7713` | [nidrs-supplement-7713](Questionnaire-nidrs-supplement-7713.html) | 0 | 有 |
| 第四類法定傳染病 | 布氏桿菌病 | `023` | [nidrs-supplement-023](Questionnaire-nidrs-supplement-023.html) | 13 | 有 |
| 第四類法定傳染病 | 李斯特菌症 | `027` | [nidrs-supplement-027](Questionnaire-nidrs-supplement-027.html) | 1 | 無 |
| 第四類法定傳染病 | 侵襲性肺炎鏈球菌感染症 | `0412` | [nidrs-supplement-0412](Questionnaire-nidrs-supplement-0412.html) | 38 | 有 |
| 第四類法定傳染病 | 庫賈氏病 | `0461` | [nidrs-supplement-0461](Questionnaire-nidrs-supplement-0461.html) | 3 | 無 |
| 第四類法定傳染病 | 水痘併發症 | `052VC` | [nidrs-supplement-052VC](Questionnaire-nidrs-supplement-052VC.html) | 19 | 有 |
| 第四類法定傳染病 | 鉤端螺旋體病 | `100` | [nidrs-supplement-100](Questionnaire-nidrs-supplement-100.html) | 6 | 有 |
| 第四類法定傳染病 | 流感併發重症 | `487a` | [nidrs-supplement-487a](Questionnaire-nidrs-supplement-487a.html) | 36 | 有 |
| 第四類法定傳染病 | 新冠併發重症 | `19SC` | [nidrs-supplement-19SC](Questionnaire-nidrs-supplement-19SC.html) | 44 | 有 |
| 第四類法定傳染病 | 兔熱病 | `021` | [nidrs-supplement-021](Questionnaire-nidrs-supplement-021.html) | 7 | 無 |
| 第五類法定傳染病 | 新型A型流感 | `NFluA` | [nidrs-supplement-NFluA](Questionnaire-nidrs-supplement-NFluA.html) | 25 | 有 |
| 第五類法定傳染病 | 中東呼吸症候群冠狀病毒感染症 | `NoCoV` | [nidrs-supplement-NoCoV](Questionnaire-nidrs-supplement-NoCoV.html) | 25 | 無 |
| 重點監視項目 | 狂犬病毒檢驗 | `071T` | [nidrs-supplement-071T](Questionnaire-nidrs-supplement-071T.html) | 6 | 無 |
