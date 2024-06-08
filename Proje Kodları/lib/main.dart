import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const ProviderScope(child : MyApp() ));
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      
      home: Scaffold(
      
      body:  Padding(
        padding: EdgeInsets.only(),
        child: ProviderScope(child: Material(child: LoginPage())),
      ),
      )
     
    );
}


  


