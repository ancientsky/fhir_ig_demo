// 本檔為工作說明書本文所定義、但未列於附錄四代碼彙整表之代碼。

CodeSystem: CDCMessageEvent
Id: cdc-message-event
Title: "CDC-NIDRS-訊息事件"
Description: "NIDRS 電子病歷傳染病自動通報作業 2.0 之交換訊息代碼(工作說明書表1傳送機制主要功能表及第四章交換訊息格式)。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #EMRMsg01 "通報單新增" "通報單位傳送通報單新增資訊至疾管署傳染病通報系統。"
* #EMRMsg02 "通報單修改" "通報單位傳送通報單修改資訊至疾管署傳染病通報系統。"
* #EMRMsg03 "通報單病歷檔案上傳" "通報單位傳送病歷資料或檔案至疾管署傳染病通報系統。"
* #EMRMsg04 "通報單送驗" "通報單位傳送送驗單(需含通報單電腦編號)至疾管署傳染病通報系統。"
* #HISMsg01 "通報單新增結果" "疾管署回覆通報單新增結果。"
* #HISMsg02 "通報單修改結果" "疾管署回覆通報單修改結果。"
* #HISMsg03 "通報單病歷檔案上傳結果" "疾管署回覆通報單病歷資料上傳結果。"
* #HISMsg04 "通報單送驗新增結果" "疾管署回覆通報單送驗新增結果。"
* #PushDetermineResult "研判結果主動通知" "通報單研判結果有異動時，疾管署主動通知通報醫療院所(ReportDetermineResult)。"
* #PushSampleResult "檢驗結果主動通知" "通報單之送驗單檢驗結果有異動時，疾管署主動通知通報醫療院所(SampleResult)。"

ValueSet: CDCMessageEvent
Id: cdc-message-event
Title: "CDC-NIDRS-訊息事件值集"
Description: "CDC-NIDRS-訊息事件值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCMessageEvent

ValueSet: CDCMessageEventRequest
Id: cdc-message-event-request
Title: "CDC-NIDRS-通報單位傳送訊息事件值集"
Description: "通報單位傳送至疾管署之訊息事件(EMRMsg01~EMRMsg04)。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* CDCMessageEvent#EMRMsg01
* CDCMessageEvent#EMRMsg02
* CDCMessageEvent#EMRMsg03
* CDCMessageEvent#EMRMsg04

CodeSystem: CDCGender
Id: cdc-gender
Title: "CDC-NIDRS-性別"
Description: "NIDRS 通報單性別(GENDER)及 TB 送驗單性別(SEX)代碼。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #F "女"
* #M "男"
* #X "第三性別"

ValueSet: CDCGender
Id: cdc-gender
Title: "CDC-NIDRS-性別值集"
Description: "CDC-NIDRS-性別值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCGender

CodeSystem: CDCCitizen
Id: cdc-citizen
Title: "CDC-NIDRS-國籍別"
Description: "NIDRS 通報單國籍(CITIZEN)代碼。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #0 "本國籍"
* #1 "非本國籍"

ValueSet: CDCCitizen
Id: cdc-citizen
Title: "CDC-NIDRS-國籍別值集"
Description: "CDC-NIDRS-國籍別值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCCitizen

CodeSystem: CDCContactType
Id: cdc-contact-type
Title: "CDC-NIDRS-聯絡資料類型"
Description: "NIDRS 通報單聯絡資料(Report_ContactInfo.CONTACT_TYPE)代碼；FHIR 以 ContactPoint.system/use 表達，對應見 ConceptMap cdc-contact-type-to-contactpoint。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #0 "連絡電話"
* #1 "手機"

CodeSystem: CDCTravelType
Id: cdc-travel-type
Title: "CDC-NIDRS-旅遊類型"
Description: "NIDRS 通報單旅遊史(Report_Travel.TRAVEL_TYPE)代碼。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #0 "國內旅遊" "TRAVEL_AREA 填寫縣市代碼。"
* #1 "國外旅遊史" "TRAVEL_AREA 填寫國家代碼。"
* #2 "國外居住史" "TRAVEL_AREA 填寫國家代碼；開始時間為離境居住國日期，結束時間為入境我國日期。"

ValueSet: CDCTravelType
Id: cdc-travel-type
Title: "CDC-NIDRS-旅遊類型值集"
Description: "CDC-NIDRS-旅遊類型值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCTravelType

CodeSystem: CDCPatientMovement
Id: cdc-patient-movement
Title: "CDC-NIDRS-病患動向"
Description: "NIDRS 通報單病患動向(HOSPITALIZED_*)，原規格以 8 個布林欄位擇一填寫。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #outpatient "門診" "HOSPITALIZED_OUTPATIENT"
* #emergency "急診待床" "HOSPITALIZED_EMERGENCY"
* #general-ward "入住一般病房" "HOSPITALIZED_GENERAL_WARD；入住一般病房日(HOSPITALIZED_DAY)必填。"
* #icu "入住加護病房" "HOSPITALIZED_ICU；首次入住加護病房日(STAY_IN_ICU)必填、轉出加護病房日(LEAVE_ICU)選填。"
* #isolation-room "入住隔離病房" "HOSPITALIZED_ISOLATION_ROOM；首次入住隔離病房日(STAY_IN_IW)必填、轉出隔離病房日(LEAVE_IW)選填。"
* #discharged "出院" "HOSPITALIZED_DISCHARGED；出院日(DISCHARGE)必填。"
* #transfer "轉院" "HOSPITALIZED_TRANSFER；轉至院所名稱(TRANSFER_HOSPITAL)及轉院日期(TRANSFER_DAY)必填。"
* #none "無就醫" "HOSPITALIZED_NONE"

ValueSet: CDCPatientMovement
Id: cdc-patient-movement
Title: "CDC-NIDRS-病患動向值集"
Description: "CDC-NIDRS-病患動向值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCPatientMovement

CodeSystem: CDCFileCategory
Id: cdc-file-category
Title: "CDC-NIDRS-病歷檔案類別"
Description: "NIDRS 通報單病歷資料傳送作業(EMRMsg03.FILE_CATEGORY)檔案類別；非下列檔案類型者歸在 0 其他。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "出院病摘"
* #2 "門診病歷"
* #3 "檢驗報告"
* #4 "醫療影像及報告"
* #0 "其他"

ValueSet: CDCFileCategory
Id: cdc-file-category
Title: "CDC-NIDRS-病歷檔案類別值集"
Description: "CDC-NIDRS-病歷檔案類別值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCFileCategory

ValueSet: NIDRSFileMimeType
Id: nidrs-file-mime-type
Title: "NIDRS-病歷檔案類型(MIME)值集"
Description: "EMRMsg03.FILE_TYPE 可接受之檔案類型：1:docx、2:pdf、3:odt。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* urn:ietf:bcp:13#application/vnd.openxmlformats-officedocument.wordprocessingml.document "docx"
* urn:ietf:bcp:13#application/pdf "pdf"
* urn:ietf:bcp:13#application/vnd.oasis.opendocument.text "odt"

CodeSystem: CDCReceivedUnitType
Id: cdc-received-unit-type
Title: "CDC-NIDRS-指定收件單位類型"
Description: "NIDRS 送驗單指定收件單位類型(RECEIVED_UNIT_TYPE)。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "疾管署" "指定收件單位代碼請使用「指定送驗單位_疾管署單位代碼」(CDCLabUnit)。"
* #6 "認可實驗室" "指定收件單位代碼請使用「指定送驗單位_認可實驗室代碼」(CDCApprovedLab)或「指定送驗單位_指定檢驗機構代碼」。"
* #sampling "送驗單位" "本 IG 用以標示送驗單位(SAMPLING_HOSPITAL)之組織類型。"

ValueSet: CDCReceivedUnitType
Id: cdc-received-unit-type
Title: "CDC-NIDRS-指定收件單位類型值集"
Description: "CDC-NIDRS-指定收件單位類型值集(1:疾管署、6:認可實驗室)。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* CDCReceivedUnitType#1
* CDCReceivedUnitType#6

CodeSystem: CDCXpertReason
Id: cdc-xpert-reason
Title: "CDC-NIDRS-疾管署分子快速檢測送驗原因"
Description: "TB 送驗單送驗項目「疾管署分子快速檢測」之送驗原因(SampleReasonXPERT)。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #1 "失落再治"
* #2 "失敗再治"
* #3 "結核病復發"
* #4 "重開非復發曾使用抗結核藥物4週以上"
* #5 "抗藥性結核病個案接觸者"
* #6 "高風險鄉鎮新發生個案"
* #7 "曾長期停留高負擔國家"
* #8 "RMP抗藥"
* #9 "治療２個月之痰培養仍為陽性者"
* #10 "INH抗藥，擬申請二線藥者"
* #11 "因藥物副作用，擬申請二線藥者"
* #12 "通報結核病之畜牧場人員"
* #13 "M. bovis結核個案或動物之接觸者轉為個案者"
* #14 "潛伏結核感染治療 ( LTBI ) 個案結核病發病者"
* #15 "其他"

ValueSet: CDCXpertReason
Id: cdc-xpert-reason
Title: "CDC-NIDRS-疾管署分子快速檢測送驗原因值集"
Description: "CDC-NIDRS-疾管署分子快速檢測送驗原因值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCXpertReason

CodeSystem: CDCTBMedicineUse
Id: cdc-tb-medicine-use
Title: "CDC-NIDRS-抗結核菌藥物使用情形"
Description: "TB 送驗單抗結核菌藥物(TB_MEDICINE_USE_ID)代碼。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #N "未用藥物"
* #1 "服用<2週"
* #2 "服用>2週"

ValueSet: CDCTBMedicineUse
Id: cdc-tb-medicine-use
Title: "CDC-NIDRS-抗結核菌藥物使用情形值集"
Description: "CDC-NIDRS-抗結核菌藥物使用情形值集"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCTBMedicineUse

CodeSystem: CDCIdentifierType
Id: cdc-identifier-type
Title: "CDC-NIDRS-識別碼類型"
Description: "本 IG 使用之識別碼類型(補充 HL7 v2-0203 未涵蓋者)。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #nidrs-report "NIDRS通報單號" "疾管署傳染病通報系統之通報單號(13碼)。"
* #nidrs-temp "NIDRS系統自動編碼證號" "無法取得身分證統一編號、居留證統一證號或護照號碼時，填入 AA(本國新生兒，報告日期-出生日期<6個月)、BB(本國人士)或 CC(外國人士)，由 NIDRS 自動編碼流水證號(例：AA11300001)。"
* #foreign-passport "外國護照號碼" "外國人士之護照號碼(IDNO)；識別碼 system 為 http://hl7.org/fhir/sid/passport-{ISO 3166-1 alpha-3}。"
* #lims-barcode "送驗單編號" "疾管署所發放之送驗單 bar-code(XX-XXX-XXXXXX 共 13 碼)或系統自動編號(15 碼數字)。"

CodeSystem: CDCNIDRSObservation
Id: cdc-nidrs-observation
Title: "CDC-NIDRS-觀察項目"
Description: "本 IG 用以表達通報單流行病學資料、死亡資料及檢驗結果細節之觀察項目代碼(無適當 LOINC 代碼者)。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #HAS_TRAVEL_HISTORY "旅遊史" "有無旅遊史(HAS_TRAVEL_HISTORY)"
* #HAS_ANIMAL_HISTORY "動物接觸史" "有無動物接觸史(HAS_ANIMAL_HISTORY)"
* #EXPLORE_POSITIVE "與確定/極可能/可能病例曾有接觸或暴露共同感染源"
* #EXPLORE_BODY_FLUID "具血體液接觸"
* #EXPLORE_LAB "具實驗室暴露史"
* #EXPLORE_POLLUTED_FOOD "曾食用受汙染的水或食物"
* #EXPLORE_IATROGENIC "醫源型"
* #HAS_ORG "人口密集機構" "是否為人口密集機構(HAS_ORG)及機構類別(ORG_ID)"
* #ANIMAL "接觸動物種類" "接觸動物史(Report_Animal)"
* #TRAVEL "旅遊史明細" "旅遊史(Report_Travel)"
* #TRAVEL_TYPE "旅遊類型" "旅遊類型(TRAVEL_TYPE)"
* #TRAVEL_SUB_AREA "次級行政區" "國外旅遊史/國外居住史之次級行政區(TRAVEL_SUB_AREA)"
* #DEATH_REASON "死亡原因" "死亡原因(DEATH_REASON_A~D、DEATH_REASON_OTHER)"
* #DEATH_REASON_A "死亡原因甲"
* #DEATH_REASON_B "死亡原因乙"
* #DEATH_REASON_C "死亡原因丙"
* #DEATH_REASON_D "死亡原因丁"
* #DEATH_REASON_OTHER "死亡原因其他"
* #ANTIBODY "血清學檢驗" "SampleAntibodyResult"
* #PATHOGEN "病原體檢驗" "SamplePathogenResult"
* #TITER "效價(Titer)"
* #FOUR_FOLD_RISE "是否四倍上升"
* #PATHOGEN_SUBTYPE "病原體次分型"
* #SAMPLE_RESULT "綜合檢驗結果" "送驗單綜合檢驗結果(SampleResult)"

ValueSet: NIDRSEpiFlag
Id: nidrs-epi-flag
Title: "NIDRS-流行病學是非題值集"
Description: "通報單共同欄位中以布林值表示之流行病學資料。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* CDCNIDRSObservation#HAS_TRAVEL_HISTORY
* CDCNIDRSObservation#HAS_ANIMAL_HISTORY
* CDCNIDRSObservation#EXPLORE_POSITIVE
* CDCNIDRSObservation#EXPLORE_BODY_FLUID
* CDCNIDRSObservation#EXPLORE_LAB
* CDCNIDRSObservation#EXPLORE_POLLUTED_FOOD
* CDCNIDRSObservation#EXPLORE_IATROGENIC

ValueSet: NIDRSTravelArea
Id: nidrs-travel-area
Title: "NIDRS-旅遊地區值集"
Description: "旅遊史地區(TRAVEL_AREA)：國內旅遊填縣市代碼；國外旅遊史/國外居住史填國家代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCCounty
* include codes from system CDCCountry

CodeSystem: CDCReportSection
Id: cdc-report-section
Title: "CDC-NIDRS-通報單區段"
Description: "傳染病個案通報單(Composition)之區段代碼(無適當 LOINC 區段代碼者)。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* #supplement "疾病增補欄位" "DISEASE_FIELD(附錄二)"
* #death "死亡資料" "DEATH_REASON_A~D、DEATH_REASON_OTHER"
* #mother "個案生母資料" "BIRTH_MOTHER_NAME、BIRTH_MOTHER_IDNO"

CodeSystem: CDCAntibodyMethod
Id: cdc-antibody-method
Title: "CDC-NIDRS-血清學檢驗方法代碼"
Description: "疾管署主動回饋檢驗結果(SampleAntibodyResult.AntibodyId)之血清學檢驗方法代碼。工作說明書附錄四未提供代碼清單，故本代碼系統內容為 not-present，實際代碼以疾管署回傳為準(並以 AntibodyName 填入 display/text)。"
* ^caseSensitive = true
* ^content = #not-present
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
