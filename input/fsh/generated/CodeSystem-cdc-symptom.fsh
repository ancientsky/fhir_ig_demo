CodeSystem: CDCSymptom
Id: cdc-symptom
Title: "CDC-NIDRS-症狀代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「症狀代碼」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
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
* #1 "肌抽躍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：myoclonic jerks"
* #2 "下痢"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #3 "口咽部潰瘍"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #4 "口乾"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #5 "口腔出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #6 "大便變成白色或比平常顏色淡許多"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #7 "子宮出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #8 "子宮頸炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #9 "小腦症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #10 "分泌障礙"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #11 "反射異常"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #12 "心臟血管性梅毒"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #13 "心智發育遲緩"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #14 "手足口症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #15 "手足麻痺"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #16 "水泡"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #17 "水腫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #18 "水樣便"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #19 "牙關緊閉"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #20 "牙齦出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #21 "丘疹及淋巴腺腫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #22 "出血性皮疹"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #23 "出血症狀"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #24 "皮疹/紅疹/出疹"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：出疹"
* #25 "出疹子"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #26 "先天性感染"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #27 "四肢僵硬"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #28 "皮下出血"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #29 "皮膚出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #31 "皮膚焦痂"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #32 "皮膚癢"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #33 "休克"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #34 "先天性心臟病"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #35 "先天性白內障"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #36 "先天性青光眼"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #37 "斑丘疹"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：全出現斑狀丘疹"
* #38 "全身肌肉僵直"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #39 "全身疼痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #40 "吐血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #41 "弛緩性輕癱或麻痺"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #42 "有非特異性症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #43 "有時嘔吐"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #44 "肌肉或關節酸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #45 "肌肉痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #46 "肌肉酸痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #47 "舌燥"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #48 "色素性視網膜病"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #49 "血小板數量過低"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #50 "血便"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #51 "吞嚥困難"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #52 "吸奶困難"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #53 "尿道有膿性分泌物流出"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #54 "尿道炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #55 "肝臟腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：肝腫大"
* #56 "腹部不舒服、腹痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #57 "角弓反張"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #58 "言語障礙"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #59 "身軀出現疹子"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #60 "併發腦膜炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #61 "兩眼黏膜充血或發紅"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #62 "其他seizure"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #63 "其他異常"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #64 "其他過敏症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #65 "呼吸困難"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #66 "呼吸過速"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #67 "怕光"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #68 "昏迷"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #69 "肺炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "更名 原:肺炎(Pneumonia)"
* #70 "肺動脈瓣狹窄"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #71 "長骨放射線透度異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #72 "長期咳嗽"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #73 "非特異性皮疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #74 "便秘"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #75 "咳嗽"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #76 "咽喉痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #77 "後眼窩痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #78 "急性無力肢體麻痺"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #79 "流口水"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #80 "流鼻水"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #81 "洗腎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #82 "活動力差"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #83 "疱疹性咽峽炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：泡疹性咽峽炎"
* #84 "畏寒/寒顫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：畏寒"
* #85 "科氏斑"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #86 "突發性高燒"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #87 "紅疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #88 "背痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #89 "食慾不振"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #90 "食慾減少"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #91 "倦怠"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #92 "倦怠感"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #93 "哭泣微弱"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #94 "哮聲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #95 "栓塞性血小板缺乏性紫斑症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #96 "氣管炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #97 "消化道出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #98 "疲累"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #99 "神智不清"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #100 "神經性梅毒"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #101 "神經腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #103 "胸頸部會有水腫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #104 "草莓舌"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #105 "茶色小便"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #106 "陣發性咳嗽"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #107 "高燒"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #108 "患部腫痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #109 "排尿有灼熱感"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #110 "排尿有刺痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #111 "敗血症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：敗血症(Sepsis)"
* #112 "皮膚梅毒腫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #113 "淋巴腺病變"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #114 "淋巴腺腫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #115 "淋巴腺腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #116 "眼白發黃或皮膚發黃"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #117 "眼肌麻痺"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #118 "眼球麻痺"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #119 "眼瞼下垂"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #120 "窒息"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #121 "脫皮現象"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #122 "閉塞性黃疸"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：閉塞性黃疸(24小時內發生)"
* #123 "唾液腺腫大且壓痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #124 "喉嚨痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #125 "喉嚨痛或扁桃腺發炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #126 "惡寒"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #127 "斑疹"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #128 "無故驚嚇"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #129 "無痛性潰瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #130 "無意識障礙"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #131 "痙攣"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #132 "發疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #133 "發燒"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #134 "發燒(38℃以上)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #135 "發癢"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #136 "發紺"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #137 "硬性下疳"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #138 "結膜出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #139 "結膜炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #140 "紫斑"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #141 "腎功能障礙"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #142 "腎衰竭"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #143 "脾腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #144 "虛脫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #145 "視力下降"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #146 "開放性動脈導管"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：開放性心臟導管"
* #147 "黃疸"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #148 "嗜睡"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #149 "微燒"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #151 "溶血性尿毒症候群"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：溶血性尿毒症候群(Hemolytic uremic syndrome)"
* #152 "腰痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #153 "腮腺疼痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #154 "腮腺腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #155 "腹痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #156 "腹絞痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #157 "腹膜透析"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #158 "腹瀉"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #159 "腹觸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #160 "腦病症"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #161 "腦膜腦炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #162 "嘔吐"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #163 "對水有恐懼感"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #164 "對光反應遲鈍"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #165 "精神錯亂"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #166 "語言困難"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #167 "鼻出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #168 "鼻炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #169 "鼻腔出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #170 "僵硬"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #171 "潰瘍"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #172 "複視"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #173 "調節障礙"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #174 "震顫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #175 "齒齦出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #176 "頸部淋巴腺腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #177 "頸部僵硬"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #178 "頸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #179 "頸僵直"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #180 "頸僵硬"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #181 "頭痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #182 "頭痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #183 "應激性"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #184 "瞳孔散大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #185 "黏液便"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #186 "顎下腺症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #187 "嚥下障礙"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #188 "關節炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：關節炎(Septic arthritis)"
* #189 "關節痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #190 "關節痛或頭痛等感冒樣症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #191 "類似感冒症狀（鼻炎/或結膜炎）"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #192 "聽力障礙"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #193 "顫抖"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #194 "體重減輕"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #195 "噁心"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #196 "噁心嘔吐"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #197 "支氣管炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #198 "有痰"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #199 "骨骼酸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #200 "全身酸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #201 "呼吸急促"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #202 "氣喘"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #203 "胸悶/痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #204 "頭暈"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #205 "其他腸胃道症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #206 "皮膚紅色斑疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #207 "皮膚丘疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #208 "皮膚斑塊"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #209 "皮膚結節"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #210 "皮膚瀰漫性浸潤"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #211 "皮膚病灶出現感覺喪失"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #212 "某神經支配皮膚區出現感覺喪失"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #213 "皮膚抹片發現癩桿菌"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #214 "組織抹片出現癩桿菌"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #215 "上腹痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #216 "極度倦怠感"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #217 "結膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #218 "X光片顯示肺炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #219 "腦炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #220 "腦病變"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #221 "咳嗽/痰"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #222 "鼻塞"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #223 "全身無力"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #224 "呼吸喘"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #225 "皮膚水泡"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #226 "骨頭肌肉酸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #227 "皮/紅疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #228 "活力不佳"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #229 "咽喉炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #230 "肝炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #231 "心肌炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #232 "肌抽躍"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #233 "肌肉痛(尤其常見小腿肚痛)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #234 "結膜充血"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #235 "腦膜炎症狀及無菌性腦膜炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #236 "無尿、少尿或蛋白尿"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #237 "急性腎功能不全"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #238 "出血傾向(腸道或肺部)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #239 "X光片顯示肺炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #240 "血絲便"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：血液(絲)便"
* #241 "黑便"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #242 "右上腹疼痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #243 "未明原因急性下呼吸道疾病"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #244 "眼睛刺痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #245 "灼熱"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #246 "結膜下出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #247 "眼睛產生大量黏性分泌物"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #248 "抽搐"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #249 "全身淋巴結腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #250 "皮疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #251 "視網膜脈絡膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #252 "視力不良"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #253 "夜間盜汗"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #254 "意識障礙"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #255 "局部神經學障礙"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #256 "淋巴結腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #257 "外傷部位周邊出現水泡或潰瘍"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #258 "接觸部位有刺激痛或搔癢感"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #259 "構音困難"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #260 "四肢麻痺"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #261 "四肢感覺異常"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #262 "急性發燒"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #263 "叮咬處會出現潰瘍"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #264 "化膿性結膜炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #265 "乾咳"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #266 "局部淋巴結疼痛腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #267 "心智遲緩"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #270 "結膜炎(畏光、流淚水或眼睛發紅)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #271 "ALT上升"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #272 "全身倦怠"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #273 "腹部不舒服"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #274 "泌尿道感染(UTI)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #275 "血流感染(BSI)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #276 "肺炎(PNU)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #277 "肺炎以外之下呼吸道感染(LRI)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #278 "外科部位感染(SSI)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #279 "皮膚及軟組織感染(SST)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #280 "心臟血管系統感染(CVS)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #281 "骨和關節之感染(BJ)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #282 "中樞神經系統感染(CNS)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #283 "眼耳鼻喉或嘴部之感染(EENT)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #284 "腸胃系統感染(GI)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #285 "生殖系統感染(REPR)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #286 "全身性感染(Systemic Infection)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #287 "ALT>=100"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #288 "肌痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #289 "疲勞"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #290 "結膜炎或畏光"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #291 "出現可能導致多重器官衰竭之各種不同型式的出血症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #292 "焦慮"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #293 "動物咬傷部位異樣感"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #294 "焦燥"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #295 "恐懼氣流"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #296 "麻痺"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #297 "咽喉部肌肉痙攣"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #298 "抽筋"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #299 "盜汗"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #300 "身體不適"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #301 "急性肝炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #302 "急性黃疸"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #303 "心內膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #304 "急性發作，全身出現瀰漫性的丘疹與水庖"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #305 "併發肺炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #306 "肝功能異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #307 "敗血症(septicemia)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #308 "肺炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #309 "腦膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：腦膜炎(Meningitis)"
* #310 "關節炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #311 "骨髓炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：骨髓炎(Osteomyelitis)"
* #312 "心包膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：心包膜炎(Pericarditis)"
* #313 "腹膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：腹膜炎(Peritonitis)"
* #314 "接觸部位有刺激痛或搔癢感"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #315 "淋巴結腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #316 "接觸部位肌肉無力或麻痺"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #317 "鼻竇炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #318 "頸部僵直、頭痛超過24小時"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #319 "寒顫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #320 "腦幹症狀(複視、語言障礙、暈眩、交叉性麻痺、知覺異常、腦神經麻痺)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #321 "意識不清"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #322 "有腦炎及中樞神經症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #323 "腦鈣化"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #324 "水腦"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #325 "小腦"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #326 "青光眼"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #327 "肝脾腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #328 "新生兒黃疸"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #329 "後天性感染者"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #330 "類似感冒症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #331 "猝發性冷顫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #332 "全身肌肉酸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #333 "腹瀉（可能帶血）"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #334 "流鼻血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #335 "發燒高於38.3℃"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #336 "紫斑等症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #337 "在軀幹出現斑點狀丘疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #338 "脫水和虛脫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #339 "明顯的嗜睡"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #340 "精神錯亂"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #341 "胸痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #342 "聽力喪失"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #343 "接觸部位感覺異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #344 "弛緩性麻痺"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #345 "昏睡"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #346 "失去頭部控制"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #347 "肌肉無力"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #348 "遊走性紅斑"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #349 "神經根發炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #350 "突然出現高燒、寒顫、頭痛、疲倦、肌肉痛、感染部位疼痛，並伴有盜汗，病程期間常伴有淋巴結和肝脾腫大、食慾減退現象。且伴隨下列一（含）種以上之主要臨床型態："
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #351 "潰瘍腺體型(ulceroglandular type)：伴隨局部性淋巴腺結節腫大的皮膚潰瘍。在病原入侵處會產生一小潰瘍，輕度疼痛，皮膚可見發炎、膿瘍性丘疹，之後潰瘍附近的腋下或腹股溝淋巴結腫大或壞死"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：潰瘍腺體型(ulceroglandular type)：伴隨局部性淋巴腺結節腫大的皮膚潰瘍。在病原入侵處會產生一小潰瘍，輕度疼痛，皮膚可見發炎、膿瘍性丘疹，之後潰瘍附近的腋下或腹股溝淋巴結腫大或壞死。"
* #352 "腺體型(glandular type)：有一個或以上腫大疼痛的淋巴結，但無原發性皮膚潰瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：腺體型(glandular type)：有一個或以上腫大疼痛的淋巴結，但無原發性皮膚潰瘍。"
* #353 "眼部及口咽型(oculoglandular type and oropharyngeal type)：發膿結膜炎，眼瞼有黃色的肉芽腫，並伴隨耳前淋巴腺炎；咽頭炎或扁桃腺炎並伴隨頸部淋巴腺炎；眼結膜及咽部潰瘍，頸或頜下淋巴結腫大或化膿，形成潰瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：眼部及口咽型(oculoglandular type and oropharyngeal type)：發膿結膜炎，眼瞼有黃色的肉芽腫，並伴隨耳前淋巴腺炎；咽頭炎或扁桃腺炎並伴隨頸部淋巴腺炎；眼結膜及咽部潰瘍，頸或頜下淋巴結腫大或化膿，形成潰瘍。"
* #354 "胃腸型(intestinal type)：除會發冷、發熱外，還會有腹痛、噁心、嘔吐、腹瀉、腸道膜淋巴結腫大等現象，偶有腹膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：胃腸型(intestinal type)：除會發冷、發熱外，還會有腹痛、噁心、嘔吐、腹瀉、腸道膜淋巴結腫大等現象，偶有腹膜炎。"
* #355 "肋膜肺部型(pleuropulmonary type)：病徵為咳嗽、少痰、胸骨壓痛。可能併發支氣管發炎、肺炎、肺囊腫、初級肺肋膜病變或胸膜炎等，肺門淋巴結異常腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：肋膜肺部型(pleuropulmonary type)：病徵為咳嗽、少痰、胸骨壓痛。可能併發支氣管發炎、肺炎、肺囊腫、初級肺肋膜病變或胸膜炎等，肺門淋巴結異常腫大。"
* #356 "類傷寒型(typhoidal type)：出現類似傷寒之肝脾腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：類傷寒型(typhoidal type)：出現類似傷寒之肝脾腫大。"
* #357 "淋巴結腫脹(特別是在頭、頸、上肢的淋巴結)、發燒、頭痛、疲勞、沒有食慾等"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #358 "抓傷部位出現丘疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #359 "有神經併發症及巴里諾氏眼淋巴結症候群(Parinaud’s oculoglandular syndrome)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #360 "免疫系統較差的病人(特別是HIV 感染者)發生菌血症、紫斑狀肝及血管瘤症等症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #361 "出現感染症狀，特別是曾接受侵入性或外科手術等相關醫療措施者"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #362 "醫師懷疑為「NDM-1腸道菌感染症」感染之病患"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #363 "肌肉痙攣"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #364 "肌張力異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #365 "腦膜刺激症狀"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #366 "精神症狀(譫妄、意識不清等)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #367 "胃口差"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #368 "單或雙側腮腺(或其他唾液腺)疼痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #369 "臉頰腫脹"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：自限性腫脹持續達2天以上"
* #370 "腮腺疼痛腫脹急性發作，且無其他明顯原因"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：急性發作，且無其他明顯原因"
* #371 "直腸感染"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：男同性戀者直腸感染"
* #372 "子宮內膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #373 "輸卵管炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #374 "骨盤腔腹膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #375 "外陰陰道炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #376 "新生兒淋菌性結膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #377 "淋病性關節炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #378 "呼吸道白喉：扁桃腺、咽喉、鼻、急性感染，因外毒素致組織壞死形成灰白色膜(偽膜)，並伴有喉嚨發炎、喉嚨痛、輕微發熱"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #379 "皮膚白喉：持久不癒的皮膚感染及潰瘍，可能形成膿疱並被偽膜覆蓋"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：皮膚白喉：持久不癒的皮膚感染及潰瘍，可能形成膿?並被偽膜覆蓋"
* #380 "其他或臨床症狀不典型，但診斷醫師高度懷疑者"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #381 "持續性發燒"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #382 "頭痛、不適、厭食"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #383 "相對性心跳過慢"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #384 "脾臟腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #385 "身軀出現紅疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #386 "成年人較常出現便秘或腹瀉、淋巴組織病變"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #387 "白血球減少"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #388 "發燒、劇烈頭痛、意識模糊、頸部僵直、出血性皮疹、瘀斑(purpura)、譫妄、抽蓄、昏迷及休克"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #389 "裏急後重"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #390 "出汗"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #391 "肝腎衰竭"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #392 "急性腦病變"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #393 "急性呼吸窘迫症候群"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：臨床診斷為急性呼吸窘迫症候群"
* #394 "兩側肺部呈現瀰漫間質性水腫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #395 "不明原因呼吸性疾病致死"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #396 "非心因性肺水腫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：經屍體解剖發現非心源性肺水腫，且原因仍不明"
* #397 "自行檢驗陽性"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #398 "腎臟功能異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #399 "視力模糊"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #400 "丘疹般塊狀紅疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #401 "腸胃道症狀"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：腸胃道症狀(如嘔吐或腹瀉)"
* #402 "急性無力性麻痺症候群"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #403 "噁吐"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #404 "第5至6天軀幹出現斑點"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #405 "恐水現象"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #406 "皮膚型：皮膚潰瘍從丘疹進展到水泡、黑色焦痂，伴隨輕微到嚴重的水腫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #407 "腸胃型：腹部不適，如：噁心、嘔吐、食慾缺乏，接著出現發燒"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #408 "吸入型：短暫的前驅症狀類似急性病毒性呼吸疾病，接著出現急遽發生的缺氧、呼吸困難及高燒，伴隨X光有縱隔腔變寬情形"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #409 "腦膜/腦炎型：發燒合併以下任一症狀意識喪失、抽搐、或腦膜炎症狀"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：腦膜/腦炎型：發燒合併以下任一症狀意識喪失、抽蓄、或腦膜炎症狀"
* #410 "輕微腹瀉"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #411 "慢性腹瀉"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #412 "嚴重腹瀉"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #413 "糞便中帶粘液"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #414 "糞便中帶血絲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #415 "間歇性下痢"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #416 "腹部僵硬"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #417 "倦怠無力"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #418 "憂鬱"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #419 "腦膜炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #420 "肝臟或脾臟腫大"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #421 "睪丸炎或卵巢炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #422 "盜汗"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #423 "關節酸痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #424 "尿量減少"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #425 "下肢水腫"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #426 "血尿"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #427 "骨或關節之感染(osteomyelitis or septic arthritis)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #428 "中毒休克症候群(toxic shock syndrome)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #429 "皮膚或軟組織之繼發性細菌感染(Cellulitis or necrotizing fasciitis)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #430 "胎兒異常(birth defects/congenital abnormalities)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #431 "出生低體重(small for gestational age)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #432 "依皮節分布瘢痕性的皮膚病變及色素沉澱(cicatricial skin lesions in a dermatomal distribution)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #433 "先天性眼睛異常或缺陷(ocular abnormalities/defects)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #434 "先天性腦部及中樞神經異常或缺陷(CNS abnormalities)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #435 "先天性四肢骨骼或肌肉異常或缺陷(limb hypoplasia)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #436 "急性發作，出現符合水痘表現之皮疹"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #438 "急性發燒(>=38℃)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #439 "不明原因出血"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #440 "突發性不明原因死亡"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #441 "關節痛/骨頭痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #442 "噁心/嘔吐"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #443 "血壓帶試驗陽性"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #444 "全身性梅毒紅疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #445 "全身性淋巴腺腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "修正名稱 原名稱：全身性淋巴腺腫"
* #446 "肌肉關節痛"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #447 "禿髮"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #448 "扁平濕疣"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #449 "鼻塞伴黏性或血性分泌物"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #450 "皮膚黏膜病變"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #451 "非病毒性肝炎引起之黃疸"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #452 "腎病症候群或營養不良引起之水腫"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #453 "假性麻痺"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #454 "影像學上可見長骨異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #455 "不適"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #456 "厭食"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #457 "腸道淋巴組織病變"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #458 "中樞神經系統症狀"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #459 "丘疹"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #460 "急性發燒(稍燒)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #461 "斑丘疹"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "註記停用"
* #462 "非化膿性結膜炎"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "刪除"
* #463 "非化膿性或充血性結膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #465 "小腦性共濟失調"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #466 "雷氏綜合症候群"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #467 "其他併發症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #468 "視網膜病變"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #469 "畏光"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #470 "菌血症(Bacteremia)"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #471 "流產"
  * ^property[0].code = #comment
  * ^property[0].valueString = "保留"
* #472 "死產"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #473 "早產"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #999 "其他"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #474 "CT顯示肺炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #475 "嗅覺異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #476 "味覺異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #501 "肺部出血"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #502 "肚子不舒服"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #503 "腸道出血"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #504 "肝衰竭"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #505 "蛋白尿"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #506 "無尿"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #507 "外傷周邊出現水泡"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #508 "外傷周邊出現潰瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #509 "接觸部位有刺激痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #510 "接觸部位有搔癢感"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #511 "感染部位疼痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #512 "蜂窩性組織炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #513 "膿疱"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #514 "無菌性腦膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #515 "舞蹈症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #516 "小腦功能失調"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #517 "錐體路功能異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #518 "錐體外路功能異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #519 "不動不語症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #520 "感覺異樣"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #521 "明顯疼痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #522 "視覺異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #523 "骨頭痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #524 "壞死性筋膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #525 "睪丸炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #526 "卵巢炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #527 "進展快速之失智症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #528 "進展快速之智能衰退"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #529 "進行性神經精神異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #530 "其他新冠感染相關併發症"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #531 "黏膜發炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #532 "低血壓"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #533 "心瓣膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #534 "冠狀動脈異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #535 "凝血功能異常"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #536 "扁桃腺炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #537 "鼻咽炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #538 "偽膜"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #539 "潰瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #540 "上腹疼痛"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #541 "膿瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #542 "脊椎炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #543 "椎間盤炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #544 "附睪炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #545 "疲倦"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #546 "口咽型(Oropharyngeal)：口腔炎、咽炎或扁桃腺炎，伴隨頸部淋巴結腫大"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #547 "肺炎型(Pneumonic)：原發性肺部疾病。"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #548 "潰瘍腺體型(Ulceroglandular)：伴隨局部淋巴結腫大的皮膚潰瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #549 "腺體型(Glandular)：局部淋巴結腫大，無潰瘍"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #550 "類傷寒型(Typhoidal)：無局部症狀，以發燒為主要表現。"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"
* #551 "眼腺體型(Oculoglandular)：伴隨耳前淋巴結腫大的結膜炎"
  * ^property[0].code = #comment
  * ^property[0].valueString = "新增代碼"

ValueSet: CDCSymptom
Id: cdc-symptom
Title: "CDC-NIDRS-症狀代碼值集"
Description: "CDC-NIDRS-症狀代碼值集，包含代碼系統 CDCSymptom 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCSymptom
