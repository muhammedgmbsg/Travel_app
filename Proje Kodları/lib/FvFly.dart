import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/Data.dart';

class FvFly extends StatelessWidget {
  const FvFly({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(appBar: AppBar(
          backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white), // İkon rengi
            automaticallyImplyLeading: true,
          title: Text("Uçuş Planlarım",style: TextStyle(color: Colors.white,fontSize: 16.h),),),
          body: FavoriteList(),
          );
  });
}
}



class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritePlaces = Data.PlannedFlyList;

    if (favoritePlaces.isEmpty) {
      return Center(
        child: Text(
          "Henüz bir uçuş planı eklemediniz",
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top:0.h, bottom: .0.w),
          child: Center(
            child: Text(
              "",
              style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.w600,color: Color.fromARGB(255, 72, 166, 213)),
            ),
          ),
        ),
        ...favoritePlaces.entries.map((entry) {
          String key = entry.key;
          List value = entry.value;
          int index = favoritePlaces.keys.toList().indexOf(key) + 1;

          return Column(
            children: [
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.center,
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(225, 33, 149, 243),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 41, 41, 41)
                              .withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: 10.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.0),
                child: Container(
                                 
                                  height: 130,
                                  
                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 225, 220, 218),borderRadius: BorderRadius.circular(17),
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
                                                                                  SizedBox(width: 0.w,),
                                
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
                                            child:Text(value[5],style: const TextStyle(fontSize: 12,color: Colors.white),) ,),SizedBox(width: 80.w,), Container(
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
                                            child: Text('${(value[3])}',
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
                                
                                           Column(children: [ Text(value[1]),Text(value[2].toString().substring(11),style: TextStyle(fontSize: 11.sp),),           
                                                         ],)
                                
                                            
                                            
                                            ,SizedBox(width: 55.w,),
                                            Row(
                                              children: [
                                                Container(child: Icon(Icons.flight_takeoff_outlined,size: 25.h,),), value[6] == true ? 
                                                Icon(Icons.flight_takeoff_outlined,size: 25.h,) : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(width: 55.w,),
                                            Column(children: [
                                            
                                            SizedBox(width: 3.h),
                                            Text(
                                      '${value[1]}'),
                                            Text(value[7],style: TextStyle(fontSize: 11.sp),),SizedBox(height: 3.h,),],)
                                
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
              SizedBox(height: 3.0),
             
            ],
          );
        }).toList(),
      ],
    );
  }
}