import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:travel_app/Data.dart';
import 'package:travel_app/login_page.dart';
import 'package:travel_app/personProvider.dart';


const String dbUrl = "mongodb+srv://user123:user4455@cluster0.uqmxe8p.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
const String tableName = "Users";


class DataBase{

static Future<bool> CreateAccount(String userName,String email, String password) async {



try{
var db = await Db.create(dbUrl);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(tableName);
    var deger = await collection.insertMany([
      {"name":"$userName","email": "$email", "password": "$password", "fvFly": {},"fvPlace":{}}
    ]);
    print(await collection.find().toList());
    print("kayıt basarısı");
    return true;
}
catch(expection){
print(expection);
return false;
}



}



//kayıt ol kısmında kullanıcının zaten veritabanında hesabı varmı kontrolu
  static Future<bool> SingUpUsersControl(
      String url, String tableName, String email) async {
    var db = await Db.create(url);
    await db.open();
    inspect(db);
    var status = db.serverStatus();

    var collection = db.collection(tableName);
    var deger = await collection.findOne({"email": email});

    // Eğer deger null değilse ve "isim" alanı email değerine eşitse true döndür
    if (deger != null) {
      print("kontrol dogru");
   return true;
    } else {
      print("kontrol yanlıs");
      return false;
    }
    
  }










 //Kullanıcı giris yaparken veritabanında hesap varmı Kontrolu
  static Future<bool> LoginUsersControl(WidgetRef ref,
      String url, String tableName, String email, String sifre) async {
    var db = await Db.create(url);
    await db.open();
    inspect(db);
    var status = db.serverStatus();

    var collection = db.collection(tableName);
    var deger = await collection.findOne({"email": email, "password": sifre});
    var deger2 = await collection.findOne({ "email": email,"fvFly": null, "fvPlace": null}); 
     
    final query = where.eq('email', email);
    final result = await collection.findOne(query);
    ref.watch(now_userNameProvider.notifier).state = result!['name'];

      print("1.sorgu bitt");
     //Kullanıcının verilerini uygulamaya girişte çekmek
var bosmu1 = result["fvPlace"];
var bosmu2 = result["fvFly"];
print(bosmu1.runtimeType);
print(bosmu1.toString());


  if(bosmu1.toString() == "{}"&& bosmu2.toString() == "{}"){
    print("1.if");
  
  }
  else if(bosmu2.toString() == "{}"){
    print("2.if");
    var fvpMap = result['fvPlace'];
    Map<String,dynamic> result1 = fvpMap["0"];
    result1.forEach((key, value) {
 // print('$key: $value');
  Data.favoritePageList [key] = value;
});

  }

  else if(bosmu1.toString() == "{}" ){

   print("3.if");
     var flyMap = result['fvFly'];
    Map <String,dynamic> result2 = flyMap["0"];
    result2.forEach((key, value) {
 //  print('$key: $value');
  Data.PlannedFlyList [key] = value;
});}

   else{
print("else yeniii çalıştı");
var fvpMap = result['fvPlace'];
    var flyMap = result['fvFly'];
    
    Map<String,dynamic> result1 = fvpMap["0"];
    Map <String,dynamic> result2 = flyMap["0"];
     
 result1.forEach((key, value) {
 // print('$key: $value');
  Data.favoritePageList [key] = value;
});


result2.forEach((key, value) {
 //  print('$key: $value');
  Data.PlannedFlyList [key] = value;
});
   }

   





 
    
    

 
   
      
 print("2.sorgu bitt");
    // Eğer deger null değilse ve "isim" alanı email değerine eşitse true döndür
    if (deger != null) {
      return true;
    } else {
      return false;
    }
    // return deger != null && deger["isim"] == email;
  }

  

 //Kullanıcı giris yaparken verilerini aktarma
  static Future<String> LoginGetUserData(WidgetRef ref,
      String url, String tableName, String email) async {
    var db = await Db.create(url);
    await db.open();
    inspect(db);
    var status = db.serverStatus();

    var collection = db.collection(tableName);
  
    final query = where.eq('email', email);
    final result = await collection.findOne(query);
    return result!['name'];
    
  }


    //Seçilen mekanı veritabanında favori mekanlara ekleme kodu
  static Future<void> InsertfavoritePlace(
    String email, Map map,String attribute) async {
    var db = await Db.create(dbUrl);
    await db.open();
    inspect(db);
    var status = db.serverStatus();

    var collection = db.collection(tableName);

   
    final query = where.eq('email', email,
    );

    final update = {
      '\$set': {"$attribute.0": map},
    };
  

    await collection.update(query, update);

    await db.close();
  }

}




