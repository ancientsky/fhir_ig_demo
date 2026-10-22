### 結構定義與範例檔

實作者若不偏好使用 FHIR RESTful API 驗證資料是否符合 Profiles，可直接下載所需之定義檔，搭配 [FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) 於本機驗證；亦可下載完整範例檔。

| 下載項目 | JSON | XML |
|---|---|---|
| 文件定義(StructureDefinition、CodeSystem、ValueSet、ConceptMap、Questionnaire 等) | [definitions.json.zip](definitions.json.zip) | [definitions.xml.zip](definitions.xml.zip) |
| 範例檔 | [examples.json.zip](examples.json.zip) | [examples.xml.zip](examples.xml.zip) |
{:.grid}

- [package.tgz](package.tgz)：本IG之 NPM 套件(套件代碼 `tw.demo.nidrs`)，可供 FHIR Validator、SUSHI 或其他工具作為相依套件載入。
- [full-ig.zip](full-ig.zip)：整個實作指引網站。

以 FHIR Validator 驗證範例(假設已下載 `validator_cli.jar` 及 `package.tgz`)：

```bash
java -jar validator_cli.jar my-bundle.json -version 4.0.1 \
  -ig package.tgz \
  -profile https://ancientsky.github.io/fhir_ig_demo/StructureDefinition/Bundle-nidrs-report-create
```

### 原始文件與產生程式

本IG之原始碼存放於 GitHub：[https://github.com/ancientsky/fhir_ig_demo](https://github.com/ancientsky/fhir_ig_demo)。

| 路徑 | 內容 |
|---|---|
| `source/nidrs-emr2.0-v1.42/` | 原始規格：工作說明書 V1.42(docx)、附錄二「法定傳染病增補欄位與檢核邏輯」(docx)、附錄三「送驗單列印功能說明」(docx)、附錄四「通報代碼彙整表」與「送驗代碼彙整表」(xlsx)、附錄五「登革熱大量通報必填欄位縮減說明」(docx)。原始文件之權利屬衛生福利部疾病管制署，請以疾管署公告之版本為準。 |
| `scripts/gen_terminology.py` | 由附錄四 xlsx 產生 CodeSystem、ValueSet 及 ConceptMap 之 FSH(輸出至 `input/fsh/generated/`) |
| `scripts/gen_questionnaires.py` | 由附錄二 docx 產生各疾病增補欄位之 Questionnaire FSH(輸出至 `input/fsh/generated/questionnaires/`)及[疾病增補欄位](supplement-fields.html)頁面 |
| `input/fsh/` | Profile、擴充、本地術語、範例、能力聲明等手寫之 FSH |
| `input/pagecontent/` | IG 說明頁面 |
{:.grid}

### 重新產生術語與增補欄位

疾管署公告新版附錄時，將新版檔案置於 `source/` 下之新目錄(並視需要調整程式中之檔名與版本常數)，再依序執行：

```bash
pip install openpyxl python-docx
python3 scripts/gen_terminology.py      # 附錄四 xlsx → input/fsh/generated/*.fsh
python3 scripts/gen_questionnaires.py   # 附錄二 docx → input/fsh/generated/questionnaires/*.fsh 及 supplement-fields.md
sushi build .                           # FSH → FHIR JSON
./_genonce.sh                           # IG Publisher 產生網站
```

兩支程式皆可指定來源及輸出路徑(用法見各程式開頭之說明)。產生之 FSH 檔請勿手動修改，以免下次重新產生時遺失。
