import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/HomePage.dart';
import 'package:travel_app/login_page.dart';

void main() {
  runApp(ProviderScope(child : MyApp() ));
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      
      home: Scaffold(
      
      body:  Padding(
        padding: const EdgeInsets.only(),
        child: ProviderScope(child: Material(child: LoginPage())),
      ),
      )
     
    );
}


  


