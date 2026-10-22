CodeSystem: CDCDisease
Id: cdc-disease
Title: "CDC-NIDRS-疾病代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「疾病代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
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
* ^property[2].code = #category
* ^property[2].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#category"
* ^property[2].description = "疾病分類(法定傳染病類別或重點監視項目)"
* ^property[2].type = #string
* ^property[3].code = #route
* ^property[3].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-disease#route"
* ^property[3].description = "傳染途徑"
* ^property[3].type = #string
* #020 "鼠疫"
  * ^property[0].code = #category
  * ^property[0].valueString = "第一類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #050 "天花"
  * ^property[0].code = #category
  * ^property[0].valueString = "第一類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #071 "狂犬病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第一類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #SARS "嚴重急性呼吸道症候群"
  * ^property[0].code = #category
  * ^property[0].valueString = "第一類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #001 "霍亂"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #002 "傷寒"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #002a "副傷寒"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #004 "桿菌性痢疾"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #006 "阿米巴性痢疾"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #0080 "腸道出血性大腸桿菌感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #022 "炭疽病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #032 "白喉"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #0360 "流行性腦脊髓膜炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #045a "急性無力肢體麻痺(小兒麻痺症監視指標)"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #055 "麻疹"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #056 "德國麻疹"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #061 "登革熱"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #0663b "西尼羅熱"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #0701 "急性病毒性Ａ型肝炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #0786 "漢他病毒出血熱"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "第二類法定傳染病"
  * ^property[3].code = #route
  * ^property[3].valueString = "空氣或飛沫傳染"
* #080 "流行性斑疹傷寒"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #084 "瘧疾"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #4808 "漢他病毒肺症候群"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "第二類法定傳染病"
  * ^property[3].code = #route
  * ^property[3].valueString = "空氣或飛沫傳染"
* #A920 "屈公病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #ZIKAV "茲卡病毒感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #030 "漢生病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #033 "百日咳"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #037 "破傷風"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #042 "後天免疫缺乏症候群"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #044 "人類免疫缺乏病毒感染(含母子垂直感染及孕產婦疑似個案)"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #010 "結核病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #0620 "日本腦炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #0703 "急性病毒性Ｂ型肝炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #0705 "急性病毒性Ｃ型肝炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #070d "急性病毒性Ｄ型肝炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #070e "急性病毒性Ｅ型肝炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #070x "急性病毒性肝炎未定型"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #072 "流行性腮腺炎"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #0749 "腸病毒感染併發重症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #090 "梅毒"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #091 "先天性梅毒"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #098 "淋病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "性接觸或血液傳染"
* #3200 "侵襲性ｂ型嗜血桿菌感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #4828 "退伍軍人病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #7710 "先天性德國麻疹症候群"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #7713 "新生兒破傷風"
  * ^property[0].code = #category
  * ^property[0].valueString = "第三類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #0051 "肉毒桿菌中毒"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #021 "兔熱病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #023 "布氏桿菌病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #025 "類鼻疽"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #027 "李斯特菌症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #0412 "侵襲性肺炎鏈球菌感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #0461 "庫賈氏病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #052VC "水痘併發症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #0543 "疱疹B病毒感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #0812 "恙蟲病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #0820 "地方性斑疹傷寒"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #0830 "Ｑ熱"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #100 "鉤端螺旋體病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #1048 "萊姆病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #130 "弓形蟲感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "食物或飲水傳染"
* #487a "流感併發重症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #SFTS "發熱伴血小板減少綜合症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #060 "黃熱病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #0663a "裂谷熱"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "蟲媒傳染"
* #0788 "伊波拉病毒感染"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #0788a "馬堡病毒出血熱"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #0788b "拉薩熱"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #NFluA "新型A型流感"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #NoCoV "中東呼吸症候群冠狀病毒感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #19CoV "嚴重特殊傳染性肺炎(112/3/19以前病例定義版本)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "第五類法定傳染病"
  * ^property[3].code = #route
  * ^property[3].valueString = "空氣或飛沫傳染"
* #19CVS "嚴重特殊傳染性肺炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "第四類法定傳染病"
  * ^property[3].code = #route
  * ^property[3].valueString = "空氣或飛沫傳染"
* #19SC "新冠併發重症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第四類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #0000 "其他"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #CRE "CRE抗藥性檢測"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #H1N1a "流感病毒抗藥性檢測"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #VISA "VISA/VRSA抗藥性檢測"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #SICoV "居家檢疫有症狀者送驗入口"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
* #SICV2 "疑似新冠病毒感染送驗入口"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "重點監視項目"
  * ^property[3].code = #route
  * ^property[3].valueString = "其他"
* #045 "小兒麻痺症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "不開放EMR通報，僅可增修"
  * ^property[1].code = #category
  * ^property[1].valueString = "第二類法定傳染病"
  * ^property[2].code = #route
  * ^property[2].valueString = "食物或飲水傳染"
* #010m "多重抗藥性結核病"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #PoUR "不明原因肺炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "重點監視項目"
  * ^property[3].code = #route
  * ^property[3].valueString = "其他"
* #EoUR "不明原因腦炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "重點監視項目"
  * ^property[3].code = #route
  * ^property[3].valueString = "其他"
* #ZIKAT "茲卡病毒篩檢"
  * ^property[0].code = #category
  * ^property[0].valueString = "重點監視項目"
  * ^property[1].code = #route
  * ^property[1].valueString = "其他"
* #071T "狂犬病毒檢驗"
  * ^property[0].code = #category
  * ^property[0].valueString = "重點監視項目"
  * ^property[1].code = #route
  * ^property[1].valueString = "其他"
* #SST2 "第二型豬鏈球菌感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "重點監視項目"
  * ^property[1].code = #route
  * ^property[1].valueString = "其他"
* #HANTA "漢他病毒症候群"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "空氣或飛沫傳染"
* #NIPAH "立百病毒感染症"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "重點監視項目"
  * ^property[3].code = #route
  * ^property[3].valueString = "其他"
* #NiV "立百病毒感染症"
  * ^property[0].code = #category
  * ^property[0].valueString = "第五類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "接觸傳染"
* #MPXV "猴痘M痘"
  * ^property[0].code = #category
  * ^property[0].valueString = "第二類法定傳染病"
  * ^property[1].code = #route
  * ^property[1].valueString = "其他"
* #NFACH "彰化縣新A加強監測方案"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "重點監視項目"
  * ^property[3].code = #route
  * ^property[3].valueString = "其他"
* #"MIS-C" "孩童多系統炎症徵候群"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用"
  * ^property[2].code = #category
  * ^property[2].valueString = "重點監視項目"
  * ^property[3].code = #route
  * ^property[3].valueString = "其他"
* #070xc "兒童急性嚴重不明原因肝炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "停用；僅限醫學中心及準醫學中心通報"
  * ^property[2].code = #category
  * ^property[2].valueString = "重點監視項目"
  * ^property[3].code = #route
  * ^property[3].valueString = "其他"

ValueSet: CDCDisease
Id: cdc-disease
Title: "CDC-NIDRS-疾病代碼值集"
Description: "CDC-NIDRS-疾病代碼值集，包含代碼系統 CDCDisease 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCDisease
