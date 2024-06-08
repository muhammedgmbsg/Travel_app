import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/Data.dart';
import 'package:travel_app/DetailPage.dart';
import 'package:travel_app/FlighPage.dart';
import 'package:travel_app/FvFly.dart';
import 'package:travel_app/FvPlace.dart';
import 'package:travel_app/Provider.dart';
import 'package:travel_app/login_page.dart';
import 'package:travel_app/personProvider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  


  final List<String> gptQuestions = [
    'Neyi meşhur?',
    'Yemek kültürü gelişmiş mi ?',
    'Ucuz mu ?',
    'İklimi nasıl ?',
    'Gezilmeye değer mi ?',
    
  ];

   

  
  bool control = false;
  String selectedQuestion = 'Neyi meşhur?'; //Başlangıçta seçilen soru
  
  String selectedCity ="İstanbul";
 
  
  @override
  Widget build(BuildContext context) {
    return
     Consumer(
          builder: (context, WidgetRef ref, child) {
        selectedCity = ref.watch(selectedCityProvider);
        debugPrint("deger1=$selectedCity");
            return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return 
      Scaffold(
        
          drawer: Drawer( child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bilgilerim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(ref.watch(now_userMailProvider),
                    style: TextStyle(
                      color: Color.fromARGB(255, 233, 228, 228),
                      fontSize: 15,
                    ),
                  ),
                   SizedBox(height: 5),
                  Text(ref.watch(now_userNameProvider),
                    style: TextStyle(
                      color: Color.fromARGB(255, 233, 228, 228),
                      fontSize: 14,
                    ),
                  ),
                  
                ],
              ),
            ),
          
            ListTile(
              leading: const Icon(Icons.wallet_travel),
              title: const Text('Yolculuk Planlarım'),
              onTap: () {
                // Drawer öğesine tıklandığında yapılacak işlemler
                Navigator.pop(context); // Drawer'ı kapatır
                Navigator.push(context, MaterialPageRoute(builder:(context) =>  FvFly(),)); // Drawer'ı kapatır
              },
            ),
            ListTile(
              leading: const Icon(Icons.place_outlined),
              title: const Text('Beğendiğim Yerler'),
              onTap: () {
                // Drawer öğesine tıklandığında yapılacak işlemler
                Navigator.push(context, MaterialPageRoute(builder:(context) =>  FavoritePage(),)); // Drawer'ı kapatır
                // Ayarlar sayfasına gitmek için gerekli navigasyon işlemleri buraya eklenir
              },
            ),
            const Divider(), // İsteğe bağlı: Liste öğeleri arasına ayırıcı ekler
            ListTile(
              leading: const Icon(Icons.exit_to_app_rounded),
              title: const Text('Çıkış Yap'),
              onTap: () {
                // Drawer öğesine tıklandığında yapılacak işlemler

                Navigator.push(context, MaterialPageRoute(builder:(context) =>   LoginPage(),)); // Drawer'ı kapatır
                ref.read(now_userMailProvider.notifier).state = "";
                ref.read(now_userMailProvider.notifier).state="";
                Data.PlannedFlyList.clear();
                Data.favoritePageList.clear();
                // Hakkında sayfasına gitmek için gerekli navigasyon işlemleri buraya eklenir
              },
            ),
          ],
        ),),
        appBar: AppBar(  iconTheme: IconThemeData(
          color: Colors.white, // Drawer ikon rengini burada belirleyin
        ),backgroundColor: Colors.blue, title: Text("Seyahat Uygulaması",style: TextStyle(color: Colors.white,fontSize: 16.h),),),
        backgroundColor: const Color.fromARGB(255, 255, 253, 253),
        body: Container(
          child: Column(children: [
            Row(
              children: [Padding(
                padding:  EdgeInsets.only(left: 30.w,top: 25),
                child: Column(
              
                children: [
                  
                  const SizedBox(
                    
                    width: 270,
                    child:
                  
                   Text("Hoşgeldin",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)),SizedBox(height: 10.h,),SizedBox(
                   
                   width: 270,
                    child: Text('${ref.watch(now_userNameProvider)}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.blue),)),
                  
                    
                ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 5.w,top: 20.h),
                child: InkWell(
                  onTap: () {
                     Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                  
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 73, 72, 72)),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 5, 85, 204).withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                        )
                      ]
                    ),
                    child: Icon(Icons.person,size: 50,color: Colors.blue,)
                  ),
                ),
                ),
              
              
              ],
            ),
            SizedBox(height: 20.h,),
           Row(
             children: [
               Padding(
                 padding:  EdgeInsets.only(right: 10.w,left: 30.w),
                 child: selectCity(),
               ),
               SizedBox(width: 0.w,),
        InkWell(
          onTap: () {
            
          },borderRadius: BorderRadius.circular(50),
          child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle
          ),
          
          child: const Icon(Icons.add_location_sharp,size: 40,color: Colors.blue),),
        ),])
            
             ,Padding(
               padding: EdgeInsets.only(top: 25.h,right: 155.w),
               child: const Text('Popüler Turistik Yerler',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.blue),),
             ),
             
             scrollElements(150,110,Data.cityPopularPlaceText[selectedCity]![0],Data.cityPopularPlacesImg_url[selectedCity]![0],Data.cityPopularPlaceText[selectedCity]![1],Data.cityPopularPlacesImg_url[selectedCity]![1],Data.cityPopularPlaceText[selectedCity]![2],Data.cityPopularPlacesImg_url[selectedCity]![2],Data.cityPopularPlaceText[selectedCity]![3],Data.cityPopularPlacesImg_url[selectedCity]![3]),const SizedBox(height: 10,),
             Padding(
               padding:  EdgeInsets.only(right: 245.w),
               child: const Text('Soru Sor',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Colors.blue),),
             ),

             Padding(
               padding:  EdgeInsets.only(left: 30.w,right: 80.w,top: 20),
               child: selectQuestions(),
             ) 
             ,Padding(
               padding: EdgeInsets.only(top: 20,right: 30.w),
               child: AnswerText(),
             ),
             SizedBox(height: 22.h,)
,          Center(child: travelCreate()),
             ],
             
           ),

           

        ),
        );
  },);});
}
  ElevatedButton travelCreate() {
    return ElevatedButton(
          onPressed: () {
            // Butona tıklandığında yapılacak işlemler
             _showTravelPlanDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(300, 40),
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Köşe yarıçapı
            ),
          ),
          child: const Text('Yolculuk Planla',style: TextStyle(color: Colors.white),),
        );
  }
 //Animasyonlu Cevap Texti
  Container AnswerText() {
    return Container(
      
              height: 100.h,
              width: 270.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 253, 253),
                border: Border.all(
                  color: Colors.blue
                  
                ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
               BoxShadow(
                      color:Color.fromARGB(255, 231, 225, 225),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 1),
                    )
              ]),
              
               child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: TypewriterAnimatedTextKit(
              
              text:  [Data.cityAnswer[selectedCity]![questionNumber()].toString(),],
                textStyle: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 96, 94, 94)
                ),
                speed: const Duration(milliseconds: 50),
                totalRepeatCount: 1, // Kaç kere tekrar edeceği
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              
              
                           ),
                         ),
             );
  }
  
  //Soru seçme
  Container selectQuestions() {
    return Container(
            
           
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.0),
               
               ),
               child: DropdownButtonFormField<String>(
        value: selectedQuestion,
        onChanged: (String? newValue) {
          setState(() {
            selectedQuestion = newValue!;
            control = true;
          });
        }
        ,decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(8)),
      hintText: 'Soru Seç',
      contentPadding: const EdgeInsets.all(12.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
        items: gptQuestions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
         ));
  }
  //Soru numarası dönderme
  int questionNumber(){
    if(selectedQuestion==gptQuestions[0]){
      return 0;
    }
   else if(selectedQuestion==gptQuestions[1]){
      return 1;
    }
     else if(selectedQuestion==gptQuestions[2]){
      return 2;
    }
     else if(selectedQuestion==gptQuestions[3]){
      return 3;
    }
     else if(selectedQuestion==gptQuestions[4]){
      return 4;
    }
   else{
    return 0;
   }

  }
  //Turistik yer adları ve resimleri
  Padding scrollElements(double width,double height,String place1,img1,place2,img2,place3,img3,place4,img4) {
    return Padding(
             padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 13),
             child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child: Row(
                children: [
                  popularPlace(place1,img1,width,height,0),const SizedBox(width: 10,),
                   popularPlace(place2,img2,width,height,1),const SizedBox(width: 10,),
                    popularPlace(place3,img3,width,height,2),const SizedBox(width: 10,),
                    popularPlace(place4,img4,width,height,3),const SizedBox(width: 10,),
                    
                  
                ],
               ),
             ),
           );
  }


         Column popularPlace(String placeText,String images,double width,double height,int imgNo) {
    return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      width: width,
                      height: height,
                      
                      child:  Consumer(
          builder: (context, WidgetRef ref, child) {
            return  InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DetailPage(images,imgNo) ));
                            debugPrint("xddd$images");

                             ref.read(popularTouristicPlace_name.notifier).state = placeText;
                          //   ref.read(popularTouristicPlace_imageUrl.notifier).state= images;
                           debugPrint(ref.watch(popularTouristicPlace_name));
                           debugPrint(ref.watch(popularTouristicPlace_imageUrl));
                           debugPrint("hahah$images");

                          },
                          
                          
                              child: Container(
                              
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(images,fit: BoxFit.fitHeight,)),
                              ),
                            );}
                      ),
                        
                    ),const SizedBox(height: 10,),
                   Text(placeText)
                  ],
                );
  }

  Container selectCity() {
    return Container(
             width: 200.w,
                 decoration: BoxDecoration(
                  
                   borderRadius: BorderRadius.circular(8.0),
                  
                 
                 ),
                 child:  Consumer(
          builder: (context, WidgetRef ref, child) {
            return DropdownButtonFormField<String>(
                         value: selectedCity,
                         onChanged: (String? newValue) {
                           setState(() {


                             selectedCity = newValue!;
                             control = true;
                             ref.read(selectedCityProvider.notifier).state = newValue;
                             debugPrint("deger2=${ref.watch(selectedCityProvider)}");
                           });
                         },
                         
                         decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(8)),
                             focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(8)),
                           hintText: 'Şehir Seçin',
                           contentPadding: const EdgeInsets.all(12.0),
                           border: OutlineInputBorder(
                             
                             borderRadius: BorderRadius.circular(8.0),
                           ),
                         ),
                         items: Data.city.map<DropdownMenuItem<String>>((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value),
                           );
                         }).toList(),
                       );}),
                 );
  }


} String selectedTransportation = 'Uçak';
//Show Dialog
  Future<void> _showTravelPlanDialog(BuildContext context) async {
   
    DateTime selectedDate = DateTime.now();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yolculuk Planı'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

            SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    const Text('Tarih Seçin:'),
                      Padding(
                padding: const EdgeInsets.only(left: 20),
                child:  Consumer(
               builder: (context,WidgetRef ref,child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                  ),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      
                      context: context,
                      initialDate: selectedDate,
                      
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.blueAccent, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      }, 
                    );
                
                    if (pickedDate != null && pickedDate != selectedDate) {
                      
                      selectedDate = pickedDate;
                      //${ref.watch(selectedDateTime)}
                      ref.read(selectedDateTime.notifier).state = selectedDate.toString().substring(0,10);
                      debugPrint("hhaha${ref.watch(selectedDateTime)}");

                    }
                  },
                  child: const Icon(Icons.date_range_rounded,color: Colors.blue,),
                ),
              ),)
                  ],
                ),
              ),
              
            
            ],
          ),
          actions: [
            
            SizedBox(width: 30.w,),
          
            
            Consumer(
               builder: (context,WidgetRef ref,child) =>  ElevatedButton(
                onPressed: () {

                  // Seçilen verileri kullanabilirsiniz
                  print('Seçilen Ulaşım: $selectedTransportation');
                  
                  ref.read(selectedDateTime.notifier).state = selectedDate.toString().substring(0,10);
                  print('Seçilen Tarih: ${ref.watch(selectedDateTime)}');

                  if(selectedTransportation == "Uçak"){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const FlightOffersScreen())));
                }else{
                   //Otobüs ise otobüs ulaşım sayfasına yönlendir
                }},
                
                child: const Text('Onayla',style: TextStyle(color: Colors.blue),),
              ),
            ),
          ],
        );
      },
    );
  }

  void _updateSelectedTransportation(String value, BuildContext context) {
    Navigator.of(context).pop(); // Dialog kapatılmalı
    selectedTransportation = value;
    _showTravelPlanDialog(context); // Dialog tekrar açılmalı
  }
