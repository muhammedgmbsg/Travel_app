import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/Data.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String name = "safasf";

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Beğendiğim Yerler', style: TextStyle(color: Colors.white,fontSize: 16.h)),
            backgroundColor: Colors.blue,
             iconTheme: IconThemeData(color: Colors.white), // İkon rengi
            automaticallyImplyLeading: true,
          ),
          body: FavoriteList(),
        );
      },
    );
  }
}

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritePlaces = Data.favoritePageList;

    if (favoritePlaces.isEmpty) {
      return Center(
        child: Text(
          "Henüz bir yer eklemediniz",
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
               index == 1 ? SizedBox() : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                  child: Container(color: Color.fromARGB(255, 194, 193, 193),height: 1,),
                ),
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
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 41, 41, 41)
                            .withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 12,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 190.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      value[2], // Resim URL'si map'den alınıyor
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 8.0),
                    const Icon(Icons.location_on_rounded, color: Colors.blue),
                    SizedBox(width: 5.0),
                    Text(
                      "${value[0]} / ${value[1]}", // Şehir ve yer adı map'den alınıyor
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 45.0),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
