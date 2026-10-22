# -*- coding: utf-8 -*-
# NIDRS JSON 結構 → 邏輯模型/對應 資料定義 (供 gen.py 產生 FSH 與 mapping.md)

class F:
    def __init__(self, name, card, stype, short, defn="", ex=None, bind=None,
                 maps=None, note="", kids=None, group=None, ftype=None):
        self.name = name
        self.card = card
        self.stype = stype          # 原規格型態
        self.short = short
        self.defn = defn or short
        self.ex = ex
        self.bind = bind            # (ValueSet, strength)
        self.maps = maps or []      # [(profileId or None, fhirPath)]
        self.note = note
        self.kids = kids or []
        self.group = group          # 原規格分組標題(僅文件用)
        self.ftype = ftype


# ---------- 共用 Profile 名稱 ----------
PAT = "Patient-nidrs"
COMP = "Composition-nidrs-report"
COMPU = "Composition-nidrs-report-update"
COND = "Condition-nidrs"
CONDU = "Condition-nidrs-update"
ENC = "Encounter-nidrs"
ORG = "Organization-nidrs-hospital"
LAB = "Organization-nidrs-lab"
PR = "Practitioner-nidrs"
PRR = "PractitionerRole-nidrs"
OCC = "Observation-nidrs-occupation"
EPI = "Observation-nidrs-epi-flag"
TRV = "Observation-nidrs-travel"
ANI = "Observation-nidrs-animal"
DENSE = "Observation-nidrs-dense-institution"
DEATH = "Observation-nidrs-cause-of-death"
QR = "QuestionnaireResponse-nidrs"
MOM = "RelatedPerson-nidrs-mother"
CASEREF = "Condition-nidrs-case-ref"
OO = "OperationOutcome-nidrs"
MHR = "MessageHeader-nidrs-response"
BR = "Bundle-nidrs-response"
DOC = "DocumentReference-nidrs"
SR = "ServiceRequest-nidrs-sample"
SRTB = "ServiceRequest-nidrs-tb-sample"
SP = "Specimen-nidrs"
SPTB = "Specimen-nidrs-tb"
PATTB = "Patient-nidrs-tb-sample"
DET = "Condition-nidrs-determine-result"
DR = "DiagnosticReport-nidrs-sample-result"
OAB = "Observation-nidrs-antibody-result"
OPA = "Observation-nidrs-pathogen-result"

DATE_SLASH = "日期格式 yyyy/MM/dd 轉為 FHIR yyyy-MM-dd(例：2021/01/01→2021-01-01)"
DATE_8 = "日期格式 yyyyMMdd 轉為 FHIR yyyy-MM-dd(例：20210101→2021-01-01)"
DT_SPACE = "格式 yyyyMMdd HH:mi:ss 轉為 FHIR instant yyyy-MM-ddTHH:mm:ss+08:00(例：20250101 13:45:00→2025-01-01T13:45:00+08:00)"
CS_DT = "C# DateTime 序列化值(如 2025-01-02T10:20:30，無時區)轉為 FHIR 時補上 +08:00"


def mv(code, extra=""):
    return ("true → 新增一筆 extension[patientMovement].valueCodeableConcept = CDCPatientMovement#%s%s；false 或未填 → 不產生。原規格病患動向請擇一填寫" % (code, extra))


# ======================================================================
# 表16 通報單共同欄位 Report_Common
# ======================================================================
REPORT_COMMON = [
    F("REPORT", "0..1", "String/13", "通報單號", "通報單號；修改通報單時此欄位必填。", ex="1140300012345",
      maps=[(CONDU, "Condition.identifier[reportId].value")],
      note="identifier.system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id；新增作業(EMRMsg01)通常不填(通報成功後由 HISMsg01 REPORT_LIST.REPORT_ID 回傳)；修改作業(EMRMsg02)必填，置於 Condition-nidrs-update(identifier[reportId] 1..1)"),
    # 通報單位資料
    F("HOSPITAL", "1..1", "String/11", "通報單位醫事機構代碼", "通報單位醫事機構代碼。", ex="0101090517", group="通報單位資料",
      maps=[(ORG, "Organization.identifier[hospitalCode].value"), (COMP, "Composition.custodian"), (PRR, "PractitionerRole.organization")],
      note="identifier.system = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw、type = v2-0203#PRN；同一 Organization 亦由 MessageHeader.sender 及 Encounter.serviceProvider 參照"),
    F("HOSPITAL_NAME", "1..1", "String/100", "通報單位名稱", ex="衛生福利部臺北醫院",
      maps=[(ORG, "Organization.name")], note="直接對應"),
    F("HOSPITAL_ADDRESS", "1..1", "String/100", "通報單位地址", ex="新北市新莊區思源路127號",
      maps=[(ORG, "Organization.address.text")], note="直接對應"),
    F("REPORTER_NAME", "1..1", "String/30", "通報單登錄者姓名", ex="王小明",
      maps=[(PR, "Practitioner.name.text"), (COMP, "Composition.author")],
      note="建立 Practitioner(登錄者)及 PractitionerRole-nidrs(practitioner = 登錄者、organization = 通報單位)，Composition.author 參照該 PractitionerRole"),
    F("HOSPITAL_CONTACT", "1..1", "String/100", "通報者聯絡電話", ex="02-22765566#1234",
      maps=[(PRR, "PractitionerRole.telecom.value")], note="telecom.system = phone"),
    F("DIAGNOSTICIAN", "1..1", "String/20", "診斷醫師", ex="林醫師",
      maps=[(PR, "Practitioner.name.text"), (COND, "Condition.asserter")],
      note="建立 Practitioner(診斷醫師)，每一筆通報疾病 Condition.asserter 皆參照之"),
    # 個案資料
    F("IDNO", "1..1", "String/10", "個案證號",
      "身分證統一編號/外來人口之居留證統一證號、護照號碼；請優先填入身分證統一編號，如無法得知，始可填入居留證統一證號或護照號碼；倘無法取得上述3種證號時，請填入AA(本國新生兒，報告日期-出生日期<6個月)、BB(本國人士)或CC(外國人士)，由系統自動編碼流水證號(範例：AA11300001)；EMR增修通報單時填入AA、BB、CC，NIDRS網頁將呈現最後一次異動之證號，不會以AA、BB、CC覆蓋寫入或重新編碼流水證號。",
      ex="A123456789", group="個案資料",
      maps=[(PAT, "Patient.identifier[idCardNumber|residentNumber|passportNumber|foreignPassport|nidrsTempId].value")],
      note="依證號種類擇一 slice：身分證統一編號→idCardNumber(system http://www.moi.gov.tw)；居留證統一證號→residentNumber(http://www.immigration.gov.tw)；中華民國護照→passportNumber(http://hl7.org/fhir/sid/passport-TWN)；外國護照→foreignPassport(http://hl7.org/fhir/sid/passport-{ISO 3166-1 alpha-3})；AA/BB/CC→nidrsTempId(use = temp、system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-temp-id)"),
    F("NAME", "1..1", "String/200", "個案姓名", ex="陳大華",
      maps=[(PAT, "Patient.name[usual].text")], note="直接對應(name.use = usual)"),
    F("NAME_PINYIN", "0..1", "String/200", "姓名羅馬拼音", ex="CHEN DA-HUA",
      maps=[(PAT, "Patient.name[official].text")],
      note="name.use = official，並加上 iso21090-EN-representation 擴充(valueCode = ABC)"),
    F("GENDER", "0..1", "Code", "性別", "性別 (F-女, M-男, X-第三性別)。", ex="M", bind=("CDCGender", "required"),
      maps=[(PAT, "Patient.gender")],
      note="F→female、M→male、X→other(ConceptMap cdc-gender-to-administrative-gender)"),
    F("BIRTHDAY", "1..1", "String/10", "出生日期", "出生日期；Ex.2021/01/01。", ex="1990/05/20",
      maps=[(PAT, "Patient.birthDate")], note=DATE_SLASH),
    F("CITIZEN", "0..1", "Int", "國籍", "國籍 (0-本國籍, 1-非本國籍)。", ex=0,
      maps=[(PAT, "Patient.extension[citizen].valueCoding")],
      note="整數轉為代碼字串：0→CDCCitizen#0(本國籍)、1→CDCCitizen#1(非本國籍)"),
    F("NATIONALITY", "0..1", "Code", "國家",
      "國家(代碼：國家代碼)；若國籍為「本國籍」，僅可填158；若為「非本國籍」，不可填寫158，請填寫護照的發放國家；查無國家名稱時，請輸入其他，並填寫其他國家欄位。",
      ex="158", bind=("CDCCountry", "required"),
      maps=[(PAT, "Patient.extension[nationality].extension[code].valueCodeableConcept.coding")],
      note="coding.system = CodeSystem cdc-country；可依 ConceptMap cdc-country-to-iso3166 另加 ISO 3166 代碼"),
    F("NATIONALITY_OTHER", "0..1", "String/100", "其他國家", "其他國家；國家代碼填寫其他時必填。",
      maps=[(PAT, "Patient.extension[nationality].extension[code].valueCodeableConcept.text")],
      note="與 NATIONALITY(其他)置於同一 CodeableConcept 之 text"),
    F("RESIDENCE_TYPE", "0..1", "String/3", "非本國籍居民身份",
      "非本國籍居民身份(代碼：居留代碼)；「國籍」為本國籍時，「非本國籍居民身分」不可填寫。", ex="4",
      bind=("CDCResidenceType", "required"),
      maps=[(PAT, "Patient.extension[residenceType].valueCodeableConcept.coding")],
      note="coding.system = CodeSystem cdc-residence-type；本國籍時不可填寫(invariant nidrs-pat-3)"),
    F("RESIDENCE_TYPE_OTHER", "0..1", "String/100", "非本國籍居民身份說明", "非本國籍居民身份說明；非本國籍居民身份填寫其他時必填。",
      maps=[(PAT, "Patient.extension[residenceType].valueCodeableConcept.text")], note="置於同一 CodeableConcept 之 text"),
    F("RESIDENCE_COUNTY", "1..1", "Code", "居住縣市", "居住縣市(代碼：縣市代碼)。", ex="65000", bind=("CDCCounty", "required"),
      maps=[(PAT, "Patient.address.extension[adminArea].extension[county].valueCoding")],
      note="coding.system = CodeSystem cdc-county"),
    F("RESIDENCE_TOWN", "1..1", "Code", "鄉鎮市區", "鄉鎮市區(代碼：縣市代碼:鄉鎮市區代碼)。", ex="65000010", bind=("CDCTown", "required"),
      maps=[(PAT, "Patient.address.extension[adminArea].extension[town].valueCoding")],
      note="coding.system = CodeSystem cdc-town"),
    F("RESIDENCE_VILLAGE", "0..1", "Code", "居住村里", "居住村里(代碼：縣市代碼:村里代碼)。", ex="65000010001", bind=("CDCVillage", "required"),
      maps=[(PAT, "Patient.address.extension[adminArea].extension[village].valueCoding")],
      note="coding.system = CodeSystem cdc-village"),
    F("ADDRESS", "0..1", "String/150", "街道地址", ex="文化路一段100號",
      maps=[(PAT, "Patient.address.text")], note="直接對應"),
    F("HAS_ORG", "0..1", "Bool", "人口密集機構", "人口密集機構 (true-是, false-否)。", ex=False,
      maps=[(DENSE, "Observation.value[x]"), (COMP, "Composition.section[epidemiology].entry[denseInstitution]")],
      note="false→valueBoolean = false；true 且有 ORG_ID→valueCodeableConcept(機構類別)；true 但無 ORG_ID→valueBoolean = true"),
    F("ORG_ID", "0..1", "Code", "機構類別", "機構類別(代碼：人口密集機構類別代碼)。", ex="2", bind=("CDCDenseInstitution", "required"),
      maps=[(DENSE, "Observation.valueCodeableConcept.coding")], note="coding.system = CodeSystem cdc-dense-institution"),
    F("MARRIAGE", "0..1", "Code", "婚姻狀況", "婚姻狀況(代碼：婚姻狀況)。", ex="2", bind=("CDCMaritalStatus", "required"),
      maps=[(PAT, "Patient.maritalStatus.coding")],
      note="填 CodeSystem cdc-marital-status 代碼，並建議依 ConceptMap cdc-marital-status-to-v3 加入 v3-MaritalStatus 代碼"),
    # 病患動向
    F("HOSPITALIZED_OUTPATIENT", "0..1", "Bool", "病患動向_門診", "病患動向_門診 (true-是, false-否)。", ex=True, group="病患動向(請擇一填寫)",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept"), (ENC, "Encounter.class")],
      note=mv("outpatient", "、Encounter.class = v3-ActCode#AMB")),
    F("HOSPITALIZED_EMERGENCY", "0..1", "Bool", "病患動向_急診待床", "病患動向_急診待床 (true-是, false-否)。",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept"), (ENC, "Encounter.class")],
      note=mv("emergency", "、Encounter.class = v3-ActCode#EMER")),
    F("HOSPITALIZED_GENERAL_WARD", "0..1", "Bool", "病患動向_入住一般病房", "病患動向_入住一般病房 (true-是, false-否)；勾選是時，入住一般病房日必填。",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept"), (ENC, "Encounter.class")],
      note=mv("general-ward", "、Encounter.class = v3-ActCode#IMP；入住一般病房日(HOSPITALIZED_DAY)必填(nidrs-enc-1)")),
    F("HOSPITALIZED_ICU", "0..1", "Bool", "病患動向_入住加護病房", "病患動向_入住加護病房 (true-是, false-否)；勾選是時，首次入住加護病房日必填、轉出加護病房日選填。",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept"), (ENC, "Encounter.location[icu]")],
      note=mv("icu", "、Encounter.class = v3-ActCode#IMP，並建立 `location[icu]`(見 nidrs-enc-2)")),
    F("HOSPITALIZED_ISOLATION_ROOM", "0..1", "Bool", "病患動向_入住隔離病房", "病患動向_入住隔離病房 (true-是, false-否)；勾選是時，首次入住隔離病房日必填、轉出隔離病房日選填。",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept"), (ENC, "Encounter.location[isolationRoom]")],
      note=mv("isolation-room", "、Encounter.class = v3-ActCode#IMP，並建立 `location[isolationRoom]`(見 nidrs-enc-2)")),
    F("HOSPITALIZED_DISCHARGED", "0..1", "Bool", "病患動向_出院", "病患動向_出院 (true-是, false-否)；勾選是時，出院日必填。",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept"), (ENC, "Encounter.status")],
      note=mv("discharged", "、Encounter.status = finished；出院日(DISCHARGE)必填(nidrs-enc-3)")),
    F("HOSPITALIZED_TRANSFER", "0..1", "Bool", "病患動向_轉院", "病患動向_轉院 (true-是, false-否)；勾選是時，轉至院所名稱必填、轉院日期必填。",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept"), (ENC, "Encounter.hospitalization.dischargeDisposition")],
      note=mv("transfer", "、hospitalization.dischargeDisposition = discharge-disposition#other-hcf；轉至院所與轉院日期必填(nidrs-enc-4)")),
    F("HOSPITALIZED_NONE", "0..1", "Bool", "病患動向_無就醫", "病患動向_無就醫。",
      maps=[(ENC, "Encounter.extension[patientMovement].valueCodeableConcept")],
      note=mv("none", "；Encounter.class 為 FHIR 必填但無對應代碼(ConceptMap 為 unmatched)，建議於 class 加上 data-absent-reason 擴充(not-applicable)")),
    F("STAY_IN_IW", "0..1", "String/10", "首次入住隔離病房日", "首次入住隔離病房日；Ex.2021/01/01。",
      maps=[(ENC, "Encounter.location[isolationRoom].period.start")], note=DATE_SLASH),
    F("LEAVE_IW", "0..1", "String/10", "轉出隔離病房日", "轉出隔離病房日；Ex.2021/01/01。",
      maps=[(ENC, "Encounter.location[isolationRoom].period.end")], note=DATE_SLASH),
    F("STAY_IN_ICU", "0..1", "String/10", "首次入住加護病房日", "首次入住加護病房日；Ex.2021/01/01。",
      maps=[(ENC, "Encounter.location[icu].period.start")], note=DATE_SLASH),
    F("LEAVE_ICU", "0..1", "String/10", "轉出加護病房日", "轉出加護病房日；Ex.2021/01/01。",
      maps=[(ENC, "Encounter.location[icu].period.end")], note=DATE_SLASH),
    F("HOSPITALIZED_DAY", "0..1", "String/10", "入住一般病房日", "入住一般病房日；Ex.2021/01/01。",
      maps=[(ENC, "Encounter.period.start")], note=DATE_SLASH),
    F("DISCHARGE", "0..1", "String/10", "出院日", "出院日；Ex.2021/01/01。",
      maps=[(ENC, "Encounter.period.end")], note=DATE_SLASH),
    F("TRANSFER_HOSPITAL", "0..1", "String/10", "轉至院所名稱", "轉至院所名稱；醫事機構代碼。",
      maps=[(ENC, "Encounter.hospitalization.destination"), (ORG, "Organization.identifier[hospitalCode].value")],
      note="以醫事機構代碼建立(或參照)Organization-nidrs-hospital，hospitalization.destination 參照之"),
    F("TRANSFER_DAY", "0..1", "String/10", "轉院日期", "轉院日期；Ex.2021/01/01。",
      maps=[(ENC, "Encounter.period.end")], note=DATE_SLASH),
    F("DEATH", "1..1", "Bool", "是否死亡", "是否死亡 (true-是, false-否)；本欄位勾選「是」，死亡日期必填。", ex=False,
      maps=[(PAT, "Patient.deceased[x]")],
      note="false→deceasedBoolean = false；true→改以 deceasedDateTime(= DEATH_DAY)表達，不使用 deceasedBoolean = true(invariant nidrs-pat-2)"),
    F("DEATH_DAY", "0..1", "String/10", "死亡日期", "死亡日期；Ex.2021/01/01。",
      maps=[(PAT, "Patient.deceasedDateTime")], note=DATE_SLASH),
    F("DEATH_REASON_A", "0..1", "String/400", "死亡原因甲",
      maps=[(DEATH, "Observation.component[reasonA].valueString"), (COMP, "Composition.section[death].entry")],
      note="有任一死亡原因時建立一筆死亡原因 Observation，並由 Composition.section[death] 參照"),
    F("DEATH_REASON_B", "0..1", "String/400", "死亡原因乙",
      maps=[(DEATH, "Observation.component[reasonB].valueString")], note="同上"),
    F("DEATH_REASON_C", "0..1", "String/400", "死亡原因丙",
      maps=[(DEATH, "Observation.component[reasonC].valueString")], note="同上"),
    F("DEATH_REASON_D", "0..1", "String/400", "死亡原因丁",
      maps=[(DEATH, "Observation.component[reasonD].valueString")], note="同上"),
    F("DEATH_REASON_OTHER", "0..1", "String/400", "死亡原因其他",
      maps=[(DEATH, "Observation.component[reasonOther].valueString")], note="同上"),
    F("NOTE", "0..1", "String/250", "備註", "備註；新增通報時可填寫，修改通報時不可填寫。",
      maps=[(COMP, "Composition.extension[note].valueString")],
      note="Composition-nidrs-report-update 之 extension[note] 為 0..0"),
    F("MODIFIED_REASON", "0..1", "String/250", "修改原因", "修改原因；修改通報時必填，新增通報時不可填寫。",
      maps=[(COMPU, "Composition.extension[modifiedReason].valueString")],
      note="僅用於 Composition-nidrs-report-update(1..1)；Composition-nidrs-report 之 extension[modifiedReason] 為 0..0"),
    # 相關日期
    F("NO_SICK_DAY", "0..1", "Bool", "無發病日", "無發病日。", ex=False, group="相關日期",
      maps=[(COND, "Condition.extension[noOnsetDate].valueBoolean")],
      note="同一通報單之每一筆通報疾病 Condition 填入相同值；true 時不可填 onsetDateTime(nidrs-con-1)"),
    F("SICK_DAY", "0..1", "String/10", "發病日期", "發病日期；Ex.2021/01/01；有發病日時，本欄位必填，無發病日時，本欄不可填寫。", ex="2025/08/01",
      maps=[(COND, "Condition.onsetDateTime")], note=DATE_SLASH + "；複製至每一筆 Condition"),
    F("DIAGNOSE_DAY", "1..1", "String/10", "診斷日期", "診斷日期；Ex.2021/01/01。", ex="2025/08/03",
      maps=[(COND, "Condition.recordedDate")], note=DATE_SLASH + "；複製至每一筆 Condition"),
    F("REPORTED_DAY", "1..1", "String/10", "報告日期", "報告日期；Ex.2021/01/01；「報告日期」欄位填入值僅可為該通報單建檔日起算往前31天內(含)之日期。", ex="2025/08/03",
      maps=[(COMP, "Composition.date")], note=DATE_SLASH + "(Composition.date 為 dateTime，可僅填日期)"),
    F("PHB_RECEIVED_DAY", "1..1", "String/10", "衛生局收到日", "衛生局收到日；Ex.2021/01/01。", ex="2025/08/03",
      maps=[(COMP, "Composition.extension[phbReceivedDate].valueDate")], note=DATE_SLASH),
    # 臨床症狀
    F("HAS_SYMPTOM", "1..1", "Bool", "有無症狀",
      "有無症狀；通報結核病時，此欄位與主要症狀(DISEASE_SYMPTOM)不可填寫；若「有」症狀，「發病日」必填；若「無」症狀，「無發病日」需選擇True；若有症狀，請繼續填寫DISEASE_SYMPTOM。",
      ex=True, group="臨床症狀",
      maps=[(COND, "Condition.extension[hasSymptom].valueBoolean")],
      note="複製至每一筆 Condition；相依檢核見 nidrs-con-2、nidrs-con-3"),
    # 流行病學資料
    F("OCCUPATION", "1..1", "Code", "職業", "職業(代碼：職業代碼)。", ex="3", bind=("CDCOccupation", "required"), group="流行病學資料",
      maps=[(OCC, "Observation.valueCodeableConcept.coding"), (COMP, "Composition.section[epidemiology].entry[occupation]")],
      note="coding.system = CodeSystem cdc-occupation"),
    F("OCCUPATION_OTHER", "0..1", "String/100", "詳細職業身分說明", "詳細職業身分說明；當職業選擇不詳，請於本欄說明。",
      maps=[(OCC, "Observation.valueCodeableConcept.text")], note="置於同一 CodeableConcept 之 text"),
    F("HAS_TRAVEL_HISTORY", "1..1", "Bool", "旅遊史", "旅遊史 (true-有, false-無)；若有旅遊史，請繼續填寫旅遊史(TRAVEL)。", ex=False,
      maps=[(EPI, "Observation.valueBoolean"), (COMP, "Composition.section[epidemiology].entry[epiFlag]")],
      note="Observation.code = CDCNIDRSObservation#HAS_TRAVEL_HISTORY"),
    F("HAS_ANIMAL_HISTORY", "0..1", "Bool", "動物接觸史",
      "動物接觸史 (true-有, false-無)；若有動物接觸史，請繼續填寫接觸動物史(ANIMAL)；德國麻疹、麻疹、急性病毒性D型肝炎、腸病毒感染併發重症不收集動物接觸史，若傳送將不檢核且不呈現於網頁。",
      maps=[(EPI, "Observation.valueBoolean")], note="Observation.code = CDCNIDRSObservation#HAS_ANIMAL_HISTORY"),
    F("EXPLORE_POSITIVE", "0..1", "Bool", "與確定/極可能/可能病例曾有接觸或暴露共同感染源",
      maps=[(EPI, "Observation.valueBoolean")], note="Observation.code = CDCNIDRSObservation#EXPLORE_POSITIVE"),
    F("EXPLORE_BODY_FLUID", "0..1", "Bool", "具血體液接觸",
      maps=[(EPI, "Observation.valueBoolean")], note="Observation.code = CDCNIDRSObservation#EXPLORE_BODY_FLUID"),
    F("EXPLORE_LAB", "0..1", "Bool", "具實驗室暴露史",
      maps=[(EPI, "Observation.valueBoolean")], note="Observation.code = CDCNIDRSObservation#EXPLORE_LAB"),
    F("EXPLORE_POLLUTED_FOOD", "0..1", "Bool", "曾食用受汙染的水或食物",
      maps=[(EPI, "Observation.valueBoolean")], note="Observation.code = CDCNIDRSObservation#EXPLORE_POLLUTED_FOOD"),
    F("EXPLORE_IATROGENIC", "0..1", "Bool", "醫源型",
      maps=[(EPI, "Observation.valueBoolean")], note="Observation.code = CDCNIDRSObservation#EXPLORE_IATROGENIC"),
    # 個案生母資料
    F("BIRTH_MOTHER_NAME", "0..1", "String/200", "生母姓名", group="個案生母資料",
      maps=[(MOM, "RelatedPerson.name.text"), (COMP, "Composition.section[mother].entry")],
      note="relationship = v3-RoleCode#NMTH；RelatedPerson.patient 參照通報個案"),
    F("BIRTH_MOTHER_IDNO", "0..1", "String/10", "生母證號", "生母身份證統一編號/外來人口之居留證統一證號。",
      maps=[(MOM, "RelatedPerson.identifier.value")],
      note="identifier.system 依證號種類：身分證→http://www.moi.gov.tw；居留證→http://www.immigration.gov.tw"),
]

# 表17 Report_ContactInfo
REPORT_CONTACT = [
    F("CONTACT_TYPE", "1..1", "Code", "聯絡資料類型", "0:連絡電話/1:手機；連絡電話、手機皆必填。", ex="1",
      maps=[(PAT, "Patient.telecom[phone|mobile]")],
      note="0(連絡電話)→`telecom[phone]`（system = phone、use = home）；1(手機)→`telecom[mobile]`（system = phone、use = mobile）；ConceptMap cdc-contact-type-to-contactpoint"),
    F("CONTACT_VALUE", "1..1", "String/100", "聯絡資料內容", "聯絡電話或手機號碼。", ex="0912345678",
      maps=[(PAT, "Patient.telecom[phone|mobile].value")], note="直接對應；若無請填「無」"),
]

# 表18 Report_Travel
REPORT_TRAVEL = [
    F("TRAVEL_TYPE", "1..1", "Code", "旅遊類型", "旅遊類型；代碼：0.國內旅遊, 1.國外旅遊史, 2.國外居住史。", ex="1", bind=("CDCTravelType", "required"),
      maps=[(TRV, "Observation.component[travelType].valueCodeableConcept.coding")],
      note="coding.system = CodeSystem cdc-travel-type"),
    F("TRAVEL_AREA", "1..1", "Code", "地區", "地區；當旅遊類型為 0 填寫縣市代碼；1、2 填寫國家代碼。", ex="392", bind=("NIDRSTravelArea", "required"),
      maps=[(TRV, "Observation.valueCodeableConcept.coding")],
      note="TRAVEL_TYPE = 0→system = cdc-county；1、2→system = cdc-country(invariant nidrs-trv-1)"),
    F("TRAVEL_AREA_OTHER", "0..1", "String/100", "其他國家", "其他國家；國外旅遊史/國外居住史國家代碼選擇其他時，本欄位必填。",
      maps=[(TRV, "Observation.valueCodeableConcept.text")], note="置於同一 CodeableConcept 之 text"),
    F("TRAVEL_SUB_AREA", "0..1", "String/100", "次級行政區", "次級行政區；國外旅遊史/國外居住史，可選填。", ex="東京",
      maps=[(TRV, "Observation.component[subArea].valueString")], note="直接對應"),
    F("TRAVEL_DATE_FROM", "1..1", "String/10", "開始時間", "開始時間 Ex.2021/01/01；旅遊類型為「國外居住史」時，此欄位為「離境居住國日期」；日期檢核請參考共同欄位檢核條件。", ex="2025/07/20",
      maps=[(TRV, "Observation.effectivePeriod.start")], note=DATE_SLASH),
    F("TRAVEL_DATE_TO", "1..1", "String/10", "結束時間", "結束時間 Ex.2021/01/01；旅遊類型為「國外居住史」時，此欄位為「入境我國日期」。", ex="2025/07/27",
      maps=[(TRV, "Observation.effectivePeriod.end")], note=DATE_SLASH),
]

# 表19 Report_Animal
REPORT_ANIMAL = [
    F("ANIMAL_ID", "1..1", "Code", "接觸動物種類", "接觸動物種類(代碼：動物代碼)。", ex="2", bind=("CDCAnimal", "required"),
      maps=[(ANI, "Observation.valueCodeableConcept.coding")], note="coding.system = CodeSystem cdc-animal"),
    F("ANIMAL_OTHER", "0..1", "String/120", "其他接觸動物", "其他接觸動物；接觸動物種類代碼為其他，本欄位必填。",
      maps=[(ANI, "Observation.valueCodeableConcept.text")], note="置於同一 CodeableConcept 之 text"),
]


# ======================================================================
# 通報單新增/修改 共用區塊
# ======================================================================
def report_block(comp_profile, cond_profile, upd=False):
    return F("REPORT", "1..1", "", "通報單個案共同欄位區塊", "通報單個案共同欄位區塊。",
             maps=[(comp_profile, "Composition")],
             note="以共同欄位建立 Composition 及其 subject(Patient)、author、custodian、各 section 之 entry",
             kids=[
                 F("REPORT", "1..1", "Report_Common", "共同欄位", "共同欄位，欄位請參考通報單共同欄位(Report_Common)。",
                   maps=[(comp_profile, "Composition"), (PAT, "Patient"), (cond_profile, "Condition"), (ENC, "Encounter")],
                   note=("逐欄對應見 Report_Common；修改作業時 REPORT(通報單號)與 MODIFIED_REASON 必填、NOTE 不可填" if upd
                         else "逐欄對應見 Report_Common"),
                   ftype="ReportCommonModel"),
                 F("CONTACT_INFO", "1..*", "Report_ContactInfo", "個案聯絡資料", "個案聯絡資料，欄位請參考通報單聯絡資料(Report_ContactInfo)。",
                   maps=[(PAT, "Patient.telecom")], note="每一筆對應一個 Patient.telecom(phone 或 mobile slice)",
                   ftype="ReportContactInfoModel"),
                 F("TRAVEL", "0..*", "Report_Travel", "旅遊史", "旅遊史，欄位請參考通報單旅遊史(Report_Travel)；共同欄位的旅遊史為有時，需填寫。",
                   maps=[(TRV, "Observation"), (comp_profile, "Composition.section[epidemiology].entry[travel]")],
                   note="每一筆旅遊史建立一筆 Observation-nidrs-travel", ftype="ReportTravelModel"),
                 F("ANIMAL", "0..*", "Report_Animal", "接觸動物史", "接觸動物史，欄位請參考通報單接觸動物史(Report_Animal)；共同欄位的動物接觸史為有時，需填寫。",
                   maps=[(ANI, "Observation"), (comp_profile, "Composition.section[epidemiology].entry[animal]")],
                   note="每一筆接觸動物建立一筆 Observation-nidrs-animal", ftype="ReportAnimalModel"),
             ])


def disease_field(keylen):
    return F("DISEASE_FIELD", "0..*", "", "疾病增補填答", "疾病增補填答，欄位請參考附錄二_法定傳染病增補欄位與檢核邏輯。",
             maps=[(QR, "QuestionnaireResponse.item"), (COMP, "Composition.section[supplement].entry")],
             note="依通報疾病建立 QuestionnaireResponse(questionnaire = https://ancientsky.github.io/fhir_ig_demo/Questionnaire/nidrs-supplement-{疾病代碼})；item 須依 Questionnaire 之群組(section/group)階層巢狀",
             kids=[
                 F("KEY", "1..1", "String/%d" % keylen, "答題編號", "答題編號。", ex="S_QN06111000_AN06111001",
                   maps=[(QR, "QuestionnaireResponse.item.linkId")],
                   note="即 Questionnaire 之 item.linkId(最內層 item)"),
                 F("VALUE", "1..1", "String/200", "答案值", "答案值。", ex="1",
                   maps=[(QR, "QuestionnaireResponse.item.answer.value[x]")],
                   note="依 Questionnaire item.type 轉換：boolean(答案值 1=勾選)→valueBoolean = true；date(yyyy/MM/dd)→valueDate(yyyy-MM-dd)；integer/decimal→valueInteger/valueDecimal；string/text→valueString"),
             ])


def symptom_fields():
    return [
        F("DISEASE_SYMPTOM", "0..*", "int", "主要症狀代碼",
          "疾病與主要症狀關聯代碼，請參考附錄四_通報代碼彙整表之「疾病與主要症狀關連」及「症狀代碼」；若此欄位填寫非該疾病關聯之主要症狀代碼，NIDRS將自動將本欄位改填入其他代碼(999)，並將醫院上傳之症狀改填至「DISEASE_SYMPTOM_OTHER」欄位中。",
          ex=2, maps=[(COND, "Condition.evidence.code.coding")],
          note="整數轉為代碼字串(system = CodeSystem cdc-symptom)，每一症狀一筆 coding；多疾病時依 ConceptMap cdc-disease-symptom 填入相關疾病之 Condition"),
        F("DISEASE_SYMPTOM_OTHER", "0..1", "String/100", "其他症狀", "當主要症狀含有其他代碼「999」時須填寫。",
          maps=[(COND, "Condition.evidence.code.text")], note="置於含 coding 999(其他) 之 evidence.code.text"),
    ]


EMRMSG01 = [
    F("REPORTS", "1..10", "", "通報單", "通報單，可一次通報多筆個案，最多10筆。",
      maps=[(COMP, "Composition"), ("MessageHeader-nidrs-report-create", "MessageHeader.focus")],
      note="每一筆 REPORTS 產生一份 Composition-nidrs-report(及其 Patient、Condition…)，MessageHeader.focus 依序參照(最多 10 筆)",
      kids=[
          report_block(COMP, COND),
          F("DISEASE", "1..1", "", "通報疾病區塊", "通報疾病區塊。",
            maps=[(COMP, "Composition.section[disease]")], note="section.code = LOINC 11450-4",
            kids=[
                F("DISEASE_ID", "1..10", "String/10", "通報疾病ID", "通報疾病ID，同一個案一次最多通報10個法定傳染病。", ex="061",
                  bind=("CDCDisease", "required"),
                  maps=[(COND, "Condition.code.coding[cdcDisease].code"), (COMP, "Composition.section[disease].entry")],
                  note="每一 DISEASE_ID 建立一筆 Condition(system = CodeSystem cdc-disease)；共同欄位之日期、症狀、診斷醫師複製至每一筆"),
            ] + symptom_fields() + [disease_field(200)]),
      ]),
]

EMRMSG02 = [
    F("REPORT", "1..1", "", "通報單", "通報單，一次可以修改一筆通報單。",
      maps=[(COMPU, "Composition"), ("MessageHeader-nidrs-report-update", "MessageHeader.focus")],
      note="產生一份 Composition-nidrs-report-update",
      kids=[
          report_block(COMPU, CONDU, upd=True),
          F("DISEASE", "1..1", "", "通報疾病區塊", "通報疾病區塊；修改作業不傳送 DISEASE_ID。",
            maps=[(COMPU, "Composition.section[disease]"), (CONDU, "Condition")],
            note="原規格無 DISEASE_ID，惟 Condition.code 為必填：請填入原通報疾病代碼(即通報時之 DISEASE_ID / HISMsg01 REPORT_LIST.DISEASE_ID)，section[disease].entry 僅 1 筆",
            kids=[
                F("DISEASE_SYMPTOM", "0..*", "int", "主要症狀代碼", "疾病與主要症狀關聯代碼，請參考附錄四，若非疾病對應之代碼，則歸在其他(999)。", ex=2,
                  maps=[(CONDU, "Condition.evidence.code.coding")], note="整數轉為代碼字串(system = CodeSystem cdc-symptom)"),
                F("DISEASE_SYMPTOM_OTHER", "0..1", "String/100", "其他症狀", "當主要症狀含有其他時須填寫。",
                  maps=[(CONDU, "Condition.evidence.code.text")], note="置於含 coding 999(其他) 之 evidence.code.text"),
                disease_field(20),
            ]),
      ]),
]


def error_list():
    return F("ERROR_LIST", "0..*", "", "錯誤清單", "失敗時，錯誤清單。",
             maps=[(OO, "OperationOutcome.issue"), (MHR, "MessageHeader.response.details")],
             note="每一筆錯誤對應一個 issue(severity = error)",
             kids=[
                 F("ERROR_Code", "1..1", "String/10", "錯誤代碼", "錯誤代碼。", ex="IDA3020002", bind=("CDCProcessingResult", "extensible"),
                   maps=[(OO, "OperationOutcome.issue.details.coding.code")],
                   note="coding.system = CodeSystem cdc-processing-result；10 碼 = 項目代碼(6碼)+檢核代碼(4碼)，組成部分見 CDCProcessingResultPart；issue.code 依錯誤性質(必填→required、格式→value、重複通報→duplicate，其餘→processing)"),
                 F("ERROR_MESSAGE", "1..1", "String/2000", "錯誤訊息", "錯誤訊息。", ex="通報單-個案資料：患者「身份證字號/護照號碼」必填寫",
                   maps=[(OO, "OperationOutcome.issue.diagnostics")], note="直接對應；可同時填入 issue.details.text"),
             ])


def status_fields(event, multi=False):
    st_note = "SUCCESS→response.code = ok；FAILURE→response.code = fatal-error"
    if multi:
        st_note += "。多筆 REPORT_RESULT 時，MessageHeader.response.code 表達整體結果(全部成功→ok、任一失敗→fatal-error)，各筆結果以其 OperationOutcome-nidrs 表達(SUCCESS：issue.severity = information、issue.code = informational、details = CDCProcessingResult#SUCCESS)"
    return [
        F("STATUS", "1..1", "Code", "處理狀態", "處理狀態；SUCCESS:成功(成立通報單號請參考REPORT_LIST)；FAILURE:失敗，失敗訊息請參考ERROR_LIST。", ex="SUCCESS",
          maps=[(MHR, "MessageHeader.response.code")], note=st_note),
        F("RESULT_TIME", "1..1", "Datetime", "處理日期", "處理日期；格式 yyyyMMdd HH:mi:ss。", ex="20250803 10:15:30",
          maps=[(BR, "Bundle.timestamp")], note=DT_SPACE + ("；多筆時取最晚者" if multi else "")),
    ]


def report_list():
    return F("REPORT_LIST", "0..*", "", "通報單清單", "成功時，通報單清單。",
             maps=[(CASEREF, "Condition"), (BR, "Bundle.entry[condition]"), (MHR, "MessageHeader.focus")],
             note="每一筆(每一通報疾病)建立一筆 Condition-nidrs-case-ref",
             kids=[
                 F("REPORT_ID", "1..1", "String/13", "通報單號", "通報單號。", ex="1140300012345",
                   maps=[(CASEREF, "Condition.identifier[reportId].value")], note="system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id"),
                 F("DISEASE_ID", "1..1", "String/10", "通報疾病", "通報疾病。", ex="061", bind=("CDCDisease", "required"),
                   maps=[(CASEREF, "Condition.code.coding.code")], note="system = CodeSystem cdc-disease"),
                 F("IDNO", "1..1", "String/10", "個案證號", "個案證號(NIDRS 自動編碼者回傳流水證號)。", ex="A123456789",
                   maps=[(CASEREF, "Condition.subject.identifier.value")],
                   note="subject 以 identifier 參照(logical reference)；system 依證號種類同 Patient-nidrs.identifier，AA/BB/CC 自動編碼者使用 nidrs-temp-id"),
             ])


HISMSG01 = [
    F("REPORT_RESULT", "1..10", "", "通報單新增結果", "通報單新增結果(對應 EMRMsg01 之每一筆 REPORTS)。",
      maps=[(BR, "Bundle"), (OO, "OperationOutcome")],
      note="Bundle-nidrs-response 一則；每一筆 REPORT_RESULT 建立一筆 OperationOutcome-nidrs(entry[operationOutcome])，成功者另建立 REPORT_LIST 之 Condition",
      kids=status_fields("HISMsg01", multi=True) + [report_list(), error_list()]),
]

HISMSG02 = [
    F("REPORT_RESULT", "1..1", "", "通報單修改結果", "通報單修改結果。",
      maps=[(BR, "Bundle")], note="Bundle-nidrs-response 一則",
      kids=status_fields("HISMsg02") + [report_list(), error_list()]),
]

HISMSG03 = [
    F("REPORT_RESULT", "1..1", "", "病歷資料傳送結果", "通報單病歷資料傳送結果(原規格說明欄記為「通報單修改結果」)。",
      maps=[(BR, "Bundle")], note="Bundle-nidrs-response 一則",
      kids=[
          F("STATUS", "1..1", "Code", "處理狀態", "處理狀態；SUCCESS:成功；FAILURE:失敗，失敗訊息請參考ERROR_LIST。", ex="SUCCESS",
            maps=[(MHR, "MessageHeader.response.code")], note="SUCCESS→ok；FAILURE→fatal-error"),
          F("RESULT_TIME", "1..1", "Datetime", "處理日期", "處理日期；格式 yyyyMMdd HH:mi:ss。", ex="20250803 10:15:30",
            maps=[(BR, "Bundle.timestamp")], note=DT_SPACE),
          error_list(),
      ]),
]

EMRMSG03 = [
    F("REPORT", "1..1", "", "病歷資料", "通報單病歷資料。",
      maps=[(DOC, "DocumentReference")], note="建立一筆 DocumentReference-nidrs",
      kids=[
          F("REPORT_ID", "1..1", "String/13", "通報單號", "通報單號。", ex="1140300012345",
            maps=[(DOC, "DocumentReference.context.related.identifier.value")],
            note="context.related 以 identifier(system = nidrs-report-id)參照 Condition-nidrs-case-ref，Bundle 內不需附 Condition"),
          F("HOSPITAL", "1..1", "String/10", "通報醫院醫事機構代碼", "通報醫院醫事機構代碼。", ex="0101090517",
            maps=[(ORG, "Organization.identifier[hospitalCode].value"), (DOC, "DocumentReference.custodian"), ("MessageHeader-nidrs-document", "MessageHeader.sender")],
            note="建立 Organization-nidrs-hospital(Bundle.entry[organization])，custodian 與 MessageHeader.sender 參照之"),
          F("FILE_NAME", "1..1", "String/255", "病歷檔案名稱", "病歷檔案名稱。", ex="出院病摘_20250810.pdf",
            maps=[(DOC, "DocumentReference.content.attachment.title")], note="直接對應"),
          F("FILE_CATEGORY", "1..1", "Code", "檔案類別", "檔案類別；1:出院病摘、2:門診病歷、3:檢驗報告、4:醫療影像及報告、0:其他；若非前述檔案類型，則歸在0其他。", ex="1",
            bind=("CDCFileCategory", "required"),
            maps=[(DOC, "DocumentReference.category.coding.code")], note="system = CodeSystem cdc-file-category"),
          F("FILE_TYPE", "1..1", "Code", "檔案類型", "檔案類型；1:docx、2:pdf、3:odt。", ex="2",
            maps=[(DOC, "DocumentReference.content.attachment.contentType")],
            note="轉為 MIME type：1→application/vnd.openxmlformats-officedocument.wordprocessingml.document；2→application/pdf；3→application/vnd.oasis.opendocument.text(ValueSet NIDRSFileMimeType)"),
          F("ANAMNESIS", "1..1", "String", "病歷資料", "病歷資料，以base64編碼。", ex="JVBERi0xLjQK",
            maps=[(DOC, "DocumentReference.content.attachment.data")], note="base64 字串直接填入 base64Binary"),
      ]),
]


def sample_common_tail(sp, sr, unit_note=True):
    return [
        F("RECEIVED_UNIT_TYPE", "1..1", "String/3", "指定收件單位類型",
          "指定收件單位類型；代碼定義：1:疾管署、6:認可實驗室；送件單位類型可選填項目與送驗疾病對應，對應關係可參考附錄四代碼彙整表(疾管署之可送驗疾病代碼；認可實驗室之可送驗疾病代碼、指定檢驗機構之可送驗疾病代碼)。",
          ex="1", bind=("CDCReceivedUnitType", "required"),
          maps=[(LAB, "Organization.type.coding.code"), (sr, "ServiceRequest.performer")],
          note="system = CodeSystem cdc-received-unit-type；建立 Organization-nidrs-lab，ServiceRequest.performer 參照之"),
        F("RECEIVED_UNIT", "1..1", "String/10", "指定收件單位代碼",
          "指定收件單位代碼；單位代碼與指定收件單位類型對應，類型須一致；代碼定義請參考附錄四代碼彙整表(指定送驗單位_疾管署單位代碼；指定送驗單位_認可實驗室代碼、指定送驗單位_指定檢驗機構代碼)。",
          ex="15",
          maps=[(LAB, "Organization.identifier.value")],
          note="類型 1→identifier.system = CodeSystem cdc-lab-unit 之 URL；類型 6→cdc-approved-lab 或醫事機構代碼(invariant nidrs-lab-1)"),
    ]


SAMPLE = F("SAMPLE", "0..1", "", "法傳送驗單欄位",
           "法傳送驗單欄位；原規格未列基數，依 Bundle-nidrs-sample 一則訊息傳送 SAMPLE 或 TB_SAMPLE 其中之一。",
           maps=[(SR, "ServiceRequest"), (SP, "Specimen")],
           note="建立 ServiceRequest-nidrs-sample 與 Specimen-nidrs；Patient(subject)不在原欄位內，須依通報單號由 HIS 帶入或以 identifier 參照",
           kids=[
               F("Report", "1..1", "String/13", "法傳通報單編號", "法傳通報單編號。", ex="1140300012345",
                 maps=[(SR, "ServiceRequest.supportingInfo[report].identifier.value")],
                 note="supportingInfo[report] 以 identifier(system = nidrs-report-id)參照 Condition-nidrs-case-ref"),
               F("BarCode", "0..1", "String/20", "送驗單編號",
                 "送驗單編號；此欄位可不填，填寫內容為疾管署所發放bar-Code，格式為XX-XXX-XXXXXX共13碼之編號，若未填將於送驗單新增成功時由系統自動編號格式為15碼數字。",
                 ex="AB-123-456789", maps=[(SR, "ServiceRequest.identifier[barcode].value")],
                 note="system = https://lims.cdc.gov.tw/"),
               F("HOSPITAL_SAMPLING_NO", "0..1", "String/20", "院內檢體編號", "院內檢體編號。", ex="S2025080301",
                 maps=[(SP, "Specimen.identifier.value")], note="identifier.system 由送驗單位自訂(如院所網域 URL)"),
               F("ISCORPSEDISSECTION", "0..1", "Code", "屍體解剖", "屍體解剖；0否(預設值)；1是。", ex="0",
                 maps=[(SP, "Specimen.extension[autopsy].valueBoolean")], note="0→false、1→true；未填視為 false"),
               F("SAMPLE_TYPE", "1..1", "Code", "檢體類別",
                 "檢體類別；檢體類別與「屍體解剖」及「送驗疾病」有其關聯性，三者必須符合採檢手冊之定義；代碼定義請參考附錄四代碼彙整表中的「送驗疾病與檢體類別之關聯」代碼。",
                 ex="40", bind=("CDCSpecimenType", "required"),
                 maps=[(SP, "Specimen.type.coding.code")], note="system = CodeSystem cdc-specimen-type；組合檢核見 ConceptMap cdc-test-disease-specimen"),
               F("SAMPLE_TYPE_OTHER", "0..1", "String/120", "其他檢體備註說明", "其他檢體備註說明；若「檢體類別」為「其他」，此欄位為必填。",
                 maps=[(SP, "Specimen.type.text")], note="置於同一 CodeableConcept 之 text"),
               F("DISEASE", "1..1", "String/100", "送驗疾病代碼", "送驗疾病代碼；每個疾病之間以逗號區隔；「送驗疾病」不可重複。", ex="061,A920",
                 maps=[(SR, "ServiceRequest.reasonCode.coding.code")],
                 note="以逗號拆分，每一送驗疾病建立一個 reasonCode(system = CodeSystem cdc-test-disease)，不可重複"),
               F("DRUG_BEFORE_SAMPLING", "0..1", "Code", "採檢前投藥情形", "採檢前投藥情形；0:否 1:是。", ex="0",
                 maps=[(SR, "ServiceRequest.extension[drugBeforeSampling].valueBoolean")], note="0→false、1→true"),
               F("COMMENTS", "0..1", "String/100", "個案備註", "個案備註。",
                 maps=[(SR, "ServiceRequest.note.text")], note="直接對應"),
               F("REQUESTER", "1..1", "String/20", "送驗人員", "送驗人員。", ex="張護理師",
                 maps=[(PR, "Practitioner.name.text"), (SR, "ServiceRequest.requester")],
                 note="建立 Practitioner 與 PractitionerRole-nidrs(organization = 送驗單位)，requester 參照該 PractitionerRole"),
               F("SAMPLING_HOSPITAL", "1..1", "String/10", "送驗單位代碼", "送驗單位代碼；醫事機構代碼。", ex="0101090517",
                 maps=[(ORG, "Organization.identifier[hospitalCode].value"), (PRR, "PractitionerRole.organization"), ("MessageHeader-nidrs-sample", "MessageHeader.sender")],
                 note="建立 Organization-nidrs-hospital"),
               F("SAMPLING_HOSPITAL_EMAIL", "0..1", "String/60", "送驗單位電子信箱", "送驗單位電子信箱。", ex="lab@example.org.tw",
                 maps=[(ORG, "Organization.telecom.value")], note="telecom.system = email"),
           ] + sample_common_tail(SP, SR) + [
               F("SAMPLED_DAY", "1..1", "String/8", "檢體採檢日", "檢體採檢日；西元日期YYYYMMDD。", ex="20250803",
                 maps=[(SP, "Specimen.collection.collectedDateTime")], note=DATE_8),
           ])

TB_SAMPLE = F("TB_SAMPLE", "0..1", "", "法傳TB送驗單欄位",
              "法傳TB送驗單欄位；原規格未列基數，依 Bundle-nidrs-sample 一則訊息傳送 SAMPLE 或 TB_SAMPLE 其中之一。",
              maps=[(SRTB, "ServiceRequest"), (SPTB, "Specimen"), (PATTB, "Patient")],
              note="建立 ServiceRequest-nidrs-tb-sample、Specimen-nidrs-tb 與 Patient-nidrs-tb-sample；reasonCode 固定為 CDCTestDisease#010(結核病)",
              kids=[
                  F("ReportID", "0..1", "String/13", "法傳通報單號", "法傳通報單號；非通報個案可不填。", ex="1140300012345",
                    maps=[(SRTB, "ServiceRequest.supportingInfo[report].identifier.value")],
                    note="以 identifier(system = nidrs-report-id)參照；未填則不產生 supportingInfo[report]"),
                  F("BarCode", "0..1", "String/20", "送驗單編號",
                    "送驗單編號；此欄位可不填，填寫內容為疾管署所發放bar-Code，格式為XX-XXX-XXXXXX共13碼之編號，若未填將於送驗單新增成功時由系統自動編號格式為15碼數字。",
                    maps=[(SRTB, "ServiceRequest.identifier[barcode].value")], note="system = https://lims.cdc.gov.tw/"),
                  F("HOSPITAL_SAMPLING_NO", "0..1", "String/20", "院內檢體編號", "院內檢體編號。",
                    maps=[(SPTB, "Specimen.identifier.value")], note="identifier.system 由送驗單位自訂"),
                  F("SAMPLE_TYPE", "1..1", "String/3", "檢體類別", "檢體類別；代碼定義請參考附錄四代碼彙整表中的「結核病檢體類別」代碼。", ex="14",
                    bind=("CDCTBSpecimenType", "required"),
                    maps=[(SPTB, "Specimen.type.coding.code")], note="system = CodeSystem cdc-tb-specimen-type"),
                  F("SAMPLE_TYPE_OTHER_DESC", "0..1", "String/120", "其他檢體備註說明", "其他檢體備註說明。",
                    maps=[(SPTB, "Specimen.type.text")], note="置於同一 CodeableConcept 之 text"),
                  F("PHTESTITEM", "1..*", "String/20", "送驗項目",
                    "送驗項目，可多選格式必須為陣列，例如：[1,8]；代碼定義請參考附錄四代碼彙整表中的「結核病送驗項目代碼」。原規格基數記為 1..1、型態 String/20，惟其值為陣列，故本模型以 1..* 表達。",
                    ex="1", bind=("CDCTBTestItem", "required"),
                    maps=[(SRTB, "ServiceRequest.orderDetail.coding.code")],
                    note="陣列之每一項目建立一個 orderDetail(system = CodeSystem cdc-tb-test-item)"),
                  F("PHTESTITEM_OTHER_DESC", "0..1", "String/100", "送驗項目其他說明", "送驗項目其他說明。",
                    maps=[(SRTB, "ServiceRequest.orderDetail.text")], note="置於「其他」項目之 orderDetail.text"),
                  F("SampleReasonXPERT", "0..1", "String/20", "疾管署分子快速檢測送驗原因",
                    "送驗項目：疾管署分子快速檢測；代碼定義：1失落再治、2失敗再治、3結核病復發、4重開非復發曾使用抗結核藥物4週以上、5抗藥性結核病個案接觸者、6高風險鄉鎮新發生個案、7曾長期停留高負擔國家、8RMP抗藥、9治療2個月之痰培養仍為陽性者、10INH抗藥擬申請二線藥者、11因藥物副作用擬申請二線藥者、12通報結核病之畜牧場人員、13M. bovis結核個案或動物之接觸者轉為個案者、14潛伏結核感染治療(LTBI)個案結核病發病者、15其他。",
                    ex="3", bind=("CDCXpertReason", "required"),
                    maps=[(SRTB, "ServiceRequest.extension[xpertReason].valueCodeableConcept.coding.code")],
                    note="system = CodeSystem cdc-xpert-reason"),
                  F("SampleReasonXPERT_other", "0..1", "String/50", "疾管署分子快速檢測其他說明", "疾管署分子快速檢測其他說明。",
                    maps=[(SRTB, "ServiceRequest.extension[xpertReason].valueCodeableConcept.text")], note="置於同一 CodeableConcept 之 text"),
                  F("TB_MEDICINE_USE_ID", "0..1", "String/1", "抗結核菌藥物", "抗結核菌藥物；代碼定義：N未用藥物；1服用<2週；2服用>2週。", ex="N",
                    bind=("CDCTBMedicineUse", "required"),
                    maps=[(SRTB, "ServiceRequest.extension[tbMedicineUse].valueCodeableConcept.coding.code")],
                    note="system = CodeSystem cdc-tb-medicine-use"),
                  F("REQUESTER", "1..1", "String/10", "送驗人員", "送驗人員。", ex="張護理師",
                    maps=[(PR, "Practitioner.name.text"), (SRTB, "ServiceRequest.requester")],
                    note="建立 Practitioner 與 PractitionerRole-nidrs，requester 參照該 PractitionerRole"),
                  F("SAMPLING_HOSPITAL", "1..1", "String/10", "送驗單位", "送驗單位(IDA醫事機構代碼表)。", ex="0101090517",
                    maps=[(ORG, "Organization.identifier[hospitalCode].value"), (PRR, "PractitionerRole.organization"), ("MessageHeader-nidrs-sample", "MessageHeader.sender")],
                    note="建立 Organization-nidrs-hospital"),
              ] + sample_common_tail(SPTB, SRTB) + [
                  F("SAMPLED_DAY", "1..1", "String/8", "採檢日", "採檢日；西元日期YYYYMMDD，若送驗疾病為結核病時，此欄位必須在送驗日之前(或同日)。", ex="20250803",
                    maps=[(SPTB, "Specimen.collection.collectedDateTime")], note=DATE_8),
                  F("PHPROVIDEDATE", "1..1", "String/8", "送驗日", "送驗日；西元日期YYYYMMDD，若送驗疾病為結核病時，此欄位必須在採檢日之後(或同日)。", ex="20250804",
                    maps=[(SRTB, "ServiceRequest.authoredOn")], note=DATE_8),
                  F("IDNO", "1..1", "String/10", "身分證字號", "身分證字號。", ex="A123456789",
                    maps=[(PATTB, "Patient.identifier[idCardNumber|residentNumber|passportNumber|nidrsTempId].value")],
                    note="依證號種類擇一 slice(同 Report_Common.IDNO)"),
                  F("NAME", "1..1", "String/30", "姓名", "姓名。", ex="陳大華",
                    maps=[(PATTB, "Patient.name[usual].text")], note="直接對應"),
                  F("INSURANCENO", "0..1", "String/20", "健保卡序號", "健保卡序號，若無請填寫「無」。", ex="000012345678",
                    maps=[(PATTB, "Patient.identifier[nhiCardNumber].value")], note="值為「無」時不產生 identifier；system = https://www.nhi.gov.tw"),
                  F("BIRTHDAY", "1..1", "String/8", "出生日期", "出生日期；西元日期YYYYMMDD。", ex="19900520",
                    maps=[(PATTB, "Patient.birthDate")], note=DATE_8),
                  F("SEX", "1..1", "String/1", "性別", "性別；代碼定義：F女生；M男生。", ex="M", bind=("CDCGender", "required"),
                    maps=[(PATTB, "Patient.gender")], note="F→female、M→male"),
                  F("PHCASENO", "0..1", "String/20", "病歷號碼", "病歷號碼。", ex="0012345",
                    maps=[(PATTB, "Patient.identifier[medicalRecord].value")], note="identifier.type = v2-0203#MR；system 由院所自訂"),
                  F("NATIONALITY", "1..1", "String/3", "國籍國家代碼", "國籍國家代碼；本國請填寫中華民國「158」；代碼定義請參考附錄四代碼彙整表中的「國家代碼」。", ex="158",
                    bind=("CDCCountry", "required"),
                    maps=[(PATTB, "Patient.extension[nationality].extension[code].valueCodeableConcept.coding")],
                    note="system = CodeSystem cdc-country"),
                  F("NATIONALITY_OTHER", "0..1", "String/20", "其他國家", "其他國家。",
                    maps=[(PATTB, "Patient.extension[nationality].extension[code].valueCodeableConcept.text")], note="置於同一 CodeableConcept 之 text"),
                  F("RESIDENCE_COUNTY", "1..1", "String/5", "居住縣市", "居住縣市；代碼定義請參考附錄四代碼彙整表中的「縣市代碼」。", ex="65000",
                    bind=("CDCCounty", "required"),
                    maps=[(PATTB, "Patient.address.extension[adminArea].extension[county].valueCoding")], note="system = CodeSystem cdc-county"),
                  F("RESIDENCE_TOWN", "1..1", "String/8", "居住市區鄉鎮", "居住市區鄉鎮；代碼定義請參考附錄四代碼彙整表中的「縣市代碼」。", ex="65000010",
                    bind=("CDCTown", "required"),
                    maps=[(PATTB, "Patient.address.extension[adminArea].extension[town].valueCoding")], note="system = CodeSystem cdc-town"),
                  F("ADDRESS", "1..1", "String/40", "居住詳細地址", "居住詳細地址。", ex="文化路一段100號",
                    maps=[(PATTB, "Patient.address.text")], note="直接對應"),
              ])

EMRMSG04 = [SAMPLE, TB_SAMPLE]


def rs(name, card, short, maps, note, ex=None, bind=None, defn=None):
    return F(name, card, "String", short, defn or (short + "(原規格未提供說明，依 EMRMsg04 同名欄位)。"), ex=ex, bind=bind, maps=maps, note=note)


HISMSG04 = [
    F("SAMPLE_RESULT", "1..1", "", "通報單送驗新增結果", "通報單送驗新增結果。",
      maps=[(BR, "Bundle")], note="Bundle-nidrs-response 一則(MessageHeader.eventCoding = HISMsg04)",
      kids=[
          F("Success", "1..1", "bool", "處理狀態", "處理狀態；true:成功、false:失敗。", ex=True,
            maps=[(MHR, "MessageHeader.response.code")], note="true→ok；false→fatal-error"),
          F("Message", "0..1", "String", "處理訊息", "處理訊息(原規格未提供說明)。",
            maps=[(OO, "OperationOutcome.issue.details.text")],
            note="失敗時建立 OperationOutcome-nidrs(issue.severity = error)；成功時可省略或以 severity = information 表達"),
          F("Exception", "0..1", "String", "例外訊息", "例外訊息(原規格未提供說明)。",
            maps=[(OO, "OperationOutcome.issue.diagnostics")], note="直接對應"),
          F("ReturnData", "0..1", "", "送驗清單", "成功時，送驗清單如下。",
            maps=[(BR, "Bundle.entry[serviceRequest]"), (BR, "Bundle.entry[specimen]")], note="成功時回傳之送驗單",
            kids=[
                F("SAMPLE", "0..1", "", "送驗單", "送驗單。",
                  maps=[(SR, "ServiceRequest"), (SP, "Specimen"), (MHR, "MessageHeader.focus")],
                  note="回應 Bundle 不另附 Patient、Practitioner、Organization：ServiceRequest/Specimen.subject 以 identifier(個案證號)參照，requester/performer 以 contained 資源表達",
                  kids=[
                      rs("Report", "1..1", "法傳通報單編號", [(SR, "ServiceRequest.supportingInfo[report].identifier.value")], "以 identifier(system = nidrs-report-id)參照", ex="1140300012345"),
                      rs("BarCode", "1..1", "送驗單編號", [(SR, "ServiceRequest.identifier[barcode].value")], "疾管署 bar-code(13碼)或系統自動編號(15碼數字)；system = https://lims.cdc.gov.tw/", ex="202508030000001",
                         defn="送驗單編號；送驗時未填者為系統自動編號(15碼數字)。"),
                      rs("HOSPITAL_SAMPLING_NO", "0..1", "院內檢體編號", [(SP, "Specimen.identifier.value")], "直接對應"),
                      rs("ISCORPSEDISSECTION", "0..1", "屍體解剖", [(SP, "Specimen.extension[autopsy].valueBoolean")], "0→false、1→true"),
                      rs("SAMPLE_TYPE", "1..1", "檢體類別", [(SP, "Specimen.type.coding.code")], "system = CodeSystem cdc-specimen-type"),
                      rs("SAMPLE_TYPE_OTHER", "0..1", "其他檢體備註說明", [(SP, "Specimen.type.text")], "置於同一 CodeableConcept 之 text"),
                      rs("DISEASE", "1..1", "送驗疾病代碼", [(SR, "ServiceRequest.reasonCode.coding.code")], "以逗號拆分，每一疾病一個 reasonCode(system = CodeSystem cdc-test-disease)"),
                      rs("DISEASE_OTHER", "0..1", "其他送驗疾病", [(SR, "ServiceRequest.reasonCode.text")],
                         "原規格未說明；推定為送驗疾病「其他(0000)」之說明，置於該 reasonCode.text",
                         defn="其他送驗疾病說明(原規格未提供說明，EMRMsg04 無此欄位)。"),
                      rs("DRUG_BEFORE_SAMPLING", "0..1", "採檢前投藥情形", [(SR, "ServiceRequest.extension[drugBeforeSampling].valueBoolean")], "0→false、1→true"),
                      rs("COMMENTS", "0..1", "個案備註", [(SR, "ServiceRequest.note.text")], "直接對應"),
                      rs("REQUESTER", "1..1", "送驗人員", [(SR, "ServiceRequest.requester"), (PRR, "PractitionerRole.practitioner.display")], "回應 Bundle 不附 Practitioner/PractitionerRole，requester 指向 contained PractitionerRole-nidrs，送驗人員姓名填 practitioner.display"),
                      rs("SAMPLING_HOSPITAL", "1..1", "送驗單位代碼", [(PRR, "PractitionerRole.organization.identifier.value")], "同一 contained PractitionerRole 之 organization 以醫事機構代碼(identifier)參照"),
                      rs("SAMPLING_HOSPITAL_EMAIL", "1..1", "送驗單位電子信箱", [(ORG, "Organization.telecom.value")], "telecom.system = email；回應中可省略(資訊已於送驗時提供)"),
                      rs("RECEIVED_UNIT_TYPE", "1..1", "指定收件單位類型", [(SR, "ServiceRequest.performer"), (LAB, "Organization.type.coding.code")], "performer 指向 contained Organization-nidrs-lab；system = CodeSystem cdc-received-unit-type"),
                      rs("RECEIVED_UNIT", "1..1", "指定收件單位代碼", [(LAB, "Organization.identifier.value")], "置於同一 contained Organization-nidrs-lab"),
                      rs("SAMPLED_DAY", "1..1", "檢體採檢日", [(SP, "Specimen.collection.collectedDateTime")], "依實際回傳格式(yyyyMMdd 或 yyyy/MM/dd)轉為 yyyy-MM-dd"),
                      rs("CREATE_DAY", "1..1", "送驗單建立日", [(SR, "ServiceRequest.authoredOn")], "依實際回傳格式轉為 FHIR dateTime(含時間時補 +08:00)",
                         defn="送驗單建立日(原規格未提供說明)。"),
                      rs("SAMPLED_TIMES", "1..1", "採檢次數", [(SP, "Specimen.note.text")],
                         "原規格未說明(推定為採檢次數/次別)；本 IG Profile 未定義專屬元素，暫以 Specimen.note.text 記錄",
                         defn="採檢次數(原規格未提供說明，EMRMsg04 無此欄位)。"),
                  ]),
            ]),
      ]),
]

# ======================================================================
# 主動回饋：ReportDetermineResult / SampleResult
# ======================================================================
DETERMINE = [
    F("ReportId", "1..1", "string", "通報單編號", "通報單編號。", ex="1140300012345",
      maps=[(DET, "Condition.identifier[reportId].value")], note="system = https://ancientsky.github.io/fhir_ig_demo/sid/nidrs-report-id"),
    F("DiseaseId", "0..1", "string", "通報疾病代碼", "通報疾病代碼。", ex="061", bind=("CDCDisease", "required"),
      maps=[(DET, "Condition.code.coding.code")], note="system = CodeSystem cdc-disease"),
    F("DetermineStatus", "0..1", "string", "研判結果代碼", "研判結果代碼。", ex="5", bind=("CDCDetermineStatus", "required"),
      maps=[(DET, "Condition.extension[determineResult].extension[status].valueCodeableConcept.coding.code"), (DET, "Condition.verificationStatus")],
      note="system = CodeSystem cdc-determine-status；verificationStatus 依 ConceptMap cdc-determine-status-to-condition-ver-status 對應"),
    F("DetermineDate", "0..1", "string", "研判時間", "研判時間(原規格未定義格式)。",
      maps=[(DET, "Condition.extension[determineResult].extension[date].valueDateTime")],
      note="轉為 FHIR dateTime(yyyy-MM-dd 或 yyyy-MM-ddTHH:mm:ss+08:00)"),
    F("IDNO", "0..1", "string", "身分證號", "身分證號。", ex="A123456789",
      maps=[(DET, "Condition.subject.identifier.value")], note="subject 以 identifier 參照；system 依證號種類"),
    F("PHB_RECEIVED_DAY", "0..1", "string", "衛生局收到日", "衛生局收到日(原規格未定義格式)。",
      maps=[(DET, "Condition.extension[phbReceivedDate].valueDate")], note="轉為 FHIR date(yyyy-MM-dd)"),
    F("CDC_RECEIVED_DATE", "0..1", "string", "建檔日", "建檔日(原規格未定義格式)。",
      maps=[(DET, "Condition.extension[cdcReceivedDate].valueDate")], note="轉為 FHIR date(yyyy-MM-dd)"),
]

ANTIBODY = [
    F("SeqNo", "1..1", "int", "血清學檢驗序號", "血清學檢驗序號。", ex=1,
      maps=[(OAB, "Observation.identifier.value")], note="整數轉為字串；建議與送驗單編號組合以確保唯一"),
    F("AntibodyId", "0..1", "string", "血清學檢驗方法代碼", "血清學檢驗方法代碼。",
      maps=[(OAB, "Observation.code.coding.code")], note="system = https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-antibody-method(content = not-present)"),
    F("AntibodyName", "0..1", "string", "血清學檢驗方法名稱", "血清學檢驗方法名稱。",
      maps=[(OAB, "Observation.code.coding.display")], note="亦可填入 code.text"),
    F("AntibodyResultId", "0..1", "string", "血清學檢驗結果代碼", "血清學檢驗結果代碼。",
      maps=[(OAB, "Observation.interpretation.coding.code")], note="system = TWIDIR CodeSystem twcdc-testresult-values"),
    F("AntibodyResultName", "0..1", "string", "血清學檢驗結果名稱", "血清學檢驗結果名稱。",
      maps=[(OAB, "Observation.interpretation.coding.display")], note="直接對應"),
    F("Titer", "0..1", "string", "效價", "效價(Titer)。", ex="1:320",
      maps=[(OAB, "Observation.component[titer].valueString")], note="component.code = CDCNIDRSObservation#TITER"),
    F("FourFoldRise", "1..1", "bool", "是否四倍上升", "是否四倍上升。", ex=False,
      maps=[(OAB, "Observation.component[fourFoldRise].valueBoolean")], note="component.code = CDCNIDRSObservation#FOUR_FOLD_RISE"),
    F("Comments", "0..1", "string", "血清學檢驗結果備註", "血清學檢驗結果備註。",
      maps=[(OAB, "Observation.note.text")], note="直接對應"),
    F("ResultDay", "1..1", "DateTime", "血清學檢驗日期", "血清學檢驗日期。", ex="2025-08-09T09:00:00+08:00",
      maps=[(OAB, "Observation.effectiveDateTime")], note=CS_DT),
]

PATHOGEN = [
    F("SeqNo", "1..1", "int", "病原體檢驗序號", "病原體檢驗序號。", ex=1,
      maps=[(OPA, "Observation.identifier.value")], note="整數轉為字串；建議與送驗單編號組合以確保唯一"),
    F("PathogenId", "0..1", "string", "病原體檢驗方法代碼", "病原體檢驗方法代碼。", bind=("CDCPathogenMethod", "extensible"),
      maps=[(OPA, "Observation.code.coding.code")], note="system = CodeSystem cdc-pathogen-method"),
    F("PathogenName", "0..1", "string", "病原體檢驗方法名稱", "病原體檢驗方法名稱。",
      maps=[(OPA, "Observation.code.coding.display")], note="亦可填入 code.text"),
    F("PathogenResultId", "0..1", "string", "病原體檢驗結果代碼", "病原體檢驗結果代碼。",
      maps=[(OPA, "Observation.interpretation.coding.code")], note="system = TWIDIR CodeSystem twcdc-testresult-values"),
    F("PathogenResultName", "0..1", "string", "病原體檢驗結果名稱", "病原體檢驗結果名稱。",
      maps=[(OPA, "Observation.interpretation.coding.display")], note="直接對應"),
    F("MasterId", "0..1", "string", "病原體大類代碼", "病原體大類代碼。", bind=("CDCPathogen", "required"),
      maps=[(OPA, "Observation.valueCodeableConcept.coding.code")],
      note="system = CodeSystem cdc-pathogen；僅有大類(無 DetailId)時填大類代碼，有細類時大類為細類之 parent，可省略"),
    F("MasterName", "0..1", "string", "病原體大類名稱", "病原體大類名稱。",
      maps=[(OPA, "Observation.valueCodeableConcept.coding.display")], note="與 MasterId 同一 coding"),
    F("DetailId", "0..1", "string", "病原體細類代碼", "病原體細類代碼。", bind=("CDCPathogen", "required"),
      maps=[(OPA, "Observation.valueCodeableConcept.coding.code")], note="system = CodeSystem cdc-pathogen；優先使用細類代碼"),
    F("DetailName", "0..1", "string", "病原體細類名稱", "病原體細類名稱。",
      maps=[(OPA, "Observation.valueCodeableConcept.coding.display")], note="與 DetailId 同一 coding"),
    F("SubTypeId", "0..1", "string", "病原體次分型代碼", "病原體次分型代碼。",
      maps=[(OPA, "Observation.component[subtype].valueCodeableConcept.coding.code")],
      note="component.code = CDCNIDRSObservation#PATHOGEN_SUBTYPE；附錄四未提供次分型代碼系統，coding.system 由疾管署定義"),
    F("SubTypeName", "0..1", "string", "病原體次分型名稱", "病原體次分型名稱。",
      maps=[(OPA, "Observation.component[subtype].valueCodeableConcept.text")], note="同時可填入 coding.display"),
    F("Comments", "0..1", "string", "病原體檢驗結果備註", "病原體檢驗結果備註。",
      maps=[(OPA, "Observation.note.text")], note="直接對應"),
    F("ResultDay", "1..1", "DateTime", "病原體檢驗日期", "病原體檢驗日期。", ex="2025-08-09T09:00:00+08:00",
      maps=[(OPA, "Observation.effectiveDateTime")], note=CS_DT),
]

SAMPLE_RESULT = [
    F("ReportId", "1..1", "string", "通報單編號", "通報單編號。", ex="1140300012345",
      maps=[(DR, "DiagnosticReport.extension[report].valueReference.identifier.value")],
      note="workflow-reasonReference 擴充以 identifier(system = nidrs-report-id)參照通報單"),
    F("SampleId", "1..1", "string", "送驗單編號", "送驗單編號。", ex="AB-123-456789",
      maps=[(DR, "DiagnosticReport.identifier[barcode].value"), (DR, "DiagnosticReport.basedOn.identifier.value")],
      note="system = https://lims.cdc.gov.tw/；basedOn 以同一送驗單編號參照 ServiceRequest"),
    F("DiseaseId", "0..1", "string", "送驗疾病代碼", "送驗疾病代碼。", ex="061", bind=("CDCTestDisease", "required"),
      maps=[(DR, "DiagnosticReport.code.coding[testDisease].code")], note="system = CodeSystem cdc-test-disease"),
    F("DiseaseName", "0..1", "string", "送驗疾病中文名稱", "送驗疾病中文名稱。", ex="登革熱",
      maps=[(DR, "DiagnosticReport.code.coding[testDisease].display")], note="亦可填入 code.text"),
    F("ResultInformDay", "1..1", "DateTime", "檢驗結果時間", "檢驗結果時間。", ex="2025-08-10T16:00:00+08:00",
      maps=[(DR, "DiagnosticReport.issued")], note=CS_DT + "(instant 須含秒與時區)"),
    F("ResultId", "0..1", "string", "檢驗結果代碼", "檢驗結果代碼。",
      maps=[(DR, "DiagnosticReport.conclusionCode.coding.code")], note="system = TWIDIR CodeSystem twcdc-testresult-values"),
    F("ResultName", "0..1", "string", "檢驗結果名稱", "檢驗結果名稱。",
      maps=[(DR, "DiagnosticReport.conclusionCode.coding.display")], note="亦可填入 conclusionCode.text"),
    F("SampleAntibodyResults", "0..*", "", "血清學檢驗結果", "血清學檢驗結果清單(List<SampleAntibodyResult>)。",
      maps=[(OAB, "Observation"), (DR, "DiagnosticReport.result")],
      note="每一筆建立一筆 Observation-nidrs-antibody-result，subject 與 DiagnosticReport 相同", kids=ANTIBODY),
    F("SamplePathogenResults", "0..*", "", "病原體檢驗結果", "病原體檢驗結果清單(List<SamplePathogenResult>)。",
      maps=[(OPA, "Observation"), (DR, "DiagnosticReport.result")],
      note="每一筆建立一筆 Observation-nidrs-pathogen-result，subject 與 DiagnosticReport 相同", kids=PATHOGEN),
]

# ======================================================================
# 模型清單
# ======================================================================
CS_NOTE = "原規格為 C# 類別定義，未列基數；本模型將識別欄位設為 1..1、其他參考型別(string、List)為選填，實值型別(int、bool、DateTime)不可為 null 故設為 1..1。"

MODELS = [
    dict(id="ReportCommonModel", src="表16", msg="Report_Common", title="通報單共同欄位(Report_Common)之資料模型",
         desc="NIDRS 電子病歷傳染病自動通報作業 2.0 表16 通報單共同欄位(Report_Common)之資料模型，用於 EMRMsg01 與 EMRMsg02 之 REPORT.REPORT。",
         root=[(COMP, "Composition"), (COMPU, "Composition"), (PAT, "Patient"), (COND, "Condition"), (ENC, "Encounter")],
         rootnote="共同欄位分散對應至 Composition(通報單)、Patient(個案)、Condition(每一通報疾病)、Encounter(病患動向)、Observation(流行病學、死亡原因)、RelatedPerson(生母)、Organization/Practitioner/PractitionerRole(通報單位與人員)",
         fields=REPORT_COMMON, anchor="report-common"),
    dict(id="ReportContactInfoModel", src="表17", msg="Report_ContactInfo", title="通報單聯絡資料(Report_ContactInfo)之資料模型",
         desc="NIDRS 表17 通報單聯絡資料(Report_ContactInfo)之資料模型。",
         root=[(PAT, "Patient.telecom")], rootnote="每一筆聯絡資料對應一個 ContactPoint", fields=REPORT_CONTACT, anchor="report-contactinfo"),
    dict(id="ReportTravelModel", src="表18", msg="Report_Travel", title="通報單旅遊史(Report_Travel)之資料模型",
         desc="NIDRS 表18 通報單旅遊史(Report_Travel)之資料模型。",
         root=[(TRV, "Observation")], rootnote="每一筆旅遊史建立一筆 Observation-nidrs-travel(code = LOINC 8691-8)", fields=REPORT_TRAVEL, anchor="report-travel"),
    dict(id="ReportAnimalModel", src="表19", msg="Report_Animal", title="通報單接觸動物史(Report_Animal)之資料模型",
         desc="NIDRS 表19 通報單接觸動物史(Report_Animal)之資料模型。",
         root=[(ANI, "Observation")], rootnote="每一筆接觸動物建立一筆 Observation-nidrs-animal", fields=REPORT_ANIMAL, anchor="report-animal"),
    dict(id="EMRMsg01Model", src="表8", msg="EMRMsg01", title="通報單新增作業傳送資料結構(EMRMsg01)之資料模型",
         desc="NIDRS 表8 傳染病通報單新增作業結構表-傳送資料結構(EMRMsg01)之資料模型。",
         root=[("Bundle-nidrs-report-create", "Bundle"), ("MessageHeader-nidrs-report-create", "MessageHeader")],
         rootnote="Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg01；原 JSON 以醫事機構憑證進行 JWT 簽章後傳送", fields=EMRMSG01, anchor="emrmsg01"),
    dict(id="HISMsg01Model", src="表9", msg="HISMsg01", title="通報單新增作業回應資料結構(HISMsg01)之資料模型",
         desc="NIDRS 表9 傳染病通報單新增作業結構表-回應資料結構(HISMsg01)之資料模型。",
         root=[(BR, "Bundle"), (MHR, "MessageHeader")], rootnote="MessageHeader.eventCoding = CDCMessageEvent#HISMsg01；response.identifier = 所回覆 EMRMsg01 之 MessageHeader.id", fields=HISMSG01, anchor="hismsg01"),
    dict(id="EMRMsg02Model", src="表10", msg="EMRMsg02", title="通報單修改作業傳送資料結構(EMRMsg02)之資料模型",
         desc="NIDRS 表10 傳染病通報單修改作業結構表-傳送資料結構(EMRMsg02)之資料模型。",
         root=[("Bundle-nidrs-report-update", "Bundle"), ("MessageHeader-nidrs-report-update", "MessageHeader")],
         rootnote="Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg02", fields=EMRMSG02, anchor="emrmsg02"),
    dict(id="HISMsg02Model", src="表11", msg="HISMsg02", title="通報單修改作業回應資料結構(HISMsg02)之資料模型",
         desc="NIDRS 表11 傳染病通報單修改作業結構表-回應資料結構(HISMsg02)之資料模型。",
         root=[(BR, "Bundle"), (MHR, "MessageHeader")], rootnote="MessageHeader.eventCoding = CDCMessageEvent#HISMsg02", fields=HISMSG02, anchor="hismsg02"),
    dict(id="EMRMsg03Model", src="表12", msg="EMRMsg03", title="通報單病歷資料傳送作業傳送資料結構(EMRMsg03)之資料模型",
         desc="NIDRS 表12 傳染病通報單病歷資料傳送作業結構表-傳送資料結構(EMRMsg03)之資料模型。",
         root=[("Bundle-nidrs-document", "Bundle"), ("MessageHeader-nidrs-document", "MessageHeader")],
         rootnote="Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg03", fields=EMRMSG03, anchor="emrmsg03"),
    dict(id="HISMsg03Model", src="表13", msg="HISMsg03", title="通報單病歷資料傳送作業回應資料結構(HISMsg03)之資料模型",
         desc="NIDRS 表13 傳染病通報單病歷資料傳送作業結構表-回應資料結構(HISMsg03)之資料模型。",
         root=[(BR, "Bundle"), (MHR, "MessageHeader")], rootnote="MessageHeader.eventCoding = CDCMessageEvent#HISMsg03", fields=HISMSG03, anchor="hismsg03"),
    dict(id="EMRMsg04Model", src="表14", msg="EMRMsg04", title="通報單送驗新增作業傳送資料結構(EMRMsg04)之資料模型",
         desc="NIDRS 表14 傳染病通報單送驗新增作業結構表-傳送資料結構(EMRMsg04)之資料模型，包含法傳送驗單(SAMPLE)與法傳TB送驗單(TB_SAMPLE)。",
         root=[("Bundle-nidrs-sample", "Bundle"), ("MessageHeader-nidrs-sample", "MessageHeader")],
         rootnote="Bundle.type = message；MessageHeader.eventCoding = CDCMessageEvent#EMRMsg04；MessageHeader.focus 參照 ServiceRequest", fields=EMRMSG04, anchor="emrmsg04"),
    dict(id="HISMsg04Model", src="表15", msg="HISMsg04", title="通報單送驗新增作業回應資料結構(HISMsg04)之資料模型",
         desc="NIDRS 表15 傳染病通報單送驗新增作業結構表-回應資料結構(HISMsg04)之資料模型。",
         root=[(BR, "Bundle"), (MHR, "MessageHeader")], rootnote="MessageHeader.eventCoding = CDCMessageEvent#HISMsg04", fields=HISMSG04, anchor="hismsg04"),
    dict(id="ReportDetermineResultModel", src="表6", msg="PushDetermineResult", title="研判結果主動通知(ReportDetermineResult)之資料模型",
         desc="NIDRS 表6 疾管署主動回饋個案研判結果至通報單位(Web Service PushDetermineResult，參數 ReportDetermineResult)之資料模型。" + CS_NOTE,
         root=[("Bundle-nidrs-push-determine-result", "Bundle"), ("MessageHeader-nidrs-push-determine-result", "MessageHeader"), (DET, "Condition")],
         rootnote="原為 Web Service PushDetermineResult(string jsonString)，回傳 Boolean(True 成功/False 失敗)；FHIR 以訊息 Bundle 傳送，MessageHeader.eventCoding = CDCMessageEvent#PushDetermineResult",
         fields=DETERMINE, anchor="determine-result"),
    dict(id="SampleResultModel", src="表7", msg="PushSampleResult", title="檢驗結果主動通知(SampleResult)之資料模型",
         desc="NIDRS 表7 疾管署主動回饋個案檢驗結果至通報單位(Web Service PushSampleResult，參數 SampleResult，含 SampleAntibodyResult 與 SamplePathogenResult)之資料模型。" + CS_NOTE,
         root=[("Bundle-nidrs-push-sample-result", "Bundle"), ("MessageHeader-nidrs-push-sample-result", "MessageHeader"), (DR, "DiagnosticReport")],
         rootnote="原為 Web Service PushSampleResult(string jsonString)，回傳 Boolean；FHIR 以訊息 Bundle 傳送，MessageHeader.eventCoding = CDCMessageEvent#PushSampleResult；SampleResult 不含個案證號，DiagnosticReport.subject(必填)由疾管署依通報單號帶入個案證號並以 identifier 參照",
         fields=SAMPLE_RESULT, anchor="sample-result"),
]
