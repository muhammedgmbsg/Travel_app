import 'package:flutter/material.dart';

class Data{
  
//Şehir ile alakalı veriler
 static Map<String, List<String>> cityAnswer = {
    'İstanbul': [
    'İstanbul\'da geniş bir yemek kültürü vardır. Boğaz balıkları, kebap çeşitleri, baklava ve diğer tatlılar oldukça ünlüdür.',
    'Evet, İstanbul\'un yemek kültürü çok gelişmiştir. Farklı mutfaklardan etkilenmiş zengin bir çeşitliliğe sahiptir.',
    'Fiyatlar genellikle orta seviyededir. Ancak lüks restoranlarda fiyatlar daha yüksek olabilir.',
    'İstanbul\'un iklimi ılıman olduğundan, taze malzemeler yıl boyunca bulunabilir. Bu da yemek kalitesini olumlu etkiler.',
    'Evet, İstanbul\'da birçok tarihi ve turistik yer olduğu için gezilmeye değer bir şehirdir.'
  ],
  'Ankara': [
    'Ankara\'da genellikle geleneksel Türk mutfağına ait yemekler bulunabilir. Kuzu tandır ve Ankara tavası gibi yöresel lezzetler ünlüdür.',
    'Evet, Ankara\'nın yemek kültürü gelişmiştir, ancak İstanbul kadar çeşitlilik göstermez.',
    'Fiyatlar genellikle orta seviyededir. Şehir, büyük metropollerle kıyaslandığında daha ekonomik olabilir.',
    'İklimi karasal olduğu için mevsimlere bağlı olarak taze malzemelerin bulunabilirliği değişebilir.',
    'Ankara, tarihi ve kültürel açıdan önemli yerlere ev sahipliği yaptığı için gezilmeye değer bir şehirdir.'
  ],
  'İzmir': [
    'İzmir mutfağı, Egenin taze sebzeleri ve deniz ürünleri ile öne çıkar. Zeytinyağlı yemekler ve midye tava gibi lezzetler popülerdir.',
    'Evet, İzmir\'in yemek kültürü zengin ve çeşitlidir. Egenin taze ürünleriyle beslenir.',
    'Fiyatlar genellikle ortalama seviyededir. Deniz kenarındaki mekanlarda fiyatlar biraz daha yüksek olabilir.',
    'Ege iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir. Bu da yemekleri lezzetli kılar.',
    'İzmir, antik kentleri ve sahil bölgeleriyle turistler için çekici bir destinasyondur.'
  ],
  'Antalya': [
    'Antalya, Akdeniz mutfağına ait birçok lezzeti sunar. Deniz ürünleri, nar ekşili yemekler ve baklavası ünlüdür.',
    'Evet, Antalya\'nın yemek kültürü zengin ve çeşitlidir. Akdenizin taze malzemeleriyle beslenir.',
    'Fiyatlar genellikle turistik bölgelerde biraz yüksektir. Ancak genelde çeşitli fiyat seviyelerine sahiptir.',
    'Akdeniz iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir. Bu da yemekleri lezzetli kılar.',
    'Antalya, tarihi kalıntıları ve doğal güzellikleri ile ünlüdür, bu nedenle gezilmeye değer bir şehirdir.'
  ],
  'Bursa': [
    'Bursa mutfağı, Osmanlı İmparatorluğunun etkilerini taşır. İskender kebap ve İnegöl köfte gibi lezzetler meşhurdur.',
    'Evet, Bursa\'nın yemek kültürü zengin ve tarihî bir geçmişe sahiptir.',
    'Fiyatlar genellikle diğer büyük şehirlere göre daha uygun seviyededir.',
    'Marmara iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Bursa, tarihi ve kültürel zenginlikleriyle turist çekiciliği olan bir şehirdir.'
  ],
  'Trabzon': [
    'Trabzon mutfağı, Karadenizin taze balıkları ve mısır unuyla yapılan ekmekleri içerir. Hamsi tava ve kuymak popülerdir.',
    'Evet, Trabzon\'un yemek kültürü özellikle deniz ürünleri ile zengindir.',
    'Fiyatlar genellikle ortalama seviyededir. Deniz kenarındaki mekanlarda fiyatlar biraz daha yüksek olabilir.',
    'Karadeniz iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Trabzon, doğal güzellikleri ve tarihi zenginlikleri ile bilinen bir şehirdir.'
  ],
  'Adana': [
    'Adana mutfağı, kebapları ve baharatlı lezzetleri ile ünlüdür. Adana kebap ve şalgam içecekleri meşhurdur.',
    'Evet, Adana\'nın yemek kültürü özellikle kebapları ile ünlüdür.',
    'Fiyatlar genellikle diğer büyük şehirlere göre uygun seviyededir.',
    'Akdeniz iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Adana, tarihi ve kültürel zenginliklere sahip bir şehirdir.'
  ],
  'Konya': [
    'Konya mutfağı, et ağırlıklıdır. Mevlana lokması ve etli ekmek gibi özel tatları vardır.',
    'Evet, Konya\'nın yemek kültürü geleneksel ve et ağırlıklıdır.',
    'Fiyatlar genellikle ortalama seviyededir. Geleneksel restoranlarda yerel lezzetleri denemek uygun maliyetlidir.',
    'İç Anadolu iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Konya, Mevlana Türbesi ve geleneksel mimarisi ile turistler için ilgi çekicidir.'
  ],
  'Eskişehir': [
    'Eskişehir mutfağı, unlu mamulleri ve meşhur çibörekleri içerir. Ayrıca balaban köfte de lezzetlidir.',
    'Evet, Eskişehir\'in yemek kültürü özellikle çibörek ve balaban köfte gibi yerel lezzetleri ile ünlüdür.',
    'Fiyatlar genellikle diğer büyük şehirlere göre uygun seviyededir.',
    'İç Anadolu iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Eskişehir, sanat ve kültür etkinlikleriyle dikkat çeken bir şehirdir.'
  ],
  'Denizli': [
    'Denizli mutfağı, Pamukkalenin ünlü traverten sularıyla yapılan taratoru ve beyran çorbasını içerir.',
    'Evet, Denizli\'nin yemek kültürü özellikle traverten suları ile yapılan tarator ve beyran çorbası gibi lezzetleri içerir.',
    'Fiyatlar genellikle diğer büyük şehirlere göre uygun seviyededir.',
    'Akdeniz iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Denizli, doğal güzellikleri ve tarihi zenginlikleri ile bilinen bir şehirdir.'
  ],
  'Samsun': [
    'Samsun mutfağı, Karadenizin taze balıklarını ve mısır unuyla yapılan ekmekleri içerir. Banduma ve hamsiköy ünlüdür.',
    'Evet, Samsun\'un yemek kültürü özellikle Karadenizin taze balıkları ile dikkat çeker.',
    'Fiyatlar genellikle ortalama seviyededir. Deniz kenarındaki mekanlarda fiyatlar biraz daha yüksek olabilir.',
    'Karadeniz iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Samsun, tarihi ve kültürel zenginliklere sahip bir şehirdir.'
  ],
  'Kayseri': [
    'Kayseri mutfağı, pastırması ve mantarlı manti gibi lezzetleri içerir. Ayrıca sucukları da meşhurdur.',
    'Evet, Kayseri\'nin yemek kültürü özellikle pastırma, mantarlı manti ve sucuk gibi lezzetleri ile ünlüdür.',
    'Fiyatlar genellikle ortalama seviyededir. Geleneksel pazarlarda yerel ürünleri uygun fiyatlarla bulabilirsiniz.',
    'İç Anadolu iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Kayseri, sanayi ve ticaret açısından gelişmiş bir şehirdir.'
  ],
  'Balıkesir': [
    'Balıkesir mutfağı, zeytinyağlı yemekleri ve simit köftesi gibi lezzetleri içerir. Ayrıca Ayvalık tostu da ünlüdür.',
    'Evet, Balıkesir\'in yemek kültürü özellikle zeytinyağlı yemekleri ve Ayvalık tostu gibi lezzetleri içerir.',
    'Fiyatlar genellikle diğer büyük şehirlere göre uygun seviyededir.',
    'Ege iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Balıkesir, doğal güzelliklere sahip bir şehirdir ve tarihî yerleri içerir.'
  ],
  'Gaziantep': [
    'Gaziantep mutfağı, baklavası ve kebapları ile ünlüdür. Antep fıstığı da mutfağın vazgeçilmezlerindendir.',
    'Evet, Gaziantep\'in yemek kültürü özellikle baklava ve kebapları ile Türkiye genelinde tanınmıştır.',
    'Fiyatlar genellikle ortalama seviyededir. Ancak geleneksel Antep mutfağındaki bazı mekanlarda fiyatlar biraz daha yüksek olabilir.',
    'Akdeniz iklimi etkisi altında olduğu için taze malzemeler genellikle bulunabilir.',
    'Gaziantep, tarihi ve kültürel zenginlikleri ile ünlüdür ve gastronomi turizmi için tercih edilen bir destinasyondur.'
  ],
  'Diyarbakır': [
    'Diyarbakır mutfağı, kuzu tandır ve ciğer kebabı gibi lezzetleri içerir. Ayrıca baklavası da meşhurdur.',
    'Evet, Diyarbakır\'ın yemek kültürü özellikle ciğer kebabı ve baklavası ile ünlüdür.',
    'Fiyatlar genellikle diğer büyük şehirlere göre uygun seviyededir.',
    'Sıcak yazları ve ılıman kışları ile iklimi, taze malzemelerin bulunabilirliğini olumlu etkiler.',
    'Tarihi ve kültürel zenginliklere sahiptir.'
    ],
    'Mersin': [
       'Deniz ürünleri ve tarihi kenti Tarsus ile meşhurdur.',
     'Evet, Mersin\'in yemek kültürü oldukça gelişmiştir. Özellikle Akdeniz mutfağına ait zengin çeşitliliği vardır.',
      'Genellikle diğer büyük şehirlere göre uygun fiyatlıdır.',
      'Akdeniz iklimi etkisi altındadır, yazları sıcak geçer.',
      'Tarihi ve doğal güzelliklere sahiptir.'
    ],
    'Kahramanmaraş': [
      'Dondurması ve baklavası ile meşhurdur.',
    'Evet, Kahramanmaraş\'ın yemek kültürü gelişmiştir. Özellikle dondurma ve baklava gibi tatlılarıyla ünlüdür.',
      'Akdeniz iklimi etkisi altındadır, yazları sıcak geçer.',
      'Tarihi ve kültürel açıdan zengin bir şehirdir.',
      'Sanayi ve tarım açısından önemlidir.'
    ],
    'Erzurum': [
      'Palandöken Dağı ve kayak turizmi ile meşhurdur.',
    'Evet, Erzurum\'un yemek kültürü zengin ve çeşitlidir. Özellikle kış aylarında sıcak içecekleri ve yöresel lezzetleri meşhurdur.',
      'Fiyatlar genellikle ortalama seviyededir.',
      'Karasal iklim etkisi altındadır, kışları soğuk ve kar yağışlı olabilir.',
      'Tarihi ve kültürel zenginliklere sahiptir.'
    ],
    'Adıyaman': [
         'Nemrut Dağı ve Kommagene Krallığı\'na ait eserleri ile meşhurdur.',
    'Evet, Adıyaman\'ın yemek kültürü gelişmiştir. Gastronomi turizmi için tercih edilen bir şehirdir.',
      
      'Evet Adıyamanda konaklama ulaşım uygundur.',
      'Akdeniz iklimi etkisi altındadır, yazları sıcak geçer.',
      'Gastronomi turizmi için tercih edilen bir şehirdir.'
    ],
    'Kocaeli': [
     'Sanayi ve ticaret açısından önemli bir şehirdir.',
    'Evet, Kocaeli\'nin yemek kültürü çeşitli kültürlerin etkisiyle zenginleşmiştir.',
      
      'Ticaret ve endüstri bölgelerine ev sahipliği yapar. Bu nedenle fiyat bakımından uygun bir şehirdir.',
      'Marmara iklimi etkisi altındadır, genellikle ılıman geçer.',
      'Tarihi ve kültürel zenginliklere sahip olduğundan gezilmeye değerdir.'
    ],
  };
 //Şehir Listesi
  static final List<String> city = [
  'İstanbul',
  'Ankara',
  'İzmir',
  'Antalya',
  'Bursa',
  'Trabzon',
  'Adana',
  'Konya',
  'Eskişehir',
  'Denizli',
  'Samsun',
  'Kayseri',
  'Balıkesir',
  'Gaziantep',
  'Diyarbakır',
  'Mersin',
  'Kahramanmaraş',
  'Erzurum',
  'Adıyaman',
  'Kocaeli',
  
];
static Map<String, List<String>> cityPopularPlaceText = {
    'İstanbul': [
      'Galata Kulesi',
      'Topkapı Sarayı',
      'Yerebatan Sarnıcı',
      'Ayasofya Cami'
    ],
    'Ankara': [
      'Anıtkabir',
      'Kocatepe Camii',
      'Atatürk Orman Çiftliği',
      'Ankara Kalesi'
    ],
    'İzmir': [
      'Saat Kulesi',
      'Kadifekale',
      'Alsancak',
      'Kemeraltı Çarşısı'
    ],
    'Antalya': [
      'Kaleiçi',
      'Düden Şelalesi',
      'Antalya Müzesi',
      'Konyaaltı Plajı'
    ],
    'Bursa': [
      'Uludağ',
      'Bursa Ulu Camii',
      'Yeşil Türbe',
      'Tophane Saat Kulesi'
    ],
    'Trabzon': [
      'Hagia Sophia Museum',
      'Trabzon Castle',
      'Uzungöl',
      'Atatürk Köşkü'
    ],
    'Adana': [
      'Seyhan Barajı',
      'Stone Bridge',
      'Adana Merkez Park',
      'Atatürk Parkı'
    ],
    'Konya': [
      'Mevlana Müzesi',
      'Konya Karatay Medresesi',
      'Aziziye Camii',
      'Alaeddin Hill'
    ],
    'Eskişehir': [
      'Sazova Park',
      'Eskişehir Bilim, Sanat ve Kültür Parkı',
      'Odunpazarı Evleri',
      'Kent Park'
    ],
    'Denizli': [
      'Pamukkale',
      'Hierapolis Antik Kenti',
      'Denizli Teleferik',
      'Denizli Çamlık Parkı'
    ],
    'Samsun': [
      'Amazon Köyü',
      'Bandırma Vapuru Müzesi',
      'Atatürk Parkı',
      'Samsun Sahili'
    ],
    'Kayseri': [
      'Kayseri Kalesi',
      'Hunat Hatun Camii',
      'Cumhuriyet Meydanı',
      'Kültür Park'
    ],
    'Balıkesir': [
      'Cunda Adası',
      'Ayvalık',
      'Bandırma',
      'Troya Antik Kenti'
    ],
    'Gaziantep': [
      'Gaziantep Kalesi',
      'Zeugma Mozaik Müzesi',
      'Gaziantep Hayvanat Bahçesi',
      'Tahtani Camii'
    ],
    'Diyarbakır': [
      'Diyarbakır Surları',
      'Dört Ayaklı Minare',
      'Hevsel Bahçeleri',
      'On Gözlü Köprü'
    ],
    'Mersin': [
      'Mersin Marina',
      'Tarsus Ulu Camii',
      'Silifke Kalesi',
      'Kleopatra Kapısı'
    ],
    'Kahramanmaraş': [
      'Kahramanmaraş Kalesi',
      'Yedi Uyurlar Mağarası',
      'Varda Köprüsü',
      'Maraş Caddesi'
    ],
    'Erzurum': [
      'Erzurum Kalesi',
      'Çifte Minareli Medrese',
      'Palandöken Dağı',
      'Atatürk Üniversitesi Botanik Bahçesi'
    ],
    'Adıyaman': [
      'Nemrut Dağı',
      'Cendere Köprüsü',
      'Perre Antik Kenti',
      'Adıyaman Müzesi'
    ],
    'Kocaeli': [
      'İzmit Saat Kulesi',
      'Seka Park',
      'Gebze Center Alışveriş Merkezi',
      'İzmit Bilim ve Teknoloji Merkezi'
    ],
    // Eksik şehirlerin ve gezilecek yerlerin listesi buraya eklenecek
  };
  static Map<String, List<Map<String, String>>> cityPopularPlacesAboutText = {
   'İstanbul': [
    {'Galata Kulesi': 'Galata Kulesi, İstanbul\'un sembol yapılarından biridir. 14. yüzyılda inşa edilmiştir ve muhteşem manzarasıyla ziyaretçilerine unutulmaz bir deneyim sunar.'},
    {'Topkapı Sarayı': 'Osmanlı İmparatorluğu\'nun bir dönem başkenti olan İstanbul\'da bulunan tarihi bir saraydır. 15. yüzyılda Sultan Mehmed tarafından inşa edilmiştir ve uzun yıllar Osmanlı padişahlarının ikametgahı olmuştur. Saray, zengin tarihî ve sanatsal eserleriyle ziyaretçilerini büyüler.'},
    {'Yerebatan Sarnıcı': 'Yerebatan Sarnıcı, İstanbul\'un tarihi yarımadasında bulunan ve Bizans döneminden kalma büyük bir su sarnıcıdır. 6. yüzyılda inşa edilmiş olan bu sarnıç, yüzlerce sütun ve göz alıcı bir atmosfere sahiptir. Ziyaretçiler, sarnıcın içindeki suyun altında dolaşabilir ve tarihi atmosferiyle büyülenir.'},
    {'Ayasofya Cami': 'Ayasofya Camii, İstanbul\'un tarihi yarımadasında yer alan ve binlerce yıllık tarihi ile dünya çapında ünlü bir yapıdır. İlk olarak Bizans İmparatoru Justinianus tarafından 6. yüzyılda kilise olarak inşa edilmiştir. Daha sonra Osmanlı döneminde camiye dönüştürülmüştür. Ayasofya, mimarisi, mozaikleri ve tarihi atmosferiyle ziyaretçilerini etkileyen bir yapıdır.'},

  ],
  'Ankara': [
    {'Anıtkabir': 'Anıtkabir, Türkiye Cumhuriyeti\'nin kurucusu Mustafa Kemal Atatürk\'ün anıt mezarının bulunduğu bir anıt alanıdır. Ankara\'nın Çankaya ilçesinde yer alan bu alan, Türk milletinin bağımsızlık ve özgürlük mücadelesini simgeler. Anıtkabir, büyük bir anıt heykel, mozole ve müzeden oluşur.'},
    {'Kocatepe Camii': 'Kocatepe Camii, Ankara\'nın simgesi haline gelmiş büyük bir camidir. 1987 yılında tamamlanan bu cami, Türkiye\'nin en büyük camilerinden biridir. Modern mimarisi ve muhteşem iç dekorasyonuyla ziyaretçilerini etkiler.'},
    {'Atatürk Orman Çiftliği': 'Atatürk Orman Çiftliği, Ankara\'nın doğal güzelliklerinden biridir. Mustafa Kemal Atatürk tarafından kurulan bu çiftlik, şehrin merkezine yakın bir konumdadır. Burada doğa yürüyüşleri yapabilir, hayvanları görebilir ve tarihi çiftlik evlerini ziyaret edebilirsiniz.'},
    {'Ankara Kalesi': 'Ankara Kalesi, şehrin merkezinde yükselen tarihi bir kaledir. İlk olarak Roma döneminde inşa edilen bu kale, birçok medeniyetin izlerini taşır. Kaleye çıkarak şehrin panoramik manzarasını seyredebilir ve tarihi yapıları keşfedebilirsiniz.'}
  ],
  'İzmir': [
    {'Saat Kulesi': 'İzmir Saat Kulesi, İzmir\'in simgelerinden biridir. 1901 yılında inşa edilen bu saat kulesi, şehrin merkezindeki Konak Meydanı\'nda yer alır. Ziyaretçiler, kuleye çıkarak şehrin panoramik manzarasını görebilirler.'},
    {'Kadifekale': 'Kadifekale, İzmir\'in tarihî bir kalesidir. Antik dönemlerden beri kullanılan bu kale, şehrin panoramik manzarasına hakim bir konumda bulunur. Ziyaretçiler, kaleyi ziyaret ederek şehrin tarihî dokusunu keşfedebilirler.'},
    {'Alsancak': 'Alsancak, İzmir\'in en popüler semtlerinden biridir. Sahil boyunca uzanan bu semtte birçok restoran, kafe ve mağaza bulunur. Ziyaretçiler, Alsancak\'ta yürüyüş yapabilir, alışveriş yapabilir ve şehrin enerjisini hissedebilirler.'},
    {'Kemeraltı Çarşısı': 'Kemeraltı Çarşısı, İzmir\'in tarihî bir çarşısıdır. Daracık sokakları ve tarihî dokusuyla ünlüdür. Çarşıda geleneksel el sanatları ürünleri, hediyelik eşyalar ve yöresel lezzetler bulabilirsiniz.'}
  ],
   'Antalya': [
    {'Kaleiçi': 'Antalya\'nın tarihi merkezi olan Kaleiçi, daracık sokakları ve tarihi yapılarıyla ünlüdür. Burada gezerek Osmanlı dönemi eserlerini ve harika manzaraları keşfedebilirsiniz.'},
    {'Düden Şelalesi': 'Düden Şelalesi, Antalyanın doğal güzelliklerinden biridir. Şehrin merkezine yakın bir konumda bulunan bu şelale, muhteşem bir doğa harikasıdır. Ziyaretçiler, şelalenin altında yürüyüş yapabilir ve serin sularında yüzebilirler.'},
    {'Antalya Müzesi': 'Antalya Müzesi, şehrin tarihî ve arkeolojik mirasını sergileyen önemli bir müzedir. Burada Likya, Pamphylia ve diğer antik bölgelere ait eserleri görebilir ve Antalyanın zengin tarihini keşfedebilirsiniz.'},
    {'Konyaaltı Plajı': 'Konyaaltı Plajı, Antalyanın popüler plajlarından biridir. Uzun kumsalı ve temiz denizi ile bilinir. Plajda güneşlenerek ve denizde yüzerek keyifli vakit geçirebilirsiniz.'}
  ],
  'Bursa': [
    {'Uludağ': 'Uludağ, Bursanın simgelerinden biridir. Türkiyenin önemli kayak merkezlerinden biri olan bu dağ, aynı zamanda doğal güzellikleri ve yayla turizmiyle de ünlüdür. Ziyaretçiler, kışın kayak yapabilir ve yazın doğanın tadını çıkarabilirler.'},
    {'Bursa Ulu Camii': 'Bursa Ulu Camii, Osmanlı dönemi mimarisinin önemli bir örneğidir. 14. yüzyılda inşa edilmiş olan bu cami, büyük kubbesi ve süslemeleriyle dikkat çeker. Ziyaretçiler, camiyi ziyaret ederek Osmanlı mimarisini yakından görebilirler.'},
    {'Yeşil Türbe': 'Yeşil Türbe, Bursada bulunan Osmanlı dönemi türbelerinden biridir. Yeşil renkteki çinileriyle ünlü olan bu türbe, Osmanlı padişahı Çelebi Mehmedin türbesidir. Ziyaretçiler, türbeyi ziyaret ederek Osmanlı tarihine bir yolculuk yapabilirler.'},
    {'Tophane Saat Kulesi': 'Tophane Saat Kulesi, Bursanın sembollerinden biridir. Şehrin tarihî Tophane semtinde yer alan bu saat kulesi, 19. yüzyılda yapılmıştır. Ziyaretçiler, kuleye çıkarak şehrin panoramik manzarasını görebilirler.'}
  ],
  'Trabzon': [
    {'Hagia Sophia Museum': 'Hagia Sophia Museum, Trabzon\'un tarihi yapılarından biridir. 13. yüzyılda inşa edilmiş olan bu kilise, Bizans döneminden kalma önemli bir eserdir. Ziyaretçiler, kilisenin tarihî atmosferini ve mozaiklerini görebilirler.'},
    {'Trabzon Castle': 'Trabzon Kalesi, şehrin simgelerinden biridir. Doğu Roma İmparatorluğu döneminde inşa edilen bu kale, şehrin tarihî savunma sisteminin bir parçasıdır. Ziyaretçiler, kaleyi ziyaret ederek tarihî bir yolculuğa çıkabilirler.'},
    {'Uzungöl': 'Uzungöl, Trabzon\'un doğal güzelliklerinden biridir. Karadeniz\'in muhteşem manzarası eşliğinde yer alan bu göl, yılın her mevsimi ziyaretçilerine harika bir deneyim sunar. Ziyaretçiler, göl çevresinde yürüyüş yapabilir ve temiz havanın tadını çıkarabilirler.'},
    {'Atatürk Köşkü': 'Atatürk Köşkü, Trabzon\'un önemli tarihî yapılarından biridir. Mustafa Kemal Atatürk\'ün 1924 yılında kaldığı bu köşk, bugün müze olarak hizmet vermektedir. Ziyaretçiler, köşkü ziyaret ederek Atatürk\'ün yaşamına ve dönemine ait eşyaları görebilirler.'}
  ],
  'Adana': [
    {'Seyhan Barajı': 'Seyhan Barajı, Adana\'nın önemli yapılarından biridir. Seyhan Nehri üzerine inşa edilmiş olan bu baraj, şehrin su ihtiyacını karşılar ve elektrik üretiminde kullanılır. Ziyaretçiler, barajın çevresinde yürüyüş yapabilir ve manzarayı izleyebilirler.'},
    {'Stone Bridge': 'Stone Bridge, Adana\'nın tarihî yapılarından biridir. Seyhan Nehri üzerine kurulmuş olan bu köprü, Roma döneminden kalma bir eserdir. Ziyaretçiler, köprüyü ziyaret ederek tarihî atmosferi ve mimariyi görebilirler.'},
    {'Adana Merkez Park': 'Adana Merkez Park, şehrin merkezinde bulunan büyük bir parktır. Yeşil alanları, çeşmeleri ve aktivite alanlarıyla ziyaretçilere dinlenme ve eğlence imkanı sunar. Ziyaretçiler, parkta piknik yapabilir ve doğa ile iç içe vakit geçirebilirler.'},
    {'Atatürk Parkı': 'Atatürk Parkı, Adana\'nın önemli parklarından biridir. Şehrin merkezinde yer alan bu park, Mustafa Kemal Atatürk\'ün adını taşır. Ziyaretçiler, parkta yürüyüş yapabilir, dinlenebilir ve çocuk oyun alanlarında vakit geçirebilirler.'}
  ],
 'Konya': [
    {'Mevlana Müzesi': 'Mevlana Müzesi, Konya\'nın simgelerinden biridir. 13. yüzyılda yaşamış olan Mevlana Celaleddin Rumi\'nin türbesi olan bu müze, her yıl binlerce ziyaretçi çeker. Ziyaretçiler, müzede Mevlana\'nın yaşamına ve felsefesine ait eserleri görebilirler.'},
    {'Konya Karatay Medresesi': 'Konya Karatay Medresesi, Selçuklu döneminden kalma tarihî bir yapıdır. Günümüzde müze olarak kullanılan bu medrese, Selçuklu sanatının önemli eserlerini barındırır. Ziyaretçiler, medreseyi ziyaret ederek tarihî atmosferi ve eserleri görebilirler.'},
    {'Aziziye Camii': 'Aziziye Camii, Konya\'nın önemli camilerinden biridir. 19. yüzyılda inşa edilmiş olan bu cami, Osmanlı dönemi mimarisinin önemli bir örneğidir. Ziyaretçiler, camiyi ziyaret ederek iç dekorasyonunu ve mimarisini görebilirler.'},
    {'Alaeddin Hill': 'Alaeddin Hill, Konya\'nın tarihî alanlarından biridir. Şehrin merkezinde yer alan bu tepe, tarihî kalıntılar ve yeşil alanlarla doludur. Ziyaretçiler, tepede yürüyüş yapabilir ve Konya\'nın panoramik manzarasını izleyebilirler.'}
  ],
  'Eskişehir': [
    {'Sazova Park': 'Sazova Parkı, Eskişehir\'in en popüler parklarından biridir. Büyük bir gölet, çocuk oyun alanları, lunapark ve yürüyüş yollarıyla ziyaretçilere geniş bir alan sunar. Ziyaretçiler, parkta dinlenebilir ve eğlenceli aktiviteler yapabilirler.'},
    {'Eskişehir Bilim, Sanat ve Kültür Parkı': 'Eskişehir Bilim, Sanat ve Kültür Parkı, şehrin önemli turistik alanlarından biridir. Bilim ve sanat etkinlikleri, sergi alanları ve açık hava etkinlikleriyle ziyaretçilere eğlenceli bir deneyim sunar.'},
    {'Odunpazarı Evleri': 'Odunpazarı Evleri, Eskişehir\'in tarihî dokusunu yansıtan önemli bir alanıdır. Osmanlı döneminden kalma bu tarihî evler, renkli boyaları ve ahşap detaylarıyla ünlüdür. Ziyaretçiler, evleri ziyaret ederek şehrin tarihini ve mimarisini keşfedebilirler.'},
    {'Kent Park': 'Kent Park, Eskişehir\'in merkezinde yer alan büyük bir parktır. Yeşil alanları, göleti, çocuk oyun alanları ve spor alanlarıyla ziyaretçilere çeşitli aktiviteler sunar. Ziyaretçiler, parkta piknik yapabilir ve doğayla iç içe vakit geçirebilirler.'}
  ],
  'Denizli': [
    {'Pamukkale': 'Pamukkale, Denizli\'nin en ünlü doğal güzelliklerinden biridir. Travertenler ve termal su kaynakları ile ünlü olan bu bölge, yılın her dönemi ziyaretçilerini çeker. Ziyaretçiler, Pamukkale\'de yürüyüş yapabilir ve antik havuzlarda yüzebilirler.'},
    {'Hierapolis Antik Kenti': 'Hierapolis Antik Kenti, Pamukkale\'nin yanında yer alan tarihî bir antik kenttir. Roma döneminden kalma bu kent, antik tiyatrosu, hamamları ve sütunlarıyla ünlüdür. Ziyaretçiler, antik kenti ziyaret ederek tarihî atmosferi ve kalıntıları görebilirler.'},
    {'Denizli Teleferik': 'Denizli Teleferik, şehrin doğal güzelliklerini keşfetmek için harika bir seçenektir. Yüksek dağlara çıkarak muhteşem manzaraları izleyebilir ve doğa yürüyüşleri yapabilirsiniz.'},
    {'Denizli Çamlık Parkı': 'Denizli Çamlık Parkı, şehrin merkezine yakın bir konumda bulunan büyük bir parktır. Doğal güzellikleri, yürüyüş yolları ve çocuk oyun alanlarıyla ziyaretçilere keyifli bir zaman geçirme imkanı sunar.'}
  ],
  'Samsun': [
    {'Amazon Köyü': 'Amazon Köyü, Samsun\'un önemli turistik yerlerinden biridir. Amasyanın Göynücek ilçesinde yer alan bu köy, Amazons efsanesiyle ilgili birçok hikayeye ev sahipliği yapmaktadır. Ziyaretçiler, köydeki tarihî yapıları ve doğal güzellikleri keşfedebilirler.'},
    {'Bandırma Vapuru Müzesi': "Bandırma Vapuru Müzesi, Samsunun önemli tarihî yapılarından biridir. Türkiyenin Kurtuluş Savaşının simgelerinden biri olan Bandırma Vapuru, müze olarak ziyaretçilere açılmıştır. Ziyaretçiler, vapuru ziyaret ederek Kurtuluş Savaşı dönemine ait eserleri görebilirler."},
    {'Atatürk Parkı': 'Atatürk Parkı, Samsun\'un merkezinde yer alan büyük bir parktır. Mustafa Kemal Atatürk\'ün Samsun\'a çıkışını simgeleyen bu park, yeşil alanları ve çeşitli aktivite alanlarıyla ziyaretçilere keyifli bir zaman geçirme imkanı sunar.'},
    {'Samsun Sahili': 'Samsun Sahili, şehrin en popüler turistik alanlarından biridir. Uzun kumsalı ve temiz denizi ile bilinir. Sahilde yürüyüş yapabilir, deniz kenarındaki kafelerde dinlenebilir ve şehrin güzelliklerinin keyfini çıkarabilirsiniz.'}
  ],
  'Kayseri': [
    {'Kayseri Kalesi': 'Kayseri Kalesi, şehrin tarihî sembollerinden biridir. Roma döneminden kalma bu kale, şehrin merkezinde yükselen bir kaledir. Ziyaretçiler, kaleye çıkarak şehrin panoramik manzarasını görebilirler.'},
    {'Hunat Hatun Camii': 'Hunat Hatun Camii, Kayseri\'nin önemli tarihî yapılarından biridir. Selçuklu döneminden kalma bu cami, mimarisi ve süslemeleriyle dikkat çeker. Ziyaretçiler, camiyi ziyaret ederek tarihî atmosferi ve mimariyi görebilirler.'},
    {'Cumhuriyet Meydanı': 'Cumhuriyet Meydanı, Kayseri\'nin merkezinde yer alan büyük bir meydandır. Tarihi yapılar, alışveriş merkezleri ve kafelerle doludur. Ziyaretçiler, meydanı ziyaret ederek şehrin kalbindeki yaşamı görebilirler.'},
    {'Kültür Park': 'Kültür Park, Kayseri\'nin en popüler parklarından biridir. Büyük bir yeşil alanı, çocuk oyun alanları ve etkinlik alanlarıyla ziyaretçilere keyifli bir zaman geçirme imkanı sunar. Ziyaretçiler, parkta piknik yapabilir ve doğayla iç içe vakit geçirebilirler.'}
  ],
  'Balıkesir': [
    {'Cunda Adası': 'Cunda Adası, Ege Denizi\'nde bulunan bir ada olup, Balıkesir\'in Ayvalık ilçesine bağlıdır. Tarihi evleri, dar sokakları ve deniz manzarasıyla ünlüdür. Ziyaretçiler, adada yürüyüş yapabilir, tarihi kiliseleri ve kafeleri ziyaret edebilirler.'},
    {'Ayvalık': 'Ayvalık, Balıkesir\'in önemli turistik merkezlerinden biridir. Ege Denizi kıyısında yer alan bu şirin ilçe, taş evleri ve zeytin ağaçlarıyla ünlüdür. Ziyaretçiler, Ayvalık\'ta denize girebilir, lezzetli balık yemekleri tadabilir ve tarihi sokaklarda gezinebilirler.'},
    {'Bandırma': 'Bandırma, Balıkesir\'in önemli liman kentlerinden biridir. Marmara Denizi kıyısında yer alan bu şehir, tarihi yapıları ve limanıyla dikkat çeker. Ziyaretçiler, Bandırma\'da limanı ziyaret edebilir, deniz ürünleri restoranlarında yemek yiyebilir ve şehrin tarihini keşfedebilirler.'},
    {'Troya Antik Kenti': 'Troya Antik Kenti, Balıkesir\'in Çanakkale ilçesine bağlıdır. UNESCO Dünya Mirası Listesi\'nde yer alan bu antik kent, Homeros\'un destanlarından biri olan İlyada\'ya konu olmuştur. Ziyaretçiler, antik kenti ziyaret ederek tarihî kalıntıları ve mitolojik mirası görebilirler.'}
  ],
  'Gaziantep': [
    {'Gaziantep Kalesi': 'Gaziantep Kalesi, şehrin tarihî sembollerinden biridir. Hititler döneminden kalma bu kale, şehrin merkezinde yükselen bir kaledir. Ziyaretçiler, kaleye çıkarak şehrin panoramik manzarasını görebilirler.'},
    {'Zeugma Mozaik Müzesi': 'Zeugma Mozaik Müzesi, Gaziantep\'in önemli müzelerinden biridir. Roma döneminden kalma bu mozaikler, müzenin ana koleksiyonunu oluşturur. Ziyaretçiler, müzeyi ziyaret ederek antik mozaikleri ve tarihî eserleri görebilirler.'},
    {'Gaziantep Hayvanat Bahçesi': 'Gaziantep Hayvanat Bahçesi, şehrin önemli eğlence ve öğrenme merkezlerinden biridir. Geniş bir alanı kaplayan bu hayvanat bahçesi, birçok farklı hayvan türünü barındırır. Ziyaretçiler, hayvanları gözlemleyebilir ve doğa ile iç içe vakit geçirebilirler.'},
    {'Tahtani Camii': 'Tahtani Camii, Gaziantep\'in tarihî camilerinden biridir. Osmanlı döneminden kalma bu cami, şehrin tarihî dokusunu yansıtan önemli bir yapıdır. Ziyaretçiler, camiyi ziyaret ederek iç dekorasyonunu ve mimariyi görebilirler.'}
  ],
  'Diyarbakır': [
    {'Diyarbakır Surları': 'Diyarbakır Surları, şehrin tarihî sembollerinden biridir. Tarihi MÖ 4. yüzyıla kadar uzanan bu surlar, şehrin etrafını çevirir. Ziyaretçiler, surları ziyaret ederek şehrin tarihî savunma sistemini ve panoramik manzarasını görebilirler.'},
    {'Dört Ayaklı Minare': 'Dört Ayaklı Minare, Diyarbakır\'ın önemli tarihî yapılarından biridir. Selçuklu döneminden kalma bu minare, dört ayağı ile dikkat çeker. Ziyaretçiler, minareyi ziyaret ederek tarihî atmosferi ve mimariyi görebilirler.'},
    {'Hevsel Bahçeleri': 'Hevsel Bahçeleri, Diyarbakır\'ın tarihî ve doğal alanlarından biridir. Dicle Nehri kıyısında yer alan bu bahçeler, tarım alanları ve yeşil alanlarla doludur. Ziyaretçiler, bahçelerde yürüyüş yapabilir ve doğanın tadını çıkarabilirler.'},
    {'On Gözlü Köprü': 'On Gözlü Köprü, Diyarbakır\'ın tarihî yapılarından biridir. 11. yüzyılda inşa edilmiş olan bu köprü, Dicle Nehri üzerinde yer alır. Ziyaretçiler, köprüyü ziyaret ederek tarihî atmosferi ve mimariyi görebilirler.'}
  ],
   'Mersin': [
    {'Mersin Marina': 'Mersin Marina, şehrin liman bölgesinde yer alan modern bir marina kompleksidir. Yatlar, restoranlar, kafeler ve alışveriş merkezleriyle doludur. Ziyaretçiler, marina çevresinde yürüyüş yapabilir ve deniz manzarasının keyfini çıkarabilirler.'},
    {'Tarsus Ulu Camii': 'Tarsus Ulu Camii, Mersin\'in tarihî camilerinden biridir. Emevi döneminden kalma bu cami, şehrin tarihî dokusunu yansıtan önemli bir yapıdır. Ziyaretçiler, camiyi ziyaret ederek iç dekorasyonunu ve mimariyi görebilirler.'},
    {'Silifke Kalesi': 'Silifke Kalesi, Mersin\'in tarihî sembollerinden biridir. Roma döneminden kalma bu kale, şehrin tarihî savunma sistemini yansıtır. Ziyaretçiler, kaleyi ziyaret ederek tarihî atmosferi ve panoramik manzarayı görebilirler.'},
    {'Kleopatra Kapısı': 'Kleopatra Kapısı, Tarsus\'ta bulunan tarihî bir yapıdır. Mısır Kraliçesi Kleopatra\'nın şehre giriş yaptığına inanılan bu kapı, Roma döneminden kalma bir anıttır. Ziyaretçiler, kapıyı ziyaret ederek antik şehrin izlerini görebilirler.'}
  ],
  'Kahramanmaraş': [
    {'Kahramanmaraş Kalesi': 'Kahramanmaraş Kalesi, şehrin tarihî sembollerinden biridir. Hititler döneminden kalma bu kale, şehrin merkezinde yükselen bir kaledir. Ziyaretçiler, kaleye çıkarak şehrin panoramik manzarasını görebilirler.'},
    {'Yedi Uyurlar Mağarası': 'Yedi Uyurlar Mağarası, Kahramanmaraş\'ın önemli doğal güzelliklerinden biridir. Tarihî ve mitolojik öneme sahip bu mağara, ziyaretçilere eşsiz bir doğa harikası deneyimi sunar. Ziyaretçiler, mağarayı ziyaret ederek efsaneleri ve doğal oluşumları görebilirler.'},
    {'Varda Köprüsü': 'Varda Köprüsü, Kahramanmaraş\'ın tarihî yapılarından biridir. Roma döneminden kalma bu köprü, Ceyhan Nehri üzerinde yer alır. Ziyaretçiler, köprüyü ziyaret ederek tarihî atmosferi ve mimariyi görebilirler.'},
    {'Maraş Caddesi': 'Maraş Caddesi, şehrin merkezinde yer alan tarihî bir cadde ve alışveriş bölgesidir. Mağazalar, kafeler ve restoranlarla dolu olan bu cadde, ziyaretçilere alışveriş ve şehir hayatının keyfini çıkarma imkanı sunar.'}
  ],
  'Erzurum': [
    {'Erzurum Kalesi': 'Erzurum Kalesi, şehrin tarihî sembollerinden biridir. Bizans döneminden kalma bu kale, şehrin merkezinde yükselen bir kaledir. Ziyaretçiler, kaleye çıkarak şehrin panoramik manzarasını görebilirler.'},
    {'Çifte Minareli Medrese': 'Çifte Minareli Medrese, Erzurum\'un önemli tarihî yapılarından biridir. Selçuklu döneminden kalma bu medrese, mimarisi ve süslemeleriyle dikkat çeker. Ziyaretçiler, medreseyi ziyaret ederek tarihî atmosferi ve mimariyi görebilirler.'},
    {'Palandöken Dağı': 'Palandöken Dağı, Erzurum\'un önemli kayak merkezlerinden biridir. Türkiye\'nin en yüksek dağlarından biri olan Palandöken, kış sporları için ideal bir destinasyondur. Ziyaretçiler, dağda kayak yapabilir ve doğal güzelliklerin tadını çıkarabilirler.'},
    {'Atatürk Üniversitesi Botanik Bahçesi': 'Atatürk Üniversitesi Botanik Bahçesi, şehrin önemli doğal alanlarından biridir. Geniş bir alana yayılan bu botanik bahçe, birçok farklı bitki türünü barındırır. Ziyaretçiler, bahçede yürüyüş yapabilir ve doğanın tadını çıkarabilirler.'}
  ],
  'Adıyaman': [
    {'Nemrut Dağı': 'Nemrut Dağı, Adıyaman\'ın önemli turistik yerlerinden biridir. UNESCO Dünya Mirası Listesi\'nde yer alan bu antik mezar kompleksi, Kommagene Krallığı dönemine aittir. Ziyaretçiler, dağın zirvesine tırmanarak antik heykelleri ve güneş doğuşunu izleyebilirler.'},
    {'Cendere Köprüsü': 'Cendere Köprüsü, Adıyaman\'ın önemli tarihî yapılarından biridir. Roma döneminden kalma bu köprü, Kahta Çayı üzerinde yer alır. Ziyaretçiler, köprüyü ziyaret ederek tarihî atmosferi ve mimariyi görebilirler.'},
    {'Perre Antik Kenti': 'Perre Antik Kenti, Adıyaman\'ın tarihî ve arkeolojik zenginliklerinden biridir. Kommagene Krallığı dönemine ait olan bu antik kent, ziyaretçilere tarihî ve mitolojik bir yolculuk sunar. Ziyaretçiler, antik kenti ziyaret ederek kalıntıları ve tarihî eserleri görebilirler.'},
    {'Adıyaman Müzesi': 'Adıyaman Müzesi, şehrin kültürel mirasını sergileyen önemli bir müzedir. Arkeolojik eserler, etnografik objeler ve tarihî belgeleri içeren bu müze, ziyaretçilere bilgi ve görsel bir şölen sunar.'}
  ],
   'Kocaeli': [
    {'İzmit Saat Kulesi': 'İzmit Saat Kulesi, şehrin sembollerinden biridir. 1901 yılında inşa edilen bu kule, Osmanlı dönemi mimarisinin önemli bir örneğidir. Ziyaretçiler, kuleyi ziyaret ederek şehrin panoramik manzarasını görebilirler.'},
    {'Seka Park': 'Seka Park, Kocaeli\'nin popüler rekreasyon alanlarından biridir. Geniş yeşil alanları, göletleri ve aktivite alanlarıyla ziyaretçilere keyifli bir zaman geçirme imkanı sunar. Ziyaretçiler, parkta piknik yapabilir ve doğal güzelliklerin tadını çıkarabilirler.'},
    {'Gebze Center Alışveriş Merkezi': 'Gebze Center Alışveriş Merkezi, şehrin önemli alışveriş merkezlerinden biridir. Mağazalar, restoranlar ve eğlence alanlarıyla doludur. Ziyaretçiler, alışveriş yapabilir, yeme içme mekanlarında vakit geçirebilir ve eğlenceli aktiviteler yapabilirler.'},
    {'İzmit Bilim ve Teknoloji Merkezi': 'İzmit Bilim ve Teknoloji Merkezi, şehrin önemli eğitim ve eğlence merkezlerinden biridir. Interaktif sergiler, deney atölyeleri ve bilimsel etkinliklerle dolu olan bu merkez, ziyaretçilere eğlenceli ve öğretici bir deneyim sunar.'}
  ],
  // Diğer şehirler ve turistik yerler buraya eklenecek
};


  //Turistik yer resimleri
  static Map<String, List<String>> cityPopularPlacesImg_url = {
   'İstanbul': [
    'https://istanbul-tourist-information.com/tr/wp-content/uploads/2022/02/Things-to-do-at-Galata-Tower.jpg',
    'https://media.timeout.com/images/103729924/750/422/image.jpg',
    'https://kultur.istanbul/gorsel/2022/04/yerebatan-sarnici-acilis.jpg',
    'https://image.cnnturk.com/i/cnnturk/75/740x416/60ca0cc7d265a21d34c0e6cf.jpg',
    
  ],
  'Ankara': [
    'https://www.grandalfatravel.com/wp-content/uploads/2023/10/anitkabir-mausoleum-mustafa-kemal-ataturk-ankara-1-scaled.jpg',
     'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/ANKARA_KOCATEPE_CAM%C4%B0%C4%B0.jpg/800px-ANKARA_KOCATEPE_CAM%C4%B0%C4%B0.jpg',
    'https://www.kulturportali.gov.tr/repoKulturPortali/large/27082014/03f8c7e3-6f07-44f2-b387-98bf863007b4.JPG?format=jpg&quality=50',
    'https://trthaberstatic.cdn.wp.trt.com.tr/resimler/2078000/ankara-kalesi-2079071.jpg'
  ],
  'İzmir': [
    'https://www.viago.com.tr/dosya/2928/blog/1-1-izmir-saat-kulesi_254.jpeg',
    'https://www.kulturportali.gov.tr/repoKulturPortali/large/SehirRehberi//GezilecekYer/20171031105000836_Kadifekale,%20I.Hasan%20Bodur.jpg?format=jpg&quality=50',
    'https://cdn.yerelrehber.com/uploads/2023/63ba61581a816_1673159000.jpeg',
     'https://i.neredekal.com/i/neredekal/75/585x300/607f5528944bbf46d1dd43f2'
  ],
   'Antalya': [
    'https://travelinglensphotography.com/wp-content/uploads/2018/08/Kaleici.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdi8Vsu3tfQWpD0IIdBq1rTb74dmpbRyrRb_KlsDV54Q&s',
    'https://www.kulturportali.gov.tr/contents/images/%C4%B0mparator%20%C4%B0mparatori%C3%A7eler%20salonu.jpg',
     'https://www.kulturportali.gov.tr/repoKulturPortali/large/08032013/a97e091a-08f7-4325-a766-13d0e0d4c0ca.JPG?format=jpg&quality=50'
  ],
  'Bursa': [
    'https://cdn1.ntv.com.tr/gorsel/BvPDTf5jD0SCLq-VPx2Zsg.jpg?width=952&height=540&mode=both&scale=both',
    'https://www.kulturportali.gov.tr/contents/images/Bursa%20Ulu%20Camii%20Murat%20%C3%96CAL%20(24).JPG',
    'https://rehbername.com/UserFiles/Image/images/ekim2020/Ye%C5%9Fil%20T%C3%BCrbe/Ye%C5%9Fil%20T%C3%BCrbe%20D%C4%B1%C5%9Ftan.jpg',
    'https://www.gotobursa.com.tr/uploads/2021/09/saat-kulesi_large_large.jpg'
  ],
  'Trabzon': [
    'https://image.wmsm.co/6569c247cc423/og-image.webp?quality=80&width=1200&height=630&aspect_ratio=1200%3A630',
    'https://imturkey.com/userfiles/images/trabzon-kalesi/trabzon-castle.jpg',
    'https://www.eycetours.com/wp-content/uploads/2020/08/gunubirlik-uzungol-turu.jpg',
    'https://static.daktilo.com/sites/1262/uploads/2023/11/20/large/trabzonda-ataturk-koskunun-giris-ucreti-tartisma-konusu-oldu-1700481410.jpg'
  ],
  'Adana': [
    'https://trthaberstatic.cdn.wp.trt.com.tr/resimler/1834000/adana-seyhan-baraj-golu-iha-1834816.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/c2/Stone_Bridge_%28Adana%29.jpg',
    'https://www.adanadacocukolmak.com/wp-content/uploads/2017/03/merkezpark-500x300.jpg',
    'https://i.ytimg.com/vi/Gs-J_7EGE7k/maxresdefault.jpg'
  ],
 'Konya': [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnqteZAsRb8MModCRSzfkOaSSVUJaOojn-1PtQME2GWQ&s',
  'https://www.ikolsoftware.com/public/resized/high/image_data/original/570572df50d16d10a291454551d3e9b155b7ce4c/590b8baf656b3.jpg',
    'https://www.yeniasya.com.tr/Sites/YeniAsya/Upload/images/Content/2018/12/01/aziziye111111.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg60fLrLk31-pUwTieBQgs3ARN9s8D5w1riMSJiLv0Og&s'
  ],
  'Eskişehir': [
    'https://www.anadolugazetesi.com/resimler/id1/sazova-parki-eskisehir--nerede--adresi--telefonu--104320.jpg',
    'https://gezipgordum.com/wp-content/uploads/2020/03/sazova-parki-gezilecek-yerler.jpg',
   'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/45/85/15/fotograf-bana-aile-olmasa.jpg?w=1200&h=-1&s=1',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbXiVbumVoxwmb-dAPCTTqDKOUD6npM74vW2QyefRDSQ&s'
  ],
  'Denizli': [
   'https://www.kulturportali.gov.tr/contents/images/20181218112945723_20170505152407842_360_20170309100951302.jpg',
   'https://www.kulturportali.gov.tr/contents/images/20181218112846631_20171004140610117_DENIZLI%20KULTUR%20VARLIKLARI%20VE%20MUZELER%20GN_MD_%20(38).jpg',
    'https://www.denizliteleferik.com.tr/timthumb.php?src=images/yuklenenler/159933d10e7a68.jpg&w=1920&h=850&zc=1',
    'https://denizli.org/wp-content/uploads/2016/12/camlik-parki.jpg'
  ],
  'Samsun': [
    'https://www.kulturportali.gov.tr/repoKulturPortali/large/13032013/7464ed6d-1c65-41ad-834b-49d18c14dc09.JPG?format=jpg&quality=50',
   "https://www.kulturportali.gov.tr/contents/images/SAMSUN-BANDIRMA%20VAPURU-G%C3%9CLCAN%20ACAR%20(1)(1).jpg",
    'https://i.neredekal.com/i/neredekal/75/585x300/6063a449d826b7ffcce95d12',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoxOlLSJnncK9Hi0-IYICusx8SjSLwhrtAxNKxYeRdMQ&s'
  ],
  'Kayseri': [
    'https://image.milimaj.com/i/milliyet/75/869x477/5f6c84655542831e685ec222.jpg',
    'https://okuryazarim.com/wp-content/uploads/2017/01/Hunat-Hatun-Genel.jpg',
   'https://www.kayseri.bel.tr/uploads/kesfet/havadan-kayseri/1/cumhuriyet-meydani-detaylar.jpg',
  'https://kayseri.bel.tr/uploads/haberler/2024/4/kayseri-cocuk-kitap-fuari-ve-senligi-yogun-ilgi-goruyor-58.jpeg'
  ],
  'Balıkesir': [
   'https://static.baranselgrup.com/nwm-147370-w1920-cunda-adasi-hakkinda-bilinmesi-gerekenler.png',
    'https://www.villacim.com.tr/uploads/310_ayvalikgezilecekyerler.jpg',
    'https://blog.biletbayi.com/wp-content/uploads/2020/08/bandirma-balikesir-scaled.jpg',
   'https://www.kulturportali.gov.tr/contents/images/shutterstock_626443904.jpg?format=jpg&quality=50&width=1200',],
  'Gaziantep': [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Gaziantep%2C_Turkey_-_panoramio_%288%29.jpg/1200px-Gaziantep%2C_Turkey_-_panoramio_%288%29.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGDY6Qjw0ZtTuaAbPIvHAEVcXIHPkNF1ByNP7vgb6VhMEW0yO-7HDpEtayrI3gtt0D8gE&usqp=CAU',
    'https://cdnuploads.aa.com.tr/uploads/Contents/2020/01/22/thumbs_b_c_9307bf5786ca3ad696421d44498e9384.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Gaziantep_Tahtani_Camii_8409.jpg/1280px-Gaziantep_Tahtani_Camii_8409.jpg'
  ],
  'Diyarbakır': [
    'https://www.kulturportali.gov.tr/contents/images/THK-ORHAN%20%C3%96ZG%C3%9CLBA%C5%9E-D%C4%B0YARBAKIR.jpg?format=jpg&quality=50&width=1200',
'https://ozgurhabergazetesi.com/wp-content/uploads/2024/02/diyarbakirin-gizemli-simgesi-dort-ayakli-minare-2.webp',
   'https://image.hurimg.com/i/hurriyet/75/1110x740/5c0e2f09c03c0e14b4633898.jpg',
   'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/OnGozluBridge.jpg/1200px-OnGozluBridge.jpg'
  ],
   'Mersin': [
  'https://www.kulturportali.gov.tr/repoKulturPortali/large/Dokumanlar/MersinMarina1FotografMersinMarina2_20160302132809278.JPG?format=jpg&quality=50',
    'https://www.kulturportali.gov.tr/repoKulturPortali/large/SehirRehberi//GezilecekYer/20181105145817900_MERSIN%20TARSUS%20TERIHI%20ULUCAMII%20GULCAN%20ACAR%20(3).jpg?format=jpg&quality=50',
    'https://panel.silifke.bel.tr/Uploads/Content/content_S%C4%B0L%C4%B0FKE_Silifke%20Kalesi_70_3334.Jpeg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPje_0_WBpuYVB8xjS0AfWCm02SdMdFWyk8GmTu2dmeJhtzNPqIh-avNBQHf7HX4uHUek&usqp=CAU'
  ],
  'Kahramanmaraş': [
    'https://www.kulturportali.gov.tr/contents/images/kahramanmaras%20kalesi%20logolu.jpg?format=jpg&quality=50&width=1200',
   'https://iasbh.tmgrup.com.tr/afa14c/1200/627/0/0/800/418?u=https://isbh.tmgrup.com.tr/sbh/2023/10/18/yedi-uyuyanlar-magarasi-nerede-ve-nasil-gidilir-yedi-uyurlar-magarasi-hangi-sehirde-kac-tane-st1-1697614803422.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR95OLtY9j98Y4Bo-d-lV2qfFKuIiIuCsX8L5jKZqsM7w&s',
    'https://kahramanmaras.bel.tr/fs/styles/16x9_w960_1x_top/public/fields/news/news_image/2022/09/06/binevler_caddesi_yenileme_projesi_5.jpg?itok=YotqzlP1'
  ],
  'Erzurum': [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnurLI9DUKOtwljlMw5F9KRtKlgOy4WNKCbFFgZYsNfw&s',
    'https://iasbh.tmgrup.com.tr/f10517/1200/627/0/48/1200/675?u=https://isbh.tmgrup.com.tr/sbh/2021/10/07/cifte-minareli-medrese-tarihi-ve-ozellikleri-cifte-minareli-medrese-nerede-kime-ait-1633603062382.jpg',
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpvViXwrKWA36LkrPjHdfzEjBfK8GGNyjMLB6Xi0SzeQ&s',
   'https://bestinsaatas.com/rupload/108289.jpg'
  ],
  'Adıyaman': [
  'https://www.bizevdeyokuz.com/wp-content/uploads/nemrut-dagi-adiyaman-13.jpg',
    'https://mediacdn.yirmidort.tv/Documents/yirmidorthaber/images/2024/02/09/tarihi-cendere-koprusu-de-129_2-41.jpg',
   'https://trthaberstatic.cdn.wp.trt.com.tr/resimler/2028000/perre-antik-kenti-a-2029989.jpg',
   'https://kvmgm.ktb.gov.tr/Resim/342950,adiyaman-adiyaman01jpg.png?0'
  ],
   'Kocaeli': [
    'https://static.daktilo.com/sites/1009/uploads/2023/03/21/saat-kulesi-2.jpg',
    'https://i20.haber7.net/resize/1280x720//haber/haber7/photos/2021/36/6_bin_agac_bulunan_en_buyuk_sehir_parkimiz_seka_park_1631277932_57.jpg',
    'https://www.dogusgyo.com.tr/yenidogusgyo_files/2018613132642459_201821484033535_Gebze%20Center%20AVM%20%C3%BCst%20foto.jpg',
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOTRzyAl60T3SrgPcaFIwSNDBhnh8XbBYjS6IjIsXM5w&s'
  ],
  // Diğer şehirler ve turistik yerler buraya eklenecek
};



















  } 
  
 