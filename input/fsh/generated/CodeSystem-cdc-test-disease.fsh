CodeSystem: CDCTestDisease
Id: cdc-test-disease
Title: "CDC-NIDRS-疾管署之可送驗疾病代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「疾管署之可送驗疾病代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* ^property[0].code = #inactive
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#inactive"
* ^property[0].description = "停用、刪除或移除之代碼"
* ^property[0].type = #boolean
* ^property[1].code = #comment
* ^property[1].uri = "http://hl7.org/fhir/concept-properties#comment"
* ^property[1].description = "代碼表備註(代碼處理方式)"
* ^property[1].type = #string
* #0000 "其他"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.37 刪除"
* #001 "霍亂"
* #002 "傷寒"
* #002a "副傷寒"
* #004 "桿菌性痢疾"
* #0051 "肉毒桿菌中毒"
* #006 "阿米巴性痢疾"
* #0080 "腸道出血性大腸桿菌感染症"
* #010 "結核病(除多重抗藥性結核病外)"
* #020 "鼠疫"
* #021 "兔熱病"
* #022 "炭疽病"
* #023 "布氏桿菌病"
* #025 "類鼻疽"
* #030 "漢生病"
* #032 "白喉"
* #033 "百日咳"
* #0360 "流行性腦脊髓膜炎"
* #037 "破傷風"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.37 刪除"
* #0412 "侵襲性肺炎鏈球菌感染症"
* #042 "後天免疫缺乏症候群"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.37 刪除"
* #045a "急性無力肢體麻痺"
* #0461 "庫賈氏病"
* #050 "天花"
* #052VC "水痘併發症"
* #0543 "疱疹B病毒感染症"
* #055 "麻疹"
* #056 "德國麻疹"
* #060 "黃熱病"
* #061 "登革熱"
* #0620 "日本腦炎"
* #0663a "裂谷熱"
* #0663b "西尼羅熱"
* #0701 "急性病毒性Ａ型肝炎"
* #070d "急性病毒性Ｄ型肝炎"
* #070e "急性病毒性Ｅ型肝炎"
* #070x "急性病毒性肝炎未定型"
* #071 "狂犬病"
* #072 "流行性腮腺炎"
* #0749 "腸病毒感染併發重症"
* #0786 "漢他病毒出血熱"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.37 刪除"
* #0788 "伊波拉病毒感染"
* #0788a "馬堡病毒出血熱"
* #0788b "拉薩熱"
* #080 "流行性斑疹傷寒"
* #0812 "恙蟲病"
* #0820 "地方性斑疹傷寒"
* #0830 "Ｑ熱"
* #084 "瘧疾"
* #090 "梅毒"
* #098 "淋病"
* #100 "鉤端螺旋體病"
* #1048 "萊姆病"
* #130 "弓形蟲感染症"
* #3200 "侵襲性ｂ型嗜血桿菌感染症"
* #4808 "漢他病毒肺症候群"
* #4828 "退伍軍人病"
* #487a "流感併發重症"
* #7710 "先天性德國麻疹症候群"
* #7713 "新生兒破傷風"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.37 刪除"
* #A920 "屈公病"
* #CRE "CRE抗藥性檢測"
* #H1N1a "流感病毒抗藥性檢測"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.37 刪除"
* #NoCoV "中東呼吸症候群冠狀病毒感染症"
* #SARS "嚴重急性呼吸道症候群"
* #VISA "VISA/VRSA抗藥性檢測"
* #NFluA "新型A型流感"
* #ZIKAV "玆卡病毒感染症"
* #19CoV "嚴重特殊傳染性肺炎(112/3/19以前病例定義版本)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.0.25調整名稱"
* #19CVS "嚴重特殊傳染性肺炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.0.25調整名稱"
* #19SC "新冠併發重症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.30新增"
* #SICoV "居家檢疫有症狀者送驗入口"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "自3/4起停用"
* #SICV2 "疑似新冠病毒感染送驗入口"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "自5/28起停用"
* #SFTS "發熱伴血小板減少綜合症"
* #027 "李斯特菌症"
* #ZIKAT "茲卡病毒篩檢"
* #071T "狂犬病毒檢驗"
* #SST2 "第二型豬鏈球菌感染症"
* #HANTA "漢他病毒症候群"
* #NIPAH "立百病毒感染症"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.37 刪除"
* #NiV "立百病毒感染症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.37 新增"
* #MPXV "M痘"
* #070xc "兒童急性嚴重不明原因肝炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.0.22 刪除"

ValueSet: CDCTestDisease
Id: cdc-test-disease
Title: "CDC-NIDRS-疾管署之可送驗疾病代碼值集"
Description: "CDC-NIDRS-疾管署之可送驗疾病代碼值集，包含代碼系統 CDCTestDisease 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCTestDisease
