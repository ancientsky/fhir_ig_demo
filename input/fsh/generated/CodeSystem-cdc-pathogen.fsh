CodeSystem: CDCPathogen
Id: cdc-pathogen
Title: "CDC-NIDRS-病原體類別代碼(大項及細項)"
Description: "臺灣衛生福利部疾病管制署 NIDRS 電子病歷傳染病自動通報作業 2.0「病原體類別大項、病原體類別細項及與大項之關連」代碼，資料來源：附錄四代碼彙整表 v1.42（2026-09-29）；資料所屬單位：臺灣衛生福利部疾病管制署。大項代碼為細項代碼之上層代碼(parent)。"
* ^caseSensitive = true
* ^content = #complete
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* ^hierarchyMeaning = #is-a
* ^property[0].code = #comment
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#comment"
* ^property[0].description = "代碼表備註(代碼處理方式)"
* ^property[0].type = #string
* ^property[1].code = #parent
* ^property[1].uri = "http://hl7.org/fhir/concept-properties#parent"
* ^property[1].description = "上層代碼"
* ^property[1].type = #code
* #"----" "病原體分離陰性"
* #001 "霍亂弧菌"
* #002 "傷寒、副傷寒桿菌"
* #003 "沙門氏桿菌"
* #004 "志賀桿菌"
* #006 "E.histolytica/dispar"
* #009 "結核桿菌"
* #020 "鼠疫桿菌"
* #021 "兔熱病"
* #022 "炭疽桿菌"
* #025 "類鼻疽桿菌"
* #026 "巴通氏菌"
* #027 "李斯特菌"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V2.1.31新增"
* #032 "白喉桿菌"
* #033 "百日咳桿菌"
* #037 "破傷風桿菌"
* #042 "NDM-1腸道菌"
* #043 "VISA/VRSA"
* #044 "HIV"
* #045 "小兒麻痺病毒"
* #0050 "金黃色葡萄球菌"
* #050 "天花病毒"
* #0051 "肉毒桿菌"
* #052 "水痘帶狀病毒"
* #0054 "腸炎弧菌"
* #055 "麻疹病毒"
* #056 "德國麻疹病毒"
* #0058 "其他細菌性食物中毒"
* #0059 "混合瘧"
* #0060 "E.histolytica/E. dispar"
* #060 "黃熱病病毒"
* #061 "登革病毒"
* #0061 "人芽囊原蟲"
* #0062 "哈氏阿米巴"
* #0063 "大腸阿米巴"
* #0064 "嗜碘阿米巴"
* #0065 "微小阿米巴"
* #0066 "E.histolytica"
* #0067 "梨形鞭毛蟲"
* #0068 "E. dispar"
* #0069 "嗜鹽梗孢酵母(Sterigmatomyces)"
* #0070 "嗜鹽黑色酵母(Hortaea)"
* #070 "肝炎病毒"
* #0071 "Sagenomella"
* #071 "狂犬病"
* #072 "腮腺炎病毒"
* #077 "水痘併發症"
* #0080 "腸道出血性大腸桿菌"
* #080 "斑疹傷寒立克次菌"
* #084 "瘧原蟲"
* #098 "淋病雙球菌"
* #100 "鉤端螺旋體"
* #120 "住血吸蟲"
* #125 "血絲蟲"
* #130 "弓形蟲"
* #150 "發熱伴血小板減少症候群病毒"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V2.1.31新增"
* #0341 "A族鏈球菌"
* #0360 "奈氏雙球菌"
* #0412 "肺炎鏈球菌"
* #0487 "流感病毒"
* #0543 "庖疹B病毒"
* #00601 "E. histolytica/E. dispar"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V2.1.31新增"
* #0620 "日本腦炎病毒"
* #00661 "E. histolytica"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V2.1.31新增"
* #0663 "西尼羅病毒"
* #00671 "唇形鞭毛蟲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V2.1.31新增"
* #0749 "腸病毒"
* #0788 "伊波拉病毒出血熱"
* #0800 "出血性大腸桿菌"
* #0812 "恙蟲病立克次菌"
* #920 "屈公病毒"
* #995 "貝氏考克斯菌"
* #996 "諾羅病毒"
* #997 "輪狀病毒"
* #998 "其他呼吸道病毒"
* #999 "其他"
* #1001 "SARS冠狀病毒"
* #1048 "伯氏疏螺旋體"
* #3200 "b型嗜血桿菌"
* #4808 "漢他病毒"
* #4828 "退伍軍人菌"
* #9901 "披衣菌"
* #9902 "黴漿菌"
* #9903 "奴卡氏菌(Nocardia)"
* #9905 "砂眼披衣菌"
* #9906 "念珠菌(Candida spp.)"
* #9907 "毛孢子菌(Trichosporon spp.)"
* #9908 "黃桿菌(Chryseobacterium spp.)"
* #9909 "髮癬菌(Trichophyton)"
* #9910 "組織漿菌(Histoplasma)"
* #9911 "球黴菌(Coccidioides)"
* #9912 "小胞癬菌(Microsporum)"
* #9913 "表皮癬菌(Epidermophyton)"
* #9914 "放射菌(Actinomyces)"
* #9915 "Finegoldia"
* #9920 "CRE"
* #9921 "Cryptococcus neoformans"
* #9922 "仙人掌桿菌 Bacillus cereus"
* #9923 "布氏桿菌"
* #9924 "庫賈氏病"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V2.1.31新增"
* #045a "急性無力肢體麻痺症"
* #0487a "流感重症"
* #0663a "裂谷熱病毒"
* #0788a "馬堡病毒"
* #0788b "拉薩病毒"
* #19CoV "2019-nCoV"
* #ZIKAV "茲卡病毒"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V2.1.31新增"
* #001001 "O1-Ogawa"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #001
* #001002 "O1-Inaba"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #001
* #001003 "O1-Hikojima"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #001
* #001004 "O139"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #001
* #001005 "Non-O1,Non-O139"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #001
* #001006 "Hakada"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #001
* #001007 "EL-Tor"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #001
* #002001 "S. paratyphi A"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #002
* #002002 "S. paratyphi B"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #002
* #002003 "S. paratyphi C"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #002
* #002004 "S.typhi"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #002
* #003001 "S. group 02"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003002 "S. group 04"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003003 "S. group 07"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003004 "S. group 08"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003005 "S. group 09"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003006 "S. group 09, 46"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003007 "S. group 03, 10"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003008 "S. group 01, 03, 19"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003009 "S. group 011"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003010 "S. group 013"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003011 "S. group 06, 14"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003012 "S. group 016"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003013 "S. group 018"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003014 "S. group 021"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003015 "S. group 035"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003016 "S. group 043"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #003017 "其他沙門氏菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #003
* #004001 "Sub-group A"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #004
* #004002 "Sub-group B"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #004
* #004003 "Sub-group C"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #004
* #004004 "Sub-group D"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #004
* #0050001 "腸毒素A型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0050
* #0050002 "腸毒素B型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0050
* #0050003 "腸毒素C型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0050
* #0050004 "腸毒素D型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0050
* #0050005 "腸毒素A~D型陰性"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0050
* #0050006 "其他"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0050
* #0051001 "Toxigenic"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0051
* #0054001 "腸炎弧菌混合血清型1群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054002 "腸炎弧菌混合血清型2群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054003 "腸炎弧菌混合血清型3群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054004 "腸炎弧菌混合血清型4群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054005 "腸炎弧菌混合血清型5群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054006 "腸炎弧菌混合血清型6群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054007 "腸炎弧菌混合血清型7群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054008 "腸炎弧菌混合血清型8群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054009 "腸炎弧菌混合血清型9群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0054010 "其他腸炎弧菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0054
* #0058001 "李斯特氏菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0058
* #0058002 "似單胞類志賀桿菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0058
* #0058003 "產氣單胞菌屬"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0058
* #0058004 "創傷弧菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0058
* #0058005 "仙人掌桿菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0058
* #006001 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006002 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006003 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006004 "人芽囊原蟲"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006005 "哈氏阿米巴"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006006 "大腸阿米巴"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006007 "嗜碘阿米巴"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006008 "微小阿米巴"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #006
* #006010 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0060
* #006020 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0060
* #006030 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0060
* #006011 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00601
* #006012 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00601
* #006013 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00601
* #00621 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0062
* #00622 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0062
* #00623 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0062
* #00631 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0063
* #00632 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0063
* #00633 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0063
* #00641 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0064
* #00642 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0064
* #00643 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0064
* #00651 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0065
* #00652 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0065
* #00653 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0065
* #006611 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00661
* #006612 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00661
* #006613 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00661
* #"活動體" "00672"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0067
* #00672 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0067
* #00673 "囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0067
* #00674 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0067
* #006711 "活動體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00671
* #006712 "活動體及囊體"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #00671
* #006901 "S. halophilus"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0069
* #006902 "S. elviae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0069
* #007001 "H. werneckii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0070
* #007101 "S. keratitidis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0071
* #007102 "S. chlamydospora"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0071
* #0080001 "O157：H7型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0080
* #0080002 "Non-O157型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0080
* #0080003 "O157：NM"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0080
* #0080004 "Toxigenic"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0080
* #027a "L. monocytogenes"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #027
* #027b "Listeria sp."
  * ^property[0].code = #parent
  * ^property[0].valueCode = #027
* #032001 "Toxigenic"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #032
* #032002 "Non-toxigenic"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #032
* #0360001 "血清型A"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0360
* #0360002 "血清型B"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0360
* #0360003 "血清型C"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0360
* #0360004 "血清型Y"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0360
* #0360005 "血清型W135"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0360
* #0360006 "其他血清型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0360
* #0360007 "其他"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0360
* #042001 "K. pneumoniae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042002 "P. aeruginosa"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042003 "E. coli"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042004 "A. baumannii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042005 "E. cloacae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042006 "Klebsiella oxytoca"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042007 "Serratia marcescens"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042008 "Citrobacter freundii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042009 "Enterobacter aerogenes"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #042010 "NDM-1 基因"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #042
* #043001 "VISA"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #043
* #043002 "VRSA"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #043
* #044001 "HIV-1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #044
* #044002 "HIV-2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #044
* #044003 "HTLV-1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #044
* #044004 "P24. Ag"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #044
* #045001 "Poliovirus Sabin type 1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045
* #045002 "Poliovirus Sabin type 2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045
* #045003 "Poliovirus Sabin type 3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045
* #045004 "Poliovirus Wild type 1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045
* #045005 "Poliovirus Wild type 2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045
* #045006 "Poliovirus Wild type 3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045
* #045a001 "克沙奇病毒A群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a002 "克沙奇病毒B群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a003 "腺病毒"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a004 "人類腸道細胞致病性孤兒病毒(Echo)群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a005 "待定型病毒"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a101 "Poliovirus Sabin type 1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a102 "Poliovirus Sabin type 2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a103 "Poliovirus Sabin type 3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a104 "Poliovirus Wild type 1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a105 "Poliovirus Wild type 2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a106 "Poliovirus Wild type 3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a209 "克沙奇病毒A9"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a216 "克沙奇病毒A16"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a224 "克沙奇病毒A24"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a301 "克沙奇病毒B1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a302 "克沙奇病毒B2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a303 "克沙奇病毒B3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a304 "克沙奇病毒B4"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a305 "克沙奇病毒B5"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a306 "克沙奇病毒B6"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a404 "Echo 4"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a406 "Echo 6"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a409 "Echo 9"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a411 "Echo 11"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a430 "Echo 30"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a570 "腸病毒70型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #045a571 "腸病毒71型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #045a
* #0487001 "A型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0487
* #0487002 "B型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0487
* #0487003 "C型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0487
* #0487004 "全部"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0487
* #0487a001 "A型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0487a
* #0487a002 "B型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0487a
* #0487a003 "C型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0487a
* #061001 "第一型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #061
* #061002 "第二型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #061
* #061003 "第三型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #061
* #061004 "第四型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #061
* #070001 "A型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #070
* #070002 "B型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #070
* #070003 "C型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #070
* #07000d "D型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #070
* #07000e "E型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #070
* #07000x "未定型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #070
* #0749001 "克沙奇病毒A群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749002 "克沙奇病毒B群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749003 "腺病毒"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749004 "人類腸道細胞致病性孤兒病毒(Echo)群"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749005 "待定型病毒"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749101 "Poliovirus Sabin type 1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749102 "Poliovirus Sabin type 2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749103 "Poliovirus Sabin type 3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749104 "Poliovirus Wild type 1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749105 "Poliovirus Wild type 2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749106 "Poliovirus Wild type 3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749202 "克沙奇病毒A2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749203 "克沙奇病毒A3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749204 "克沙奇病毒A4"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749205 "克沙奇病毒A5"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749206 "克沙奇病毒A6"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749208 "克沙奇病毒A8"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749209 "克沙奇病毒A9"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749210 "克沙奇病毒A10"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749212 "克沙奇病毒A12"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749216 "克沙奇病毒A16"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749221 "克沙奇病毒A21"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749224 "克沙奇病毒A24"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749301 "克沙奇病毒B1"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749302 "克沙奇病毒B2"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749303 "克沙奇病毒B3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749304 "克沙奇病毒B4"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749305 "克沙奇病毒B5"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749306 "克沙奇病毒B6"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749404 "Echo 4"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749405 "Echo 5"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749406 "Echo 6"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749409 "Echo 9"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749411 "Echo 11"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749418 "Echo 18"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749419 "Echo 3"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749425 "Echo 25"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749430 "Echo 30"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749570 "腸病毒70型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0749571 "腸病毒71型*"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #045a421 "Echovirus E21"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.21新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #0749
* #045a572 "腸病毒68型"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0749
* #0788001 "Zaire"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0788
* #0788002 "Sudan"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0788
* #0788003 "Gabon"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0788
* #0788004 "Ivory coast"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0788
* #0788005 "Reston"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #0788
* #080001 "Rickettsia typhi"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #080
* #080002 "Rickettsia prowazekii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #080
* #084101 "惡性(熱帶)瘧原蟲指環體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084102 "惡性(熱帶)瘧原蟲活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084103 "惡性(熱帶)瘧原蟲分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084104 "惡性(熱帶)瘧原蟲生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084105 "惡性(熱帶)瘧原蟲指環、活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084106 "惡性(熱帶)瘧原蟲指環、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084107 "惡性(熱帶)瘧原蟲指環、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084108 "惡性(熱帶)瘧原蟲活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084109 "惡性(熱帶)瘧原蟲活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084110 "惡性(熱帶)瘧原蟲分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084111 "惡性(熱帶)瘧原蟲指環、活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084112 "惡性(熱帶)瘧原蟲指環、活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084113 "惡性(熱帶)瘧原蟲指環、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084114 "惡性(熱帶)瘧原蟲活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084115 "惡性(熱帶)瘧原蟲指環、活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084116 "惡性(熱帶)瘧原蟲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084201 "間日瘧原蟲指環體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084202 "間日瘧原蟲活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084203 "間日瘧原蟲分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084204 "間日瘧原蟲生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084205 "間日瘧原蟲指環、活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084206 "間日瘧原蟲指環、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084207 "間日瘧原蟲指環、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084208 "間日瘧原蟲活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084209 "間日瘧原蟲活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084210 "間日瘧原蟲分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084211 "間日瘧原蟲指環、活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084212 "間日瘧原蟲指環、活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084213 "間日瘧原蟲活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084214 "間日瘧原蟲指環、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084215 "間日瘧原蟲指環、活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084216 "間日瘧原蟲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084301 "三日瘧原蟲指環體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084302 "三日瘧原蟲活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084303 "三日瘧原蟲分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084304 "三日瘧原蟲生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084305 "三日瘧原蟲指環、活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084306 "三日瘧原蟲指環、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084307 "三日瘧原蟲指環、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084308 "三日瘧原蟲活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084309 "三日瘧原蟲活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084310 "三日瘧原蟲分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084311 "三日瘧原蟲指環、活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084312 "三日瘧原蟲指環、活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084313 "三日瘧原蟲指環、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084314 "三日瘧原蟲活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084315 "三日瘧原蟲指環、活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084316 "三日瘧原蟲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084401 "卵形瘧原蟲指環體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084402 "卵形瘧原蟲活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084403 "卵形瘧原蟲分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084404 "卵形瘧原蟲生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084405 "卵形瘧原蟲指環、活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084406 "卵形瘧原蟲指環、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084407 "卵形瘧原蟲指環、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084408 "卵形瘧原蟲活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084409 "卵形瘧原蟲活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084410 "卵形瘧原蟲分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084411 "卵形瘧原蟲指環、活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084412 "卵形瘧原蟲指環、活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084413 "卵形瘧原蟲指環、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084414 "卵形瘧原蟲活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084415 "卵形瘧原蟲指環、活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084416 "卵形瘧原蟲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084501 "混合瘧原蟲指環體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084502 "混合瘧原蟲活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084503 "混合瘧原蟲分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084504 "混合瘧原蟲生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084505 "混合瘧原蟲指環、活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084506 "混合瘧原蟲指環、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084507 "混合瘧原蟲指環、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084508 "混合瘧原蟲活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084509 "混合瘧原蟲活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084510 "混合瘧原蟲分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084511 "混合瘧原蟲指環、活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084512 "混合瘧原蟲指環、活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084513 "混合瘧原蟲指環、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084514 "混合瘧原蟲活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084515 "混合瘧原蟲指環、活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084516 "混合瘧原蟲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084610 "諾氏瘧原蟲"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32調整"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084611 "諾氏瘧原蟲指環體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084612 "諾氏瘧原蟲活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084613 "諾氏瘧原蟲分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084614 "諾氏瘧原蟲生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084615 "諾氏瘧原蟲指環、活動體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084616 "諾氏瘧原蟲指環、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084617 "諾氏瘧原蟲指環、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084618 "諾氏瘧原蟲活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084619 "諾氏瘧原蟲活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084620 "諾氏瘧原蟲分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084621 "諾氏瘧原蟲指環、活動、分裂體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084622 "諾氏瘧原蟲指環、活動、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084623 "諾氏瘧原蟲指環、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084624 "諾氏瘧原蟲活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #084625 "諾氏瘧原蟲指環、活動、分裂、生殖母體"
  * ^property[0].code = #comment
  * ^property[0].valueString = "V1.32新增"
  * ^property[1].code = #parent
  * ^property[1].valueCode = #084
* #120001 "Schistosome japonicum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #120
* #120002 "Schistosome haematobium"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #120
* #120003 "Schistosome mamsoni"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #120
* #125001 "微絲蟲"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #125
* #4828001 "L. pneumophila"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828002 "L. anisa"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828003 "L. birminghamensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828004 "L. bozemanii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828005 "L. cincinnatiensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828006 "L. dumoffii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828007 "L. feeleii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828008 "L. gormanii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828009 "L. hackeliae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828010 "L. jordanis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828011 "L. lansingensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828012 "L. longbeachae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828013 "L. maceachernii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828014 "L. micdadei"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828015 "L. oakridgensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828016 "L. sainthelensi"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828017 "L. tucsonensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828018 "L. wadsworthii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828019 "其他"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #4828020 "L. species"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #4828
* #990101 "肺炎披衣菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9901
* #990102 "砂眼披衣菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9901
* #990103 "鸚鵡熱披衣菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9901
* #990201 "肺炎黴漿菌"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9902
* #990301 "N. asteroides"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9903
* #990302 "N. brasiliensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9903
* #990303 "N. farcinica"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9903
* #990304 "N. nova"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9903
* #990305 "N. otitidiscaviarum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9903
* #990306 "N. transvalensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9903
* #990307 "其他"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9903
* #99061 "白色念珠菌(Candida albicans)"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9906
* #99062 "熱帶念珠菌(Candida tropicalis)"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9906
* #99063 "禿髮念珠菌(Candida glabrata)"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9906
* #99064 "近平滑念珠菌(Candida parapsilosis)"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9906
* #99065 "解脂耶氏酵母(Candida lipolytica)"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9906
* #99071 "Trichosporon montevideense"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9907
* #99072 "出芽短梗黴(Aureobasidium pullulans)"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9907
* #99081 "Chryseobacterium indologenes"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9908
* #99091 "T. ajelloi"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9909
* #99092 "T. mentagrophytes"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9909
* #99093 "T. rubrum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9909
* #99094 "T. schoenleinii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9909
* #99095 "T. tonsurans"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9909
* #99096 "T. violaceum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9909
* #99097 "T. verrucosum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9909
* #991001 "H. capsulatum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9910
* #991002 "H. duboisii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9910
* #991101 "C. immitis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9911
* #991102 "C. posadasii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9911
* #991201 "M. audouini"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9912
* #991202 "M. canis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9912
* #991203 "M. gypseum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9912
* #991204 "M. nanum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9912
* #991301 "E. floccosum"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9913
* #991401 "A. neuii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991402 "A. israelii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991403 "A. meyeri"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991404 "A. naeslundii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991405 "A. odontolyticus"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991406 "A. viscosus"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991407 "A. europaeus"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991408 "A. turicensis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991409 "A. georgiae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991410 "A. dentalis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991411 "A. oricola"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991412 "A. radicidentis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991413 "A. urogenitalis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991414 "A. graevenitzii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9914
* #991501 "F. magna"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9915
* #992001 "K. pneumoniae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992002 "P. aeruginosa"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992003 "E. coli"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992004 "A. baumannii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992005 "E. cloacae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992006 "Klebsiella oxytoca"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992007 "Serratia marcescens"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992008 "Citrobacter freundii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992009 "Enterobacter aerogenes"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992010 "Proteus mirabilis"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992011 "Raoultella terrigena"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992012 "Proteus vulgaris"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992013 "Citrobacter koseri"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992014 "Citrobacter amalonaticus"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #992015 "Enterobacter asburiae"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #042011 "Providencia rettgeri"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #042012 "Providencia stuartii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9920
* #99211 "C.neoformans var.grubii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9921
* #99212 "C. neoformans var.neoformans"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9921
* #99213 "C. gattii"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #9921
* #998001 "Metapnueumovirus"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #998
* #998002 "ADENO"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #998
* #998003 "CMV"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #998
* #998004 "HSV"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #998
* #998005 "RSV"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #998
* #998006 "PARAINF"
  * ^property[0].code = #parent
  * ^property[0].valueCode = #998

ValueSet: CDCPathogen
Id: cdc-pathogen
Title: "CDC-NIDRS-病原體類別代碼(大項及細項)值集"
Description: "CDC-NIDRS-病原體類別代碼(大項及細項)值集，包含代碼系統 CDCPathogen 之所有代碼。"
* ^experimental = false
* ^date = "2026-09-29"
* ^version = "0.1.0"
* include codes from system CDCPathogen
