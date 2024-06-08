import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:travel_app/Data.dart';
import 'package:travel_app/Db.dart';
import 'package:travel_app/Provider.dart';
import 'package:travel_app/personProvider.dart';

final controlProgress = StateProvider<bool>((ref) {
  return false;
});


class FlightOffersScreen extends StatefulWidget {
  

  const FlightOffersScreen({super.key});

  @override
  _FlightOffersScreenState createState() => _FlightOffersScreenState();
}

class _FlightOffersScreenState extends State<FlightOffersScreen> {
  late Future<List<FlightOffer>> flightOffers;
  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();
  
  bool control  =false;
  
  
  
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // initState tamamlandıktan sonra çalışacak olan asenkron işlemi başlat
    Consumer(
               builder: (context,WidgetRef ref,child) {
                 
                getFlightOffers('DIY', 'ESB',ref);
                selectedArrival= ref.watch(selectedCityProvider);
                return child!;
               }
  
    );
  });
}



  Future<List<FlightOffer>> getFlightOffers(String kalkis, String inis,WidgetRef ref,) async {
    // API'den veri çekme işlemi burada
    String accessToken = await getAccessToken();
    final String apiUrl =                                 //${ref.watch(selectedDateTime)}
        "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$kalkis&destinationLocationCode=$inis&departureDate=${ref.watch(selectedDateTime)}&adults=1&max=5";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );

    if (response.statusCode == 200) {
      // Başarılı yanıtı işleme kodunu burada ekleyin
      List<dynamic> jsonList = json.decode(response.body)['data'];
      List<FlightOffer> flightOffers = jsonList
          .map((json) => FlightOffer.fromJson(json))
          .toList();
      return flightOffers;
    } else {
      // Hata durumunda yanıtı kontrol ederek ayrıntıları gösterin
      print("API isteği başarısız: ${response.statusCode}");
      print("Hata mesajı: ${response.body}");
      throw Exception("Failed to load flight offers");
    }
  }

  // Kullanıcının girdiği kalkış ve varış noktalarını kullanarak verileri çekme
   searchFlightOffers(WidgetRef ref) {
    String departure = airportCodes[selectedDeparture]?.first ?? "";
    String arrival = airportCodes[selectedArrival]?.first ?? "";
    setState(() {
      flightOffers = getFlightOffers(departure, arrival,ref);
      control = true;
    });
  }

  Map<String, String> airlineCodes = {
    "PC": "Pegasus Airlines",
    "TK": "Turkish Airlines",
    "8Q": "Onur Air",
    "XQ": "SunExpress",
    "VF": "Ajet"
    // Diğer havayolu şirketlerini ekleyebilirsiniz
  };
String? selectedDeparture;
 String? selectedArrival;

Map<String, List<String>> airportCodes = {
  "Adana": ["ADA"],
  "Adıyaman": ["ADF"],
  "Afyonkarahisar": ["AFY"],
  "Ağrı": ["AJI"],
  "Aksaray": ["ASR"],
  "Amasya": ["MZH"],
  "Ankara": ["ESB", "ANK"],
  "Antalya": ["AYT"],
  "Artvin": ["HOP"],
  "Aydın": ["DNY"],
  "Balıkesir": ["BZI"],
  "Bartın": ["BAZ"],
  "Batman": ["BAL"],
  "Bayburt": ["BAY"],
  "Bilecik": ["BTZ"],
  "Bingöl": ["BGG"],
  "Bitlis": ["BAL"],
  "Bolu": ["BTZ"],
  "Burdur": ["BXN"],
  "Bursa": ["BTZ"],
  "Çanakkale": ["CKZ"],
  "Çankırı": ["CKZ"],
  "Çorum": ["CKZ"],
  "Denizli": ["DNZ"],
  "Diyarbakır": ["DIY"],
  "Düzce": ["DZC"],
  "Edirne": ["EDO"],
  "Elazığ": ["EZS"],
  "Erzincan": ["ERC"],
  "Erzurum": ["ERZ"],
  "Eskişehir": ["ESK"],
  "Gaziantep": ["GZT"],
  "Giresun": ["GSN"],
  "Gümüşhane": ["GZT"],
  "Hakkari": ["HKK"],
  "Hatay": ["HTY"],
  "Iğdır": ["IGD"],
  "Isparta": ["ISE"],
  "İstanbul": ["IST", "SAW"],
  "İzmir": ["ADB"],
  "Kahramanmaraş": ["KCM"],
  "Karabük": ["KRB"],
  "Karaman": ["KCM"],
  "Kars": ["KSY"],
  "Kastamonu": ["KFS"],
  "Kayseri": ["ASR"],
  "Kırıkkale": ["ESB"],
  "Kırklareli": ["KKL"],
  "Kırşehir": ["KZR"],
  "Kilis": ["GZT"],
  "Kocaeli": ["IST"],
  "Konya": ["KYA"],
  "Kütahya": ["KZR"],
  "Malatya": ["MLX"],
  "Manisa": ["DNY"],
  "Mardin": ["MQM"],
  "Mersin": ["ISE"],
  "Muğla": ["DLM"],
  "Muş": ["MSR"],
  "Nevşehir": ["NAV"],
  "Niğde": ["NIG"],
  "Ordu": ["OGU"],
  "Osmaniye": ["GZT"],
  "Rize": ["RIZ"],
  "Sakarya": ["SAW"],
  "Samsun": ["SSX"],
  "Siirt": ["SXZ"],
  "Sinop": ["SSX"],
  "Sivas": ["VAS"],
  "Şanlıurfa": ["GNY"],
  "Şırnak": ["NKT"],
  "Tekirdağ": ["TEQ"],
  "Tokat": ["TJK"],
  "Trabzon": ["TZX"],
  "Tunceli": ["TJK"],
  "Uşak": ["USQ"],
  "Van": ["VAN"],
  "Yalova": ["YEI"],
  "Yozgat": ["ASR"],
  "Zonguldak": ["ONQ"],
};
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return Scaffold(
          backgroundColor:  const Color.fromARGB(255, 231, 225, 225),
      appBar:AppBar(title: Text('Uçuş Planı',style: TextStyle(color: Colors.white,fontSize: 16.h),),backgroundColor: Colors.blue,
       iconTheme: IconThemeData(color: Colors.white), // İkon rengi
            automaticallyImplyLeading: true,
      )
      ,body: Column(
        children: [
          
          Center(
            child: Column(
              children: [
                // Kalkış ve varış noktalarını almak için DropdownButton'lar
                Stack(children: [ Container(height: 160,color: Colors.blue,),
                Padding(
                  padding: EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h),
                  child: Container(
                  width: double.infinity,
                  height: 215.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color.fromARGB(255, 231, 225, 225),boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
                      )
                    ]),
                  child: Consumer(
                     builder: (context,WidgetRef ref,child) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                      const SizedBox(height: 20,),
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                        child: DropdownButtonFormField<String>(
                                    value: selectedDeparture,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedDeparture = newValue!;
                                      });
                                    },decoration: InputDecoration(
                                      
                              hintText: 'Soru Seç',
                              contentPadding: const EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(18.0),
                                
                              ),
                                                      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.0),
      borderSide: const BorderSide(color: Colors.blue), // Normal duruma mavi border
    ),
                               enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.0),
      borderSide: const BorderSide(color: Colors.black), 
    ),
                            ),
                                    items: airportCodes.keys.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    hint: const Text('Kalkış Noktası'),
                                        ),
                      ),const SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: DropdownButtonFormField<String>(
                      
                                  value: selectedArrival,
                                  onChanged: (String? newValue) {
                                    setState(() {
                      selectedArrival = newValue!;
                      debugPrint(selectedArrival);
                                    });
                                  },decoration: InputDecoration(
                            hintText: 'Soru Seç',
                            contentPadding: const EdgeInsets.all(12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ), enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.0),
      borderSide: const BorderSide(color: Colors.black), // Normal duruma mavi border
    ),  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.0),
      borderSide: const BorderSide(color: Colors.blue), 
                          ),),
                                  items: airportCodes.keys.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: const Text('Varış Noktası'),
                      ),
                    ),
                    const SizedBox(height: 30,),
                  ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor:Colors.blue ,minimumSize: Size(200.w, 35.h)),
  onPressed: () { searchFlightOffers(ref);

  },
  child: const Text('Uçuşları Ara',style: TextStyle(color: Colors.white),),
),
SizedBox(height: 10.h,)
                                  ],),
                  ),
                                 ),
                ),]),
               
            const SizedBox(height: 30,),
             SizedBox(
              height: 300.h,
              
               child: control == true ? FutureBuilder<List<FlightOffer>>(
                future: flightOffers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.blue,),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List<FlightOffer> flightOffers = snapshot.data!;
                     // Uçuş sonuçlarını consolde yazdır
                    for (int i = 0; i < flightOffers.length; i++) {
                      print("Uçuş ${i + 1} Detayları:");
                      print("From ${flightOffers[i].originLocationCode} to ${flightOffers[i].destinationLocationCode}");
                      print("Airline: ${flightOffers[i].validatingAirlineCodes[0] ?? "Bilinmeyen Havayolu Şirketi"}");
                      print("Departure Time: ${flightOffers[i].departureTime}");
                      print("Arrival Time: ${flightOffers[i].arrivalTime}");
                      print("Total Price: ${flightOffers[i].price.total} EUR\n");
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: flightOffers.length,
                        itemBuilder: (context, index) {
                          String airlineCode = flightOffers[index].validatingAirlineCodes.isNotEmpty
                          ? flightOffers[index].validatingAirlineCodes[0]
                          : "UNKNOWN";
                      String airlineName;
                      
                       airlineName = airlineCodes[airlineCode] ?? "Bilinmeyen Havayolu Şirketi";
                      
                      
                     String a =  flightOffers[index].secondLayoverArrival != null ? " - ${flightOffers[index].secondLayoverArrival}" : "";
                       String totalPrice = flightOffers[index].price.total;
                                    String currency = flightOffers[index].price.currency;
                                    double totalPriceInTL = double.parse(totalPrice) * 4;
                              if(airlineCode=="XQ"){
                                totalPriceInTL = double.parse(totalPrice) * 40;
                              }
                                 
                        return Consumer(
               builder: (context,WidgetRef ref,child) {
                        
                      return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
                              child: InkWell(
                                 onTap: () {

                 

               _showConfirmationDialog(context,ref,flightOffers[index].originLocationCode,flightOffers[index].destinationLocationCode ,flightOffers[index].departureTime,'${(totalPrice)} Euro ',ref.watch(selectedDateTime),airlineName,flightOffers[index].secondLayoverArrival != null ? true : false,flightOffers[index].arrivalTime.substring(11));

              
               
               },
  
    
                                
                                child: Container(
                                  height: 130,decoration: BoxDecoration(color: const Color.fromARGB(255, 225, 220, 218),borderRadius: BorderRadius.circular(17),
                                  boxShadow: [
                                                      BoxShadow(
                                                        color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: const Offset(0, 1),
                                                      )
                                                    ]),
                                
                                  child: ListTile(
                                    //  title: Text('${index+1}- ${flightOffers[index].originLocationCode} - ${flightOffers[index].destinationLocationCode}$a'),
                                      subtitle: Column(
                                        
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 7.h,),
                                         Row(children: [
                                                                                  SizedBox(width: 5.w,),
                                
                                          Container(
                                            alignment: Alignment.center,
                                            width: 110.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                            color:  Colors.blue,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                                      BoxShadow(
                                                        color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: const Offset(0, 1),
                                                      )
                                                    ]
                                          ),
                                            child:Text(airlineName,style: const TextStyle(fontSize: 12,color: Colors.white),) ,),SizedBox(width: 100.w,), Container(
                                             alignment: Alignment.center,
                                            width: 80.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                            color:  Colors.blue,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                                      BoxShadow(
                                                        color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: const Offset(0, 1),
                                                      )
                                                    ]
                                          ),
                                            child: Text('${(totalPrice)} Euro ',
                                            style: const TextStyle(fontSize: 12,color: Colors.white),),),
                                         ],),
                                         SizedBox(height: 5.h,),
                                       const Divider(
                                              thickness: 0.25,  // Kalınlık ayarı (varsayılan: 1.0)
                                              color: Colors.blue,   // Renk ayarı (varsayılan: Theme.of(context).dividerColor)
                                              indent: 0, // Başlangıç kenarı boşluğu (varsayılan: 0)
                                              endIndent: 0, // Bitiş kenarı boşluğu (varsayılan: 0)
                                            ),SizedBox(height: 2.h,),
                                
                                
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                
                                           Column(children: [ Text(flightOffers[index].originLocationCode),Text(flightOffers[index].departureTime.substring(11),style: TextStyle(fontSize: 11.sp),),           
                                                         ],)
                                
                                            
                                            
                                            ,SizedBox(width: 55.w,),
                                            Row(
                                              children: [
                                                Container(child: Icon(Icons.flight_takeoff_outlined,size: 25.h,),), flightOffers[index].secondLayoverArrival != null ? 
                                                Icon(Icons.flight_takeoff_outlined,size: 25.h,) : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(width: 55.w,),
                                            Column(children: [
                                            
                                            SizedBox(width: 3.h),
                                            Text(
                                      '${flightOffers[index].destinationLocationCode}$a'),
                                            Text(flightOffers[index].arrivalTime.substring(11),style: TextStyle(fontSize: 11.sp),),SizedBox(height: 3.h,),],)
                                
                                          ],)
                                
                                
                                
                                
                                         //  Text('HavaYolu: $airlineName'),
                                       //   Text('Kalkış Saati: ${flightOffers[index].departureTime.substring(11)}'),
                                     //     Text('İniş Saati: ${flightOffers[index].arrivalTime.substring(11)}'),
                                   //      Text('Fiyat: ${(totalPriceInTL!=null ?totalPriceInTL.toStringAsFixed(2):"00")} TL'),
                                        
                                        ],
                                      ),
                                      // Diğer bilgileri de buraya ekleyebilirsiniz
                                    ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,)
                          ],
                        );
                        },
                      );
                  }));
                  }
                },
                    ) : const Text('Henüz Arama Yapılmadı...')
             ) ]),
          ),
        ],
      ));});}

       void _showConfirmationDialog(BuildContext context, WidgetRef ref, kalkis, String varis, String kalkisSaati,String fiyat,String tarih,String havayoluSirketi, bool aktarmaVarmi,String varisSaati) {
    
    
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context,setState){
        return AlertDialog(
          title: const Text('Favoriye Ekle'),
          content: const Text('Uçuş planlarına eklemek istiyor musunuz?'),
          actions: <Widget>[
           Row(mainAxisAlignment: MainAxisAlignment.end,
           children: [
            Padding(
                    padding:  EdgeInsets.only(left: 5.w),
                    child: ref.watch(controlProgress) == true ? CircularProgressIndicator(
                      color: Colors.blue,
                    ) : SizedBox(),
                  ) ,
                  Spacer(),
             TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
              },
              child: const Text('Kapat',style: TextStyle(color: Colors.blue),),
            ),
            TextButton(
              onPressed: () async {
             //   
              //  debugPrint("eklendi");
              try{
 
            ref.read(controlProgress.notifier).state = true;

             setState(() {
                  
                });
                                   

                if(!Data.PlannedFlyList.containsKey(tarih)){
                
               _addPlace(tarih, [kalkis, varis, kalkisSaati,fiyat,tarih,havayoluSirketi,aktarmaVarmi,varisSaati]);
               await DataBase.InsertfavoritePlace(ref.watch(now_userMailProvider),Data.PlannedFlyList,"fvFly");
             

                }
                else{
                  debugPrint("Zaten ekli");
                 Navigator.of(context).pop();
                 
                _showConfirmationDialog2(context);
                    
              
                  
                }
                   ref.read(controlProgress.notifier).state = false;
                  
                   setState(() {
                  
                });
               }
               catch (expection){
                debugPrint(expection.toString() );
                  ref.read(controlProgress.notifier).state = false;
                  setState(() {
                  
                });
               }
                
                Navigator.of(context).pop(); // Dialog'u kapat
              },
              child: const Text('Ekle',style: TextStyle(color: Colors.blue),),
            ),
           ],)
          ],
        );
      },
    );
       });}
void _addPlace(String key, List value) {
    
      Data.PlannedFlyList[key] = value;
    
  }
 void _showConfirmationDialog2(BuildContext context) {
        
    showDialog(
  
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Text('Aynı gün için sadece bir uçuş eklenebilir'),
          
          actions: <Widget>[
            
            TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Dialog'u kapat
                  },
                  child: const Text('Kapat',style: TextStyle(color: Colors.blue),),
                ),
           
          ],
        );
      },
    );
  }
  }

  class FlightOffer {
  final String id;
  final String originLocationCode;
  final String destinationLocationCode;
  final String departureTime;
  final String arrivalTime;
  final Price price;
  final List<String> validatingAirlineCodes;
   final String? secondLayoverDeparture;
  final String? secondLayoverArrival;

  FlightOffer({
    required this.id,
    required this.originLocationCode,
    required this.destinationLocationCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
    required this.validatingAirlineCodes,
      required this.secondLayoverDeparture,
    required this.secondLayoverArrival,
    
  });

  factory FlightOffer.fromJson(Map<String, dynamic> json) {
    String? secondLayoverDeparture;
    String? secondLayoverArrival;
    if (json['itineraries'] != null &&
        json['itineraries'][0]['segments'] != null &&
        json['itineraries'][0]['segments'].length > 1 &&
        json['itineraries'][0]['segments'][1]['departure'] != null &&
        json['itineraries'][0]['segments'][1]['arrival'] != null) {
      secondLayoverDeparture =
          json['itineraries'][0]['segments'][1]['departure']['iataCode'] ?? '';
      secondLayoverArrival =
          json['itineraries'][0]['segments'][1]['arrival']['iataCode'] ?? '';
    }
    return FlightOffer(
      secondLayoverDeparture: secondLayoverDeparture,
      secondLayoverArrival: secondLayoverArrival,
      id: json['id'] ?? '',
      originLocationCode: json['itineraries'][0]['segments'][0]['departure']['iataCode'] ?? '',
      destinationLocationCode: json['itineraries'][0]['segments'][0]['arrival']['iataCode'] ?? '',
      departureTime: json['itineraries'][0]['segments'][0]['departure']['at']?.toString() ?? '',
      arrivalTime: json['itineraries'][0]['segments'][0]['arrival']['at']?.toString() ?? '',
      price: Price.fromJson(json['price']),
      validatingAirlineCodes: List<String>.from(json['validatingAirlineCodes'] ?? []),
    );
  }
}

class Price {
  final String total;
  final String currency;

  Price({
    required this.total,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      total: json['total']?.toString() ?? '',
      currency: json['currency']?.toString() ?? '',
    );
  }
}

// istek atmak için api key, id ve url
Future<String> getAccessToken() async {
  const String apiUrl = "https://test.api.amadeus.com/v1/security/oauth2/token";
  const String clientId = "ACVvEXkae4VzQYTQUkghWoLYKSvUAXsj";
  const String clientSecret = "HpKqP5mPUfib6ATV";

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: {
      "grant_type": "client_credentials",
      "client_id": clientId,
      "client_secret": clientSecret,
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    String accessToken = data["access_token"];
    return accessToken;
  } else {
    throw Exception("Failed to obtain access token");
  }
}