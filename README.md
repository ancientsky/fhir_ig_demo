# 臺灣法定傳染病電子病歷自動通報實作指引 (TWNIDRS IG) — 非官方示範

> **非官方示範聲明**：本IG為依據公開工作說明書所製作之非官方示範，非疾管署正式發布。
> 實際介接衛生福利部疾病管制署(疾管署)傳染病通報系統(NIDRS)時，請以疾管署公告之最新版工作說明書、Open API Spec 及正式通知為準。

本專案將衛生福利部疾病管制署「**NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書 V1.42**」(中華民國115年09月29日)及其附錄，轉換為 HL7® FHIR® R4 (4.0.1) 實作指引(Implementation Guide)，以 [FSH](https://build.fhir.org/ig/HL7/fhir-shorthand/) 撰寫，使用 [SUSHI](https://github.com/FHIR/sushi) 與 [HL7 IG Publisher](https://github.com/HL7/fhir-ig-publisher) 建置。

- 線上版(GitHub Pages)：<https://ancientsky.github.io/fhir_ig_demo/>
- 套件代碼：`tw.demo.nidrs`(版本 0.1.0)；canonical：`https://ancientsky.github.io/fhir_ig_demo`
- 相依：[TW Core IG 1.0.0](https://twcore.mohw.gov.tw/ig/twcore/1.0.0/)(`tw.gov.mohw.twcore`)
- 風格與命名慣例參考：[臺灣傳染病檢驗報告實作指引 TWIDIR](https://twidir.cdc.gov.tw/twidir/)(`tw.gov.mohw.cdc.twidir` 0.1.1)
- 授權：IG 內容 CC0-1.0；`source/` 下之原始文件權利屬衛生福利部疾病管制署

## 涵蓋範圍

| 功能 | 原規格訊息 | FHIR 訊息 Bundle Profile |
|---|---|---|
| 通報單新增 | EMRMsg01 / HISMsg01 | `Bundle-nidrs-report-create` / `Bundle-nidrs-response` |
| 通報單修改 | EMRMsg02 / HISMsg02 | `Bundle-nidrs-report-update` / `Bundle-nidrs-response` |
| 通報單病歷資料傳送 | EMRMsg03 / HISMsg03 | `Bundle-nidrs-document` / `Bundle-nidrs-response` |
| 通報單送驗新增 | EMRMsg04 / HISMsg04 | `Bundle-nidrs-sample` / `Bundle-nidrs-response` |
| 研判結果主動通知 | PushDetermineResult | `Bundle-nidrs-push-determine-result` |
| 檢驗結果主動通知 | PushSampleResult | `Bundle-nidrs-push-sample-result` |

另包含：附錄二疾病增補欄位(每一疾病一份 Questionnaire)、附錄四代碼彙整表(CodeSystem/ValueSet/ConceptMap)、附錄五登革熱大量通報 Profile。

## 目錄結構

```
.
├── sushi-config.yaml            # IG 設定(id、canonical、相依、頁面、選單)
├── ig.ini                       # IG Publisher 設定(template)
├── _genonce.sh                  # 以 IG Publisher 建置一次
├── _updatePublisher.sh          # 下載/更新 IG Publisher (input-cache/publisher.jar)
├── .github/workflows/           # GitHub Actions：建置並發布至 GitHub Pages
├── source/nidrs-emr2.0-v1.42/   # 原始規格：工作說明書與附錄(docx/xlsx)
├── scripts/
│   ├── gen_terminology.py       # 附錄四 xlsx → CodeSystem/ValueSet/ConceptMap FSH
│   └── gen_questionnaires.py    # 附錄二 docx → Questionnaire FSH 與 supplement-fields.md
└── input/
    ├── fsh/
    │   ├── aliases.fsh
    │   ├── profiles/            # Profile(訊息、通報單、送驗與結果回饋、參與者)
    │   ├── extensions/          # 擴充
    │   ├── vocabulary/          # 本文定義之本地代碼系統、值集與人工概念對應
    │   ├── models/              # 邏輯模型(原規格 JSON 結構)
    │   ├── capabilities/        # CapabilityStatement、MessageDefinition
    │   ├── examples/            # 範例
    │   └── generated/           # 由 scripts/ 產生，請勿手動修改
    ├── images/                  # 工作說明書流程圖
    └── pagecontent/             # IG 說明頁面(Markdown)
```

## 本機建置

需求：Python 3(`openpyxl`、`python-docx`)、Node.js(SUSHI)、Java 17 以上(IG Publisher)、Ruby + Jekyll(IG Publisher 產生網站時使用)。

```bash
# 1. 由原始附錄重新產生術語與增補欄位(若 source/ 未變更可略過)
pip install openpyxl python-docx
python3 scripts/gen_terminology.py
python3 scripts/gen_questionnaires.py

# 2. 編譯 FSH
npm install -g fsh-sushi
sushi build .

# 3. 以 IG Publisher 產生網站(輸出於 output/，入口為 output/index.html)
./_genonce.sh
#   或：./_updatePublisher.sh && java -jar input-cache/publisher.jar -ig .
#   離線時可加 -tx n/a
```

## 持續整合(CI)

`.github/workflows/` 中之 GitHub Actions 工作流程於 `main` 分支推送(或手動觸發)時：安裝 Java、Node.js(SUSHI)、Python、Jekyll → 重新執行兩支產生程式 → `sushi build .` → 執行 IG Publisher → 上傳 QA 報告 → 將 `output/` 發布至 GitHub Pages(<https://ancientsky.github.io/fhir_ig_demo/>)。首次使用時，請於 GitHub repo 之 Settings → Pages 將 Source 設為「GitHub Actions」。

## 改用正式 canonical

本示範之 canonical、套件代碼與識別碼系統(`https://ancientsky.github.io/fhir_ig_demo/sid/...`)皆非疾管署核定。若日後由權責機關正式發布，例如改為 canonical `https://nidrs.cdc.gov.tw/nidrs`、套件代碼 `tw.gov.mohw.cdc.nidrs`(依疾管署 IG 慣例之**假設**)，需修改：

1. `sushi-config.yaml`：`id`、`canonical`、`name`、`publisher`、`status`、`releaseLabel`；`ig.ini` 之 `ig` 路徑(`ImplementationGuide-<id>.json`)。
2. `scripts/gen_terminology.py`、`scripts/gen_questionnaires.py` 中之 `BASE` 常數，並重新執行兩支程式。
3. 手寫 FSH 中寫死之 URL：`input/fsh/aliases.fsh`(`$NIDRSReportId`、`$NIDRSTempId` 等識別碼系統)，以及 Profile invariant 之 FHIRPath、`code.coding.system`、ConceptMap、CapabilityStatement、MessageDefinition 及範例中之完整 URL。可用下列指令找出：
   ```bash
   grep -rl "ancientsky.github.io/fhir_ig_demo" sushi-config.yaml scripts input
   ```
4. 識別碼系統(通報單號、NIDRS 系統自動編碼證號等)應改用疾管署核定之 URI 或 NamingSystem。
5. 移除各頁面之「非官方示範」聲明，並更新 `input/pagecontent/index.md` 之作者與授權說明。

## 設計決策

1. **FHIR Messaging**：每次交換為 `Bundle.type = message`，`MessageHeader.eventCoding` 使用本地代碼系統 `cdc-message-event`(EMRMsg01~04、HISMsg01~04、PushDetermineResult、PushSampleResult)；回覆以 `MessageHeader.response` + `OperationOutcome` 表達(同 TWIDIR)。建議傳輸方式為 `POST [base]/$process-message`，訊息 Bundle 作為 JWS payload 以醫事機構憑證簽章(沿用原規格之 JWT 電子簽章)。
2. **一份通報單 = 一個 Composition**(LOINC 55751-2)，section 對應原規格之區塊；一次新增最多 10 份。
3. **一個通報疾病 = 一個 Condition**，通報單號(REPORT_ID)為 `Condition.identifier`，因疾管署依疾病分別產生通報單號。
4. **病患動向 = Encounter**：原規格 8 個布林欄位轉為一個代碼擴充，加護病房、隔離病房日期以 `Encounter.location.period` 表達。
5. **流行病學資料 = Observation**：職業、旅遊史、接觸動物史、暴露史、人口密集機構、死亡原因各有 Profile。
6. **附錄二增補欄位 = Questionnaire/QuestionnaireResponse**：由 docx 自動產生，答題編號(KEY)為 `linkId`，檢核邏輯以文字保留於 `Questionnaire.purpose`。
7. **附錄四代碼 = 自動產生之 CodeSystem/ValueSet/ConceptMap**：停用代碼以 `inactive` 屬性保留；已改由外部網站維護之代碼表(醫事機構代碼、認可實驗室/指定檢驗機構之可送驗疾病等)不轉換。
8. **可在單一 Resource 判斷之條件式規則以 invariant 表達**(`nidrs-pat-*`、`nidrs-con-*`、`nidrs-enc-*`、`nidrs-trv-1`、`nidrs-lab-1`、`nidrs-msg-1`)，跨 Resource 或需查詢疾管署資料者保留為疾管署端商業規則。
9. **重用 TWIDIR**：Bundle.identifier 規則、送驗單編號 system `https://lims.cdc.gov.tw/`、檢驗結果代碼 `twcdc-testresult-values`(以 canonical 參照，未列為套件相依)。
10. **附錄五登革熱大量通報**以獨立 Profile(`*-dengue-bulk`)表達必填欄位縮減。
11. 原規格未定義而由本IG自行假設之處(例如批次通報部分成功時之回覆方式、JWS header 內容)，皆於 IG 頁面中標示為「本IG建議」或「假設」。

## 免責聲明

本專案僅供 FHIR 實作研究與教學示範，不代表疾管署立場，亦不保證與疾管署現行系統相容。範例資料皆為虛構。
