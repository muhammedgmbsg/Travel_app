import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/Data.dart';
import 'package:travel_app/Provider.dart';

class DetailPage extends ConsumerWidget {
//String name="Galata Kulesi ya da müze olarak kullanılmaya başlaması sonrasındaki adıyla Galata Kulesi Müzesi, İstanbul'un Beyoğlu ilçesinde bulunan bir kuledir. Adını, bulunduğu Galata semtinden alır.";
String ?name="";

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     name= Data.cityPopularPlacesAboutText[ref.watch(selectedCityProvider)]
      !.where((place) => place.containsKey('${ref.watch(popularTouristicPlace_name)}'))
      .first[ref.watch(popularTouristicPlace_name)]!;

String img_Url="images/galata.png"; 
 return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
       builder: (_ , child) {
        return MaterialApp(
          home: Scaffold(
                    backgroundColor: Color.fromARGB(255, 255, 253, 253),

            body: Consumer(
          builder: (context, WidgetRef ref, child) {
            return  Column(children: [
                SizedBox(height: 20.h,),
               Padding(
                 padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 30.w),
                 child: Container(
                  
                  width: double.infinity,
                  height: 190.h,
                  //color: Colors.grey,
                  child: ClipRRect
                  ( //{ref.watch(popularTouristicPlace_imageUrl)}
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(ref.watch(popularTouristicPlace_imageUrl).toString(),fit: BoxFit.cover,)),
                 ),
               ),
               SizedBox(height: 13.h,),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 7.h),
                 child: Container(
                        
              
                  decoration: BoxDecoration(color:Color.fromARGB(255, 239, 237, 237),
                  borderRadius: BorderRadius.circular(10),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                 const BoxShadow(
                        color:Color.fromARGB(255, 231, 225, 225),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      )
                ]),
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  height: 150.h,
                 // color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          
                          padding:  EdgeInsets.symmetric(vertical: 13.h,horizontal: 11.w),
                        child: Container(
                       //   color: Colors.red,
                          height: 90.h,
                          child: Text( name!.length >270 ? name!.substring(0,270).toString()+"..." : name! , style: TextStyle(fontSize: 10.h,color: Color.fromARGB(255, 65, 64, 64)),)),
                        ),
                      ),
                      
                      Row(children: [
                        SizedBox(width:8.w,),
                        Icon(Icons.location_on_rounded, color: Colors.blue,),
                        SizedBox(width: 5.w,),Text('${ref.watch(popularTouristicPlace_name)} / ${ref.watch(selectedCityProvider)}')
                      ],)
                    ],
                  ),
                 ),
               ),
               SizedBox(height: 30.h,),
               ElevatedButton(
                        onPressed: () {
              
                        },
                        style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(300, 40),
              padding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Köşe yarıçapı
              ),
                        ),
                        child: const Text('Favoriye Ekle',style: TextStyle(color: Colors.white),),
                      ),
               
              ]
            );
         }  ),));}
        );
       }
}