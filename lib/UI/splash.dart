import 'dart:async';

import 'package:flower_store/UI/signIn.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
      ()=>Navigator.pushReplacement(context,
       MaterialPageRoute(builder:
         (context) => 
             SplashScreenTwo()
           )
          )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Transform.scale(scale: 1.2,
        child: Image.asset('assets/images/screen0.png',
           
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,),
      ),
    );
  }
  
}
class SplashScreenTwo extends StatefulWidget {
  @override
  _SplashScreenTwoState createState() => _SplashScreenTwoState();
}
class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
      ()=>Navigator.pushReplacement(context,
       MaterialPageRoute(builder:
         (context) => 
             SplashScreenThree()
           )
          )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Transform.scale(scale: 1.2,
        child: Image.asset('assets/images/screen1.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,),
      ),
      
    );
  }
  
}

class SplashScreenThree extends StatefulWidget {
  @override
  _SplashScreenThreeState createState() => _SplashScreenThreeState();
}
class _SplashScreenThreeState extends State<SplashScreenThree> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
      ()=>Navigator.pushReplacement(context,
       MaterialPageRoute(builder:
         (context) => 
             SignIn()
           )
          )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Transform.scale(scale:1.2,
        child: Image.asset('assets/images/screen2.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,),
      ),
    );
  }
  
}

