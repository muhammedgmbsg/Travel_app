import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/HomePage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(appBar: AppBar(title: Text('Seyahat Uygulaması',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,)
      ,
      body:  ProviderScope(child: HomePage()),
      )
     
    );
  }
}


  


