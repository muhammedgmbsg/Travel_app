import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/Data.dart';
import 'package:travel_app/FlighPage.dart';
import 'package:travel_app/main.dart';



class HomePage extends StatefulWidget {
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
  String selectedCity = 'İstanbul'; // Başlangıçta seçilen şehir
  @override
  Widget build(BuildContext context) {
 return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 225, 225),
        body: Container(
          child: Column(children: [
            Row(
              children: [Padding(
                padding:  EdgeInsets.only(left: 30.w,top: 25),
                child: Column(
              
                children: [
                  
                  Container(
                    
                    width: 270,
                    child:
                  
                   const Text("Hoşgeldin",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)),SizedBox(height: 10.h,),Container(
                   
                   width: 270,
                    child: const Text('Muhammed Gümüşboğa',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.blue),)),
                  
                    
                ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 5.w,top: 20.h),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 76, 75, 75)),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1),
                      )
                    ]
                  ),
                  child: ClipOval(
                    
                          child: Image.asset(
                            'images/muhammed.jpg',
                            width: 60,
                            height: 60,
                            fit:BoxFit.cover
                          ),
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
             
             scrollElements(150,110,"${Data.cityPopularPlaceText['$selectedCity']![0]}","images/galata.png","${Data.cityPopularPlaceText['$selectedCity']![1]}","images/topkapi.jpeg","${Data.cityPopularPlaceText['$selectedCity']![2]}","images/kapadokya.webp","${Data.cityPopularPlaceText['$selectedCity']![3]}","images/kapadokya.webp"),const SizedBox(height: 10,),
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
             SizedBox(height: 29.h,)
,          Center(child: travelCreate()),
             ],
             
           ),

           

        ),
        ),);
  },);}

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
                
                border: Border.all(
                  color: Colors.blue
                  
                ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
               const BoxShadow(
                      color:Color.fromARGB(255, 231, 225, 225),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 1),
                    )
              ]),
              
               child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: TypewriterAnimatedTextKit(
              
              text:  [Data.cityAnswer['$selectedCity']![questionNumber()].toString(),],
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
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(8)),
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
                  Data.popularPlace(place1,img1,width,height),const SizedBox(width: 10,),
                   Data.popularPlace(place2,img2,width,height),const SizedBox(width: 10,),
                    Data.popularPlace(place3,img3,width,height),const SizedBox(width: 10,),
                    Data.popularPlace(place4,img4,width,height),const SizedBox(width: 10,),
                    
                  
                ],
               ),
             ),
           );
  }


        

  Container selectCity() {
    return Container(
             width: 200.w,
                 decoration: BoxDecoration(
                  
                   borderRadius: BorderRadius.circular(8.0),
                  
                 
                 ),
                 child: DropdownButtonFormField<String>(
      value: selectedCity,
      onChanged: (String? newValue) {
        setState(() {
          selectedCity = newValue!;
          control = true;
        });
      },
      
      decoration: InputDecoration(
enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(8)),
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
    ),);
  }


} String selectedTransportation = 'Otobüs';
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
              ListTile(
                title: const Text('Otobüs'),
                leading: Radio(
                  activeColor: Colors.blue,
                  value: 'Otobüs',
                  groupValue: selectedTransportation,
                  onChanged: (value) {
                    _updateSelectedTransportation(value!, context);
                  },
                ),
              ),
              ListTile(
                title: const Text('Uçak'),
                leading: Radio(
                  value: 'Uçak',
                  groupValue: selectedTransportation,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    _updateSelectedTransportation(value!, context);
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    const Text('Tarih Seçin:'),
                      Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
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
                    );
                
                    if (pickedDate != null && pickedDate != selectedDate) {
                      selectedDate = pickedDate;
                    }
                  },
                  child: const Icon(Icons.date_range_rounded,color: Colors.blue,),
                ),
              ),
                  ],
                ),
              ),
              
            
            ],
          ),
          actions: [
            
            SizedBox(width: 30.w,),
            ElevatedButton(
              onPressed: () {
                // Seçilen verileri kullanabilirsiniz
                print('Seçilen Ulaşım: $selectedTransportation');
                print('Seçilen Tarih: $selectedDate');
                if(selectedTransportation == "Uçak"){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => FlightOffersScreen())));
              }else{
                 //Otobüs ise otobüs ulaşım sayfasına yönlendir
              }},
              
              child: const Text('Onayla',style: TextStyle(color: Colors.blue),),
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
