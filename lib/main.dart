import 'package:flower_store/UI/checkout.dart';
import 'package:flower_store/UI/homePage.dart';
import 'package:flower_store/UI/productDetail.dart';
import 'package:flower_store/UI/signIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';

import 'UI/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flower Store',
 home:FutureBuilder(future: _initialization,
      builder: (context,snapshot){
        if(snapshot.hasError){
          print("error");
        }if(snapshot.connectionState ==ConnectionState.done){
          return HomePage();
        }return CircularProgressIndicator();
      

      },),);
  }
}


