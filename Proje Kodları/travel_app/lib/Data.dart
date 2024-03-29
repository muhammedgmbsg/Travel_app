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
  

  //Turistik yer adları ve resimleri
  static Column popularPlace(String placeText,String images,double width,double height) {
    return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      width: width,
                      height: height,
                      
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(images,fit: BoxFit.fitHeight,)),
                    ),SizedBox(height: 10,),
                   Text("$placeText")
                  ],
                );
  }
  } 
  