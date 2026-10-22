<div class="stu-note" style="border:2px solid #c0392b; padding:12px; margin-bottom:16px;">
<p><strong>非官方示範聲明：</strong>本IG為依據公開工作說明書所製作之非官方示範，非疾管署正式發布。</p>
<p>本IG之內容係依衛生福利部疾病管制署(以下簡稱疾管署)公開之「NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書」V1.42(中華民國115年09月29日)及其附錄轉換而成，僅供FHIR實作研究與教學示範使用。實際介接疾管署傳染病通報系統(NIDRS)時，請一律以疾管署公告之最新版工作說明書、Open API Spec及正式通知為準。本IG所使用之 canonical(<code>https://ancientsky.github.io/fhir_ig_demo</code>)、套件代碼(<code>tw.demo.nidrs</code>)及識別碼系統(<code>.../sid/...</code>)皆為示範用途，並非疾管署核定之識別碼。</p>
</div>

### 專案介紹
<div style="padding-left: 10px;">
<p>臺灣法定傳染病電子病歷自動通報實作指引(Taiwan NIDRS EMR Case Reporting Implementation Guide，TWNIDRS IG)採用HL7® FHIR® standard(Fast Healthcare Interoperability Resources)IG建置方法，在<a href="http://hl7.org/fhir/R4/">FHIR R4.0.1</a>之標準基礎上，繼承<a href="https://twcore.mohw.gov.tw/ig/twcore/1.0.0/">臺灣核心實作指引(TW Core IG) 1.0.0</a>，將「NIDRS電子病歷傳染病自動通報作業(2.0)」中，通報單位(醫院)與疾管署之間以 JSON 交換之「通報單新增」、「通報單修改」、「通報單病歷資料傳送」、「通報單送驗新增」以及疾管署「研判結果」、「檢驗結果」主動回饋等訊息，定義為FHIR Resources(類似資料表)、其中的資料項目(意即欄位)、基數(意即0..1、0..*、1..1或1..*)及資料類型(文字、日期時間、代碼等)。</p>
<p>本IG之命名、Profile 撰寫風格及訊息架構，參考疾管署已發布之<a href="https://twidir.cdc.gov.tw/twidir/">臺灣傳染病檢驗報告實作指引(TWIDIR)</a>及其他疾管署 FHIR IG(如臺灣結核病實作指引 TWTB)之慣例，詳見<a href="twidir.html">與TWIDIR之關係</a>。</p>
</div>

### 專案背景
<div style="padding-left: 10px;">
<p>依工作說明書「一、概述」：傳染病通報系統(National Infectious Disease Reporting System，NIDRS)為疾管署收集疾病疫情訊息之重要管道。過去系統蒐集疾病通報資訊的方式為感控人員登入系統輸入；為減少重複登打並加速資料收集作業，疾管署建立自動資料交換機制，自電子病歷(EMR)擷取個案通報單資料自動交換至疾管署，以利及時掌握疫情。</p>
<p>工作說明書所列之系統目標為：</p>
<ol>
<li>與現行傳染病通報系統介接，進行通報作業。</li>
<li>透過自動通報機制，減少通報單位人工作業，進而提高通報效率。</li>
<li>透過電子簽章機制，確保資料之有效性及安全性與傳輸的正確性。</li>
</ol>
<p>工作說明書之參考文件包括：「法定及新興傳染病個案(含疑似病例)報告單CDA R2執行指引標準書」、衛生福利部疾病管制署疾管檢驗字第1081300552號函，以及「110年度傳染病通報系統功能擴充建置暨維護案規格書」。本IG可視為將上述以 CDA R2 及 JSON 定義之通報單，改以 FHIR R4 表達之示範。</p>
</div>

### 專案範圍
<div style="padding-left: 10px;">
<p>依工作說明書「二、系統描述/(一)系統範圍」，電子病歷通報包含第一至第五類法定傳染病及重點監視項目之通報新增、送驗新增、通報修改、通報個案病歷上傳，以及通報單與送驗研判結果主動回饋等作業。</p>
</div>

#### 使用案例(Use Case)
<div style="padding-left: 10px;">
<p>本IG之主要實作者為：<strong>通報單位(醫院)</strong>，於其醫院資訊系統(HIS)/電子病歷系統產生並傳送通報訊息；以及<strong>疾管署傳染病通報系統(NIDRS)</strong>，接收、檢核通報訊息並回覆處理結果，並於研判結果或檢驗結果異動時主動通知通報單位。本IG涵蓋工作說明書「表1 傳送機制主要功能表」之六項功能：</p>
</div>

| 項次 | 功能名稱 | 說明 | 送方 | 收方 | 原規格訊息 | 本IG訊息(Bundle Profile) |
|---|---|---|---|---|---|---|
| 1 | 通報單新增 | 通報單位傳送通報單新增資訊至疾管署傳染病通報系統。 | 通報單位 | 疾管署 | EMRMsg01 / HISMsg01 | [通報單新增-Bundle NIDRS Report Create](StructureDefinition-Bundle-nidrs-report-create.html) |
| 2 | 通報單修改 | 通報單位傳送通報單修改資訊至疾管署傳染病通報系統。 | 通報單位 | 疾管署 | EMRMsg02 / HISMsg02 | [通報單修改-Bundle NIDRS Report Update](StructureDefinition-Bundle-nidrs-report-update.html) |
| 3 | 通報單病歷檔案上傳 | 通報單位傳送病歷資料或檔案至疾管署傳染病通報系統。 | 通報單位 | 疾管署 | EMRMsg03 / HISMsg03 | [通報單病歷資料傳送-Bundle NIDRS Document](StructureDefinition-Bundle-nidrs-document.html) |
| 4 | 通報單送驗 | 通報單位傳送送驗單(需含通報單電腦編號)至疾管署傳染病通報系統。 | 通報單位 | 疾管署 | EMRMsg04 / HISMsg04 | [通報單送驗新增-Bundle NIDRS Sample](StructureDefinition-Bundle-nidrs-sample.html) |
| 5 | 研判結果主動通知 | 通報單研判結果有異動時，主動通知通報醫療院所。 | 疾管署 | 通報單位 | PushDetermineResult | [研判結果主動通知-Bundle NIDRS Push Determine Result](StructureDefinition-Bundle-nidrs-push-determine-result.html) |
| 6 | 檢驗結果主動通知 | 通報單的送驗單檢驗結果有異動時，主動通知通報醫療院所。 | 疾管署 | 通報單位 | PushSampleResult | [檢驗結果主動通知-Bundle NIDRS Push Sample Result](StructureDefinition-Bundle-nidrs-push-sample-result.html) |
{:.grid}

功能1~4之疾管署回覆(HISMsg01~HISMsg04)皆使用 [疾管署回覆-Bundle NIDRS Response](StructureDefinition-Bundle-nidrs-response.html)。各功能之作業步驟與訊息交換方式詳見[作業流程與交換訊息](workflow.html)。

本IG**不涵蓋**：附錄三「送驗單列印功能說明」(屬疾管署實驗室資訊管理系統之網頁操作，非資料交換)；疾管署內部之研判、實驗室資訊管理系統(LIMS)處理流程；以及檢驗機構上傳檢驗結果(屬TWIDIR範圍)。

### 主要設計
<div style="padding-left: 10px;">
<ul>
<li><strong>FHIR 訊息(Messaging)：</strong>每一次交換皆為一個 <code>Bundle.type = message</code> 之 Bundle，第一筆 entry 為 MessageHeader，以 <code>MessageHeader.eventCoding</code>(代碼系統 <a href="CodeSystem-cdc-message-event.html">CDC-NIDRS-訊息事件</a>)標示原規格之訊息代碼(EMRMsg01~04、HISMsg01~04、PushDetermineResult、PushSampleResult)。疾管署之處理結果以 <code>MessageHeader.response</code> 及 <a href="StructureDefinition-OperationOutcome-nidrs.html">OperationOutcome</a> 表達，此為與 TWIDIR 相同之「Bundle + MessageHeader + OperationOutcome」模式。</li>
<li><strong>一份通報單(REPORT)即一個 Composition：</strong>「傳染病個案通報單」以 <a href="StructureDefinition-Composition-nidrs-report.html">Composition</a>(LOINC 55751-2 Public health Case report)表達，其 section 依原規格區分為通報疾病、病患動向、流行病學資料、疾病增補欄位、死亡資料、個案生母資料。通報單新增訊息一次最多可含 10 份 Composition(對應 REPORTS 1..10)。</li>
<li><strong>每一通報疾病一個 Condition：</strong>原規格一份通報單之 DISEASE_ID 可為 1..10 個疾病，通報成功後疾管署依疾病分別產生通報單號(REPORT_ID)。本IG將每一通報疾病表達為一筆 <a href="StructureDefinition-Condition-nidrs.html">Condition</a>，通報單號即 <code>Condition.identifier</code>，發病日、診斷日、有無症狀及主要症狀等亦置於 Condition。</li>
<li><strong>個案、病患動向、流行病學資料：</strong>個案以 TW Core Patient 延伸之 <a href="StructureDefinition-Patient-nidrs.html">Patient</a> 表達；病患動向以 <a href="StructureDefinition-Encounter-nidrs.html">Encounter</a>；職業、旅遊史、接觸動物史、暴露史、人口密集機構及死亡原因以各 Observation Profile 表達。</li>
<li><strong>附錄二疾病增補欄位以 Questionnaire 表達：</strong>附錄二每一疾病之增補欄位轉換為一份 Questionnaire(答題編號 KEY = <code>item.linkId</code>，檢核邏輯置於 <code>Questionnaire.purpose</code>)，通報時之填答(DISEASE_FIELD)以 <a href="StructureDefinition-QuestionnaireResponse-nidrs.html">QuestionnaireResponse</a> 傳送，詳見<a href="supplement-fields.html">疾病增補欄位(附錄二)</a>。</li>
<li><strong>送驗與檢驗結果：</strong>送驗單以 <a href="StructureDefinition-ServiceRequest-nidrs-sample.html">ServiceRequest</a> 及 <a href="StructureDefinition-Specimen-nidrs.html">Specimen</a> 表達(法傳送驗單與法傳TB送驗單分別定義)；疾管署回饋之綜合檢驗結果以 <a href="StructureDefinition-DiagnosticReport-nidrs-sample-result.html">DiagnosticReport</a> 及血清學、病原體檢驗結果 Observation 表達，檢驗結果代碼沿用 TWIDIR 之 CDC-LIMS系統-檢驗結果代碼。</li>
<li><strong>專門術語源自附錄四：</strong>附錄四「通報代碼彙整表」及「送驗代碼彙整表」(xlsx)以程式自動轉換為 CodeSystem、ValueSet 及 ConceptMap；工作說明書本文中定義但未列於附錄四之代碼，另以人工定義於本地代碼系統。詳見<a href="terminologies.html">專門術語</a>。</li>
<li><strong>附錄五登革熱大量通報：</strong>以獨立之 Composition/Patient/Condition Profile(<code>*-dengue-bulk</code>)表達必填欄位縮減後之通報單(該規定於工作說明書中註明「待疾病管制署通知後上版啟用」)。</li>
</ul>
</div>

### 依循標準
<div style="padding-left: 10px;">
<ul>
<li><a href="http://hl7.org/fhir/R4/">HL7 FHIR R4 (4.0.1)</a>，特別是 <a href="http://hl7.org/fhir/R4/messaging.html">FHIR Messaging</a> 與 <a href="http://hl7.org/fhir/R4/messageheader-operation-process-message.html">$process-message</a> 操作。</li>
<li><a href="https://twcore.mohw.gov.tw/ig/twcore/1.0.0/">臺灣核心實作指引(TW Core IG) 1.0.0</a>：本IG大部分 Profile 繼承 TW Core Profile(例如 TW Core Patient、Organization、Condition、Composition、Bundle、MessageHeader)。</li>
<li><a href="https://twidir.cdc.gov.tw/twidir/">臺灣傳染病檢驗報告實作指引(TWIDIR) 0.1.1</a>之命名與訊息慣例(本IG未將TWIDIR列為套件相依，僅以 canonical 參照其檢驗結果代碼系統)。</li>
<li>原始規格：衛生福利部疾病管制署「NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書」V1.42 (115/09/29)，及附錄二「法定傳染病增補欄位與檢核邏輯」、附錄三「送驗單列印功能說明」、附錄四「通報代碼彙整表」與「送驗代碼彙整表」、附錄五「登革熱大量通報必填欄位縮減說明」。</li>
</ul>
</div>

### 如何閱讀這個實作指引(IG)
<div style="padding-left: 10px;">
<p>TWNIDRS IG 之網站架構與各頁面說明如下：</p>
<ul>
<li><strong><a href="index.html">應用說明</a></strong>：TWNIDRS IG介紹、背景、範圍及主要設計說明。</li>
<li><strong><a href="workflow.html">作業流程與交換訊息</a></strong>：系統架構與連線方式、六項功能之作業流程、各功能所使用之 FHIR 訊息與傳輸方式建議。</li>
<li><strong>規範文件</strong>
<ul>
<li><strong><a href="models.html">邏輯模型</a></strong>：以原規格 JSON 結構(表8~表19)定義之邏輯模型(Logical Models)，欄位名稱沿用原規格，並可透過 Mappings 瞭解各欄位使用本IG的哪個 Profile 的哪個資料項目(element)。</li>
<li><strong><a href="mapping.html">欄位對應(JSON→FHIR)</a></strong>：原規格 JSON 欄位與 FHIR 資料項目之逐欄對應表。</li>
<li><strong><a href="profiles.html">FHIR Profiles</a></strong>：本IG所有 Profile 與擴充(Extension)之定義、限制(Constraints)與術語綁定。</li>
<li><strong><a href="supplement-fields.html">疾病增補欄位</a></strong>：附錄二各疾病增補欄位轉換之 Questionnaire 清單。</li>
<li><strong><a href="validation.html">檢核規則</a></strong>：共同欄位檢核條件、條件式必填規則、重複通報與補正邏輯，以及何者以 FHIR invariant 驗證、何者為疾管署端商業規則。</li>
<li><strong><a href="terminologies.html">專門術語</a></strong>：本IG所使用之代碼系統(Code Systems)、值集(Value Sets)及概念對應(Concept Maps)，與其附錄四來源工作表。</li>
<li><strong><a href="capabilitystatements.html">能力聲明</a></strong>：疾管署 NIDRS 接收端與通報醫院端必須及建議支援之功能。</li>
<li><strong><a href="artifacts.html">全部構件</a></strong>：本IG所有 FHIR 構件之索引。</li>
</ul>
</li>
<li><strong><a href="examples.html">範例</a></strong>：依各作業情境列出符合本IG Profile之訊息範例。</li>
<li><strong><a href="downloads.html">結構定義與範例檔下載</a></strong>：定義檔、範例檔、套件(package)下載，以及原始文件與產生程式說明。</li>
<li><strong><a href="security.html">安全性</a></strong>：電子簽章、連線控管與資料保護之要求與建議。</li>
<li><strong><a href="twidir.html">與TWIDIR之關係</a></strong>：本IG沿用TWIDIR之處與差異，以及檢驗報告與通報單之關聯方式。</li>
<li><strong><a href="changes.html">版本異動說明</a></strong>：本IG之版本異動紀錄。</li>
</ul>
</div>

### 作者與貢獻者
<table class="grid">
    <thead>
        <tr class="header">
            <th style="width:20%">角色</th>
            <th style="width:30%">姓名/單位</th>
            <th style="width:50%">說明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>作者-IG(非官方示範)</td>
            <td><a href="https://github.com/ancientsky">ancientsky</a></td>
            <td><a href="https://github.com/ancientsky/fhir_ig_demo">fhir_ig_demo</a> 專案維護者</td>
        </tr>
        <tr>
            <td>原始規格</td>
            <td>衛生福利部疾病管制署</td>
            <td>「NIDRS電子病歷傳染病自動通報作業(2.0)工作說明書」V1.42 及附錄之著作者；本IG未經疾管署審閱或背書。</td>
        </tr>
    </tbody>
</table>

### 授權
<div style="padding-left: 10px;">
<p>本IG之 FHIR 構件(StructureDefinition、CodeSystem、ValueSet、ConceptMap、Questionnaire、範例等)與說明頁面以 <a href="https://creativecommons.org/publicdomain/zero/1.0/">CC0-1.0</a> 釋出。代碼內容(附錄四代碼彙整表)之資料所屬單位為衛生福利部疾病管制署；原始工作說明書及附錄文件之權利屬原著作者。</p>
<p>本IG使用 HL7® FHIR® 標準；HL7® 及 FHIR® 為 Health Level Seven International 之註冊商標。LOINC® 及 SNOMED CT® 代碼之使用依其各自之授權條款。</p>
</div>
