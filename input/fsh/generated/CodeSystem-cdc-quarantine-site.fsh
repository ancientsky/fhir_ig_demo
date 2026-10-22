CodeSystem: CDCQuarantineSite
Id: cdc-quarantine-site
Title: "CDC-NIDRS-隔離處所代碼"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「隔離處所」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。"
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
* ^property[2].code = #county
* ^property[2].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-quarantine-site#county"
* ^property[2].description = "處所所在縣市代碼"
* ^property[2].type = #string
* ^property[3].code = #siteType
* ^property[3].uri = "https://ancientsky.github.io/fhir_ig_demo/CodeSystem/cdc-quarantine-site#siteType"
* ^property[3].description = "處所類型(隔離處所類型代碼)"
* ^property[3].type = #string
* #A001 "衛生福利部基隆醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10017"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A002 "長庚醫療財團法人基隆長庚紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10017"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A003 "醫療財團法人臺灣區煤礦業基金會臺灣礦工醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10017"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A004 "三軍總醫院基隆分院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "10017"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A005 "國立陽明交通大學附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A006 "醫療財團法人羅許基金會羅東博愛醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A007 "天主教靈醫會醫療財團法人羅東聖母醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A008 "宜蘭仁愛醫療財團法人宜蘭仁愛醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A009 "天主教靈醫會醫療財團法人礁溪杏和醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A010 "臺北榮民總醫院蘇澳分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A011 "臺北榮民總醫院員山分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A012 "臺北市立聯合醫院和平婦幼院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A013 "臺北醫學大學附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A014 "國泰醫療財團法人國泰綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A015 "台灣基督長老教會馬偕醫療財團法人馬偕紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A016 "臺北市立萬芳醫院－委託財團法人臺北醫學大學辦理"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A017 "國立台灣大學醫學院附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A018 "臺北榮民總醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A019 "三軍總醫院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A020 "新光醫療財團法人新光吳火獅紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A021 "振興醫療財團法人振興醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A022 "長庚醫療財團法人台北長庚紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A023 "基督復臨安息日會醫療財團法人臺安醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A024 "臺北市立聯合醫院仁愛院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A025 "臺北市立聯合醫院中興院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A026 "三軍總醫院松山分院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A027 "臺北市立聯合醫院忠孝院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A028 "臺北市立聯合醫院陽明院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A029 "博仁綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A030 "西園醫療社團法人西園醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A031 "新北市立聯合醫院（三重院區）"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A032 "台灣基督長老教會馬偕醫療財團法人淡水馬偕紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A033 "衛生福利部雙和醫院（委託臺北醫學大學興建經營）"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A034 "醫療財團法人徐元智先生醫藥基金會亞東紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A035 "佛教慈濟醫療財團法人台北慈濟醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A036 "天主教耕莘醫療財團法人耕莘醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A037 "國泰醫療財團法人汐止國泰綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A038 "衛生福利部臺北醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A039 "行天宮醫療志業醫療財團法人恩主公醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A040 "國立臺灣大學醫學院附設醫院金山分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A041 "輔仁大學學校財團法人輔仁大學附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A042 "天主教耕莘醫療財團法人永和耕莘醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A043 "新北市立聯合醫院（板橋院區）"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A044 "板橋中興醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A045 "新泰綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A046 "仁愛醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A047 "瑞芳礦工醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A048 "衛生福利部樂生療養院"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A049 "天主教耕莘醫療財團法人耕莘醫院安康院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A050 "新北市立土城醫院(委託長庚醫療財團法人興建經營)"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A051 "衛生福利部金門醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "9020"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A052 "連江縣立醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "9007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A053 "衛生福利部桃園醫院新屋分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A054 "衛生福利部桃園醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A055 "敏盛綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A056 "聯新國際醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A057 "長庚醫療財團法人林口長庚紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A058 "國軍桃園總醫院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A059 "沙爾德聖保祿修女會醫療財團法人聖保祿醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A060 "臺北榮民總醫院桃園分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A061 "天成醫療社團法人天晟醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A062 "天成醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A063 "怡仁綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A064 "國立臺灣大學醫學院附設醫院新竹臺大分院新竹醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10018"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A065 "國軍新竹地區醫院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "10018"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A066 "台灣基督長老教會馬偕醫療財團法人新竹馬偕紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10018"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A067 "國泰醫療財團法人新竹國泰綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10018"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A068 "南門綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10018"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A069 "國立臺灣大學醫學院附設醫院新竹臺大分院生醫醫院竹東院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "10004"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A070 "東元綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10004"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A071 "臺北榮民總醫院新竹分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10004"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A072 "天主教仁慈醫療財團法人仁慈醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10004"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A073 "中國醫藥大學新竹附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10004"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A074 "衛生福利部苗栗醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10005"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A075 "李綜合醫療社團法人苑裡李綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10005"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A076 "財團法人為恭紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10005"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A077 "衛生福利部臺中醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A078 "衛生福利部豐原醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A079 "臺中榮民總醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A080 "中國醫藥大學附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A081 "中山醫學大學附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A082 "澄清綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A083 "澄清綜合醫院中港分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A084 "童綜合醫療社團法人童綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A085 "光田醫療社團法人光田綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A086 "國軍臺中總醫院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A087 "仁愛醫療財團法人大里仁愛醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A088 "佛教慈濟醫療財團法人台中慈濟醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A089 "林新醫療社團法人林新醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A090 "林新醫療社團法人烏日林新醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A091 "李綜合醫療社團法人大甲李綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A092 "衛生福利部彰化醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A093 "彰化基督教醫療財團法人彰化基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A094 "彰化基督教醫療財團法人彰化基督教兒童醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A095 "彰化基督教醫療財團法人二林基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A096 "彰化基督教醫療財團法人鹿港基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A097 "秀傳醫療財團法人彰濱秀傳紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A098 "秀傳醫療社團法人秀傳紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A099 "彰化基督教醫療財團法人員林基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A100 "衛生福利部南投醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A101 "臺中榮民總醫院埔里分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A102 "埔基醫療財團法人埔里基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A103 "竹山秀傳醫療社團法人竹山秀傳醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A104 "國立臺灣大學醫學院附設醫院雲林分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10009"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A105 "國立成功大學醫學院附設醫院斗六分院 "
  * ^property[0].code = #county
  * ^property[0].valueString = "10009"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A106 "彰化基督教醫療財團法人雲林基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10009"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A107 "中國醫藥大學北港附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10009"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A108 "長庚醫療財團法人雲林長庚紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10009"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A109 "天主教若瑟醫療財團法人若瑟醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10009"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A110 "衛生福利部嘉義醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10020"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A111 "戴德森醫療財團法人嘉義基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10020"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A112 "天主教中華聖母修女會醫療財團法人天主教聖馬爾定醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10020"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A113 "臺中榮民總醫院嘉義分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10020"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A114 "長庚醫療財團法人嘉義長庚紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10010"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A115 "佛教慈濟醫療財團法人大林慈濟醫院 "
  * ^property[0].code = #county
  * ^property[0].valueString = "10010"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A116 "臺中榮民總醫院灣橋分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10010"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A117 "衛生福利部朴子醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10010"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A118 "衛生福利部臺南醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A119 "奇美醫療財團法人奇美醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A120 "國立成功大學醫學院附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A121 "台灣基督長老教會新樓醫療財團法人台南新樓醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A122 "台灣基督長老教會新樓醫療財團法人麻豆新樓醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A123 "台南市立醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A124 "奇美醫療財團法人柳營奇美醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A125 "衛生福利部胸腔病院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A126 "奇美醫療財團法人佳里奇美醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A127 "郭綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A128 "臺南市立安南醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A129 "高雄市立民生醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A130 "衛生福利部旗山醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A131 "國軍高雄總醫院左營分院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A132 "國軍高雄總醫院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A133 "阮綜合醫療社團法人阮綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A134 "高雄市立小港醫院 委託財團法人私立高雄醫學大學經營"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A135 "義大醫療財團法人義大醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A136 "健仁醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A137 "高雄榮民總醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A138 "財團法人私立高雄醫學大學附設中和紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A139 "高雄市立聯合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A140 "長庚醫療財團法人高雄長庚紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A141 "衛生福利部屏東醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A142 "安泰醫療社團法人安泰醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A143 "寶建醫療社團法人寶建醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A144 "屏基醫療財團法人屏東基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A145 "枋寮醫療社團法人枋寮醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A146 "國仁醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A147 "輔英科技大學附設醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A148 "三軍總醫院澎湖分院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "10016"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A149 "衛生福利部花蓮醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10015"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A150 "佛教慈濟醫療財團法人花蓮慈濟醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10015"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A151 "臺灣基督教門諾會醫療財團法人門諾醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10015"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A152 "臺灣基督教門諾會醫療財團法人門諾醫院壽豐分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10015"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A153 "國軍花蓮總醫院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "10015"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A154 "臺北榮民總醫院玉里分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10015"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A155 "衛生福利部臺東醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10014"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A156 "東基醫療財團法人臺東基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10014"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A157 "台灣基督長老教會馬偕醫療財團法人臺東馬偕紀念醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10014"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A158 "國立臺灣大學醫學院附設醫院新竹臺大分院生醫醫院竹北院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "10004"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A159 "高雄榮民總醫院臺南分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A160 "大千綜合醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10005"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A161 "衛生福利部新營醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A162 "光田醫療社團法人光田綜合醫院(大甲院區)"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A163 "亞洲大學附屬醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A164 "醫療財團法人辜公亮基金會和信治癌中心醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A165 "臺北市立聯合醫院松德院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A166 "衛生福利部澎湖醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10016"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A167 "國軍臺中總醫院中清分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A168 "佑民醫療社團法人佑民醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A169 "高雄市立大同醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A170 "衛生福利部草屯療養院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A171 "義大醫療財團法人義大醫院大昌醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A172 "衛生福利部臺南醫院新化分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A173 "童綜合醫療社團法人童綜合醫院沙鹿院區"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A174 "國立臺灣大學醫學院附設醫院癌醫中心分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A175 "康寧醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A176 "其他收治醫院(新北市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "65000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A177 "其他收治醫院(台北市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "63000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A178 "其他收治醫院(桃園市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "68000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A179 "其他收治醫院(台中市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "66000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A180 "其他收治醫院(台南市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "67000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A181 "其他收治醫院(高雄市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A182 "其他收治醫院(宜蘭縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10002"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A183 "其他收治醫院(新竹縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10004"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A184 "其他收治醫院(苗栗縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10005"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A185 "其他收治醫院(彰化縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A186 "其他收治醫院(南投縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A187 "其他收治醫院(雲林縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10009"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A188 "其他收治醫院(嘉義縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10010"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A189 "其他收治醫院(屏東縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A190 "其他收治醫院(台東縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10014"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A191 "其他收治醫院(花蓮縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10015"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A192 "其他收治醫院(澎湖縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10016"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A193 "其他收治醫院(基隆市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10017"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A194 "其他收治醫院(新竹市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10018"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A195 "其他收治醫院(嘉義市)"
  * ^property[0].code = #county
  * ^property[0].valueString = "10020"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A196 "其他收治醫院(金門縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "09020"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A197 "其他收治醫院(連江縣)"
  * ^property[0].code = #county
  * ^property[0].valueString = "09007"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A198 "高雄榮民總醫院屏東分院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A199 "國軍高雄總醫院屏東分院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "10013"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A200 "國軍高雄總醫院岡山分院附設民眾診療服務處"
  * ^property[0].code = #county
  * ^property[0].valueString = "64000"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #A201 "彰化基督教醫療財團法人南投基督教醫院"
  * ^property[0].code = #county
  * ^property[0].valueString = "10008"
  * ^property[1].code = #siteType
  * ^property[1].valueString = "A"
* #B001 "陽明山集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B002 "士林集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B003 "中正集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B004 "大安集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B005 "汐止集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B006 "竹林集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B007 "桂山集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B008 "萬里集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B009 "烏來集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B010 "蘭陽集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10002"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B011 "礁溪集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10002"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B012 "林口集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B013 "雙連坡集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B014 "大崗集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B015 "楊梅集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B016 "桃園集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B017 "龜山集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B018 "桃園2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B019 "八德集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B020 "桃療集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B021 "新竹集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B022 "湖口集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10004"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B023 "西屯集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B024 "豐原集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B025 "臺中東區集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B026 "臺中中區集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B027 "臺中北區集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B028 "臺中中區2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B029 "中興集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10008"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B030 "草屯集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10008"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B031 "竹山集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10008"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B032 "彰化集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B033 "花壇集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B034 "官田集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B035 "新化-1集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B036 "新化-2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B037 "新化-3集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B038 "鹽水集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B039 "麻豆集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B040 "嘉義集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10020"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B041 "大林集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10010"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B042 "太保集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10010"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B043 "朴子集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10010"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B044 "中埔集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10010"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B045 "大寮集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B046 "燕巢集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B047 "高埕1集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B048 "高埕2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B049 "高新集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B050 "高前集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B051 "高民集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B052 "長治集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10013"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B053 "香山集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10018"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B054 "新竹-2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10018"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B055 "麻豆-2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B056 "高民-2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B057 "其他集中檢疫所(新北市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B058 "其他集中檢疫所(台北市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B059 "其他集中檢疫所(桃園市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B060 "其他集中檢疫所(台中市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B061 "其他集中檢疫所(台南市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B062 "其他集中檢疫所(高雄市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B063 "其他集中檢疫所(宜蘭縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10002"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B064 "其他集中檢疫所(新竹縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10004"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B065 "其他集中檢疫所(苗栗縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10005"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B066 "其他集中檢疫所(彰化縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B067 "其他集中檢疫所(南投縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10008"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B068 "其他集中檢疫所(雲林縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10009"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B069 "其他集中檢疫所(嘉義縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10010"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B070 "其他集中檢疫所(屏東縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10013"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B071 "其他集中檢疫所(台東縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10014"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B072 "其他集中檢疫所(花蓮縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10015"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B073 "其他集中檢疫所(澎湖縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10016"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B074 "其他集中檢疫所(基隆市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10017"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B075 "其他集中檢疫所(新竹市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10018"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B076 "其他集中檢疫所(嘉義市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10020"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B077 "其他集中檢疫所(金門縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09020"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B078 "其他集中檢疫所(連江縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B079 "松山集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B080 "中正二集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B081 "萬華集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B082 "台中北屯集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #B083 "台中北區2集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #BA01 "安心集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #BA02 "關懷集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #BA03 "關愛集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "B"
* #C001 "台北凱撒大飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C002 "三德大飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C003 "中源大飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C004 "洛碁大飯店新仕界"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C005 "同一大飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C006 "熱海大飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C007 "沐舍國際飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C008 "王朝大酒店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C009 "淡水亞太飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C010 "泰山麗京棧酒店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C011 "板橋趣淘漫旅"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C012 "三重水漾傑仕堡"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C013 "新店白金花園酒店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C014 "深坑海灣假日酒店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C015 "薆悅酒店野柳度假館二館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C016 "薆悅酒店野柳度假館一館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C017 "皇家金宸大飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C018 "澄清會館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C019 "其他加強型防疫旅館(新北市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C020 "其他加強型防疫旅館(台北市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C021 "其他加強型防疫旅館(桃園市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "68000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C022 "其他加強型防疫旅館(台中市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "66000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C023 "其他加強型防疫旅館(台南市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "67000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C024 "其他加強型防疫旅館(高雄市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "64000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C025 "其他加強型防疫旅館(宜蘭縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10002"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C026 "其他加強型防疫旅館(新竹縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10004"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C027 "其他加強型防疫旅館(苗栗縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10005"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C028 "其他加強型防疫旅館(彰化縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C029 "其他加強型防疫旅館(南投縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10008"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C030 "其他加強型防疫旅館(雲林縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10009"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C031 "其他加強型防疫旅館(嘉義縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10010"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C032 "其他加強型防疫旅館(屏東縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10013"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C033 "其他加強型防疫旅館(台東縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10014"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C034 "其他加強型防疫旅館(花蓮縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10015"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C035 "其他加強型防疫旅館(澎湖縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10016"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C036 "其他加強型防疫旅館(基隆市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10017"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C037 "其他加強型防疫旅館(新竹市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10018"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C038 "其他加強型防疫旅館(嘉義市)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10020"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C039 "其他加強型防疫旅館(金門縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09020"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C040 "其他加強型防疫旅館(連江縣)"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C041 "洄瀾國際文教會館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10015"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C042 "三重水美行旅"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C043 "淡水沐舍飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "65000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C044 "綺麗商旅園區館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10014"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C045 "溪州集中檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C046 "金防部神鷹營區"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09020"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C047 "衛福部宿舍"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C048 "北竿舊衛生所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C049 "莒光醫療排"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C050 "北海南營區"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C051 "牛角中營區"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C052 "核心營區"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09007"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C053 "警光會館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "09020"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C054 "北極星經典汽車旅館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10017"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C055 "鮪魚飯店-屏東館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10013"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C056 "薇米商旅"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10013"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C057 "澎湖警光會館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10016"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C058 "澎湖縣勞工育樂中心"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10016"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C059 "興仁加強版集中防疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "10016"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C060 "洛碁大飯店建北館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #C061 "寶璞大飯店"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "63000"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "C"
* #999999996 "地方檢疫所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "依縣市代碼填寫"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "99"
* #999999997 "一般型防疫旅館"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "依縣市代碼填寫"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "99"
* #999999998 "居家"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "依縣市代碼填寫"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "99"
* #999999999 "其他指定隔離處所"
  * ^property[0].code = #inactive
  * ^property[0].valueBoolean = true
  * ^property[1].code = #comment
  * ^property[1].valueString = "V1.18移除"
  * ^property[2].code = #county
  * ^property[2].valueString = "依縣市代碼填寫"
  * ^property[3].code = #siteType
  * ^property[3].valueString = "99"

ValueSet: CDCQuarantineSite
Id: cdc-quarantine-site
Title: "CDC-NIDRS-隔離處所代碼值集"
Description: "CDC-NIDRS-隔離處所代碼值集，包含代碼系統 CDCQuarantineSite 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCQuarantineSite
