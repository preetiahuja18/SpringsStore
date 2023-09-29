import 'package:flower_store/UI/signIn.dart';
import 'package:flutter/material.dart';

import 'UI/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flower Store',
 
  home: SplashScreen(),
);

  }
}


