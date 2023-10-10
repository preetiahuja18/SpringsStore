
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flower_store/UI/homePage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey=GlobalKey<FormState>();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();

  FirebaseAuth _auth =FirebaseAuth.instance;
   @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
      }

 void login() async {
  try {
    await _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString());

   
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  } catch (e) {
    
    Fluttertoast.showToast(
      msg: "Sign-in failed. Please check your credentials.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}

 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              _getImageBackground(),
              _getBackgroundColor(),
              _getContent(),
            ],
          ),
        ),
      ),
    );
  }

 
Widget _getImageBackground() {
  return Positioned.fill(
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: Transform.scale(
        scale: 1.5,
        child: Opacity(
          opacity: 0.65,
          child: Image.asset(
            'assets/images/sign.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
 Widget _getBackgroundColor() {
    return Positioned.fill(
      child: Container(
          height: MediaQuery.of(context).size.height*0.1,
        color: Color.fromRGBO(245, 235, 224, 0.65),
      ),
    );
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Center(
            child: Text(
              "Sign In",
              style: GoogleFonts.laila(
               fontSize: 30,
             fontWeight: FontWeight.w300,
    //           // fontStyle: FontStyle.italic,
             color: Colors.black),
                 
    //          
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
                key: _formKey,
             
              child: Column(
                children: <Widget>[
                  TextFormField(
                                        validator: (value){
                      if(value!.isEmpty){
                        return 'Enter email';
                      }return null;
                    },
                     keyboardType: TextInputType.emailAddress,
                    controller: emailController ,
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      labelText: "Email-id",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelStyle: GoogleFonts.laila(
                             fontSize: 16,
                             fontWeight: FontWeight.w400,
                //                         // fontStyle: FontStyle.italic,
                              color: Colors.black),
                      hintStyle:GoogleFonts.laila(
                                  fontSize: 12,
                                 fontWeight: FontWeight.w400,
                       
                             color: Colors.black),
                //                  
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.text,
                  controller: passwordController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter password';
                    }
                    return null;
                  },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                                       labelStyle: GoogleFonts.laila(
                             fontSize: 16,
                             fontWeight: FontWeight.w400,
                                //                         // fontStyle: FontStyle.italic,
                              color: Colors.black),
                      hintStyle:GoogleFonts.laila(
                                  fontSize: 12,
                                 fontWeight: FontWeight.w400,
                       
                             color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                 // SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 330.0),
                    child: Container(
                      margin: EdgeInsets.only(top:1.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            login();
                          }
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => NameDetails(),
                          //   ),
                         // );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          textStyle: GoogleFonts.laila(
                             fontSize: 17,
                              fontWeight: FontWeight.w600,
                                          color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        ),
                        child: Text("Next"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.laila(
                             fontSize: 16,
                             fontWeight: FontWeight.w700,
                       
                               color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sign up",
                            style:GoogleFonts.laila(
                             fontSize: 16,
                             fontWeight: FontWeight.w700,
                       
                               color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey=GlobalKey<FormState>();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
 

  FirebaseAuth _auth =FirebaseAuth.instance;
   bool _isPasswordVisible=false;

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
      }
 

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              _getImageBackground(),
                _getBackgroundColor(),
              _getContent(),
            ],
          ),
        ),
      ),
    );
  }
Widget _getImageBackground() {
  return Positioned.fill(
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: Transform.scale(
        scale: 1.5,
        child: Opacity(
          opacity: 0.65,
          child: Image.asset(
            'assets/images/sign.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
Widget _getBackgroundColor() {
    return Positioned.fill(
      child: Container(
          height: MediaQuery.of(context).size.height*0.1,
        color: Color.fromRGBO(245, 235, 224, 0.65),
      ),
    );
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
           SizedBox(
          height: 100.0,
        ),
          Center(
            child: Text(
              "Sign Up",
             style: GoogleFonts.laila(
             fontSize: 30,
           fontWeight: FontWeight.w300,
//           // fontStyle: FontStyle.italic,
           color: Colors.black),
               
//          
          ),
        ),
        SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController ,
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      labelText: "Email-id",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                       
                    labelStyle: GoogleFonts.laila(
                           fontSize: 16,
                           fontWeight: FontWeight.w400,
            //                         // fontStyle: FontStyle.italic,
                            color: Colors.black),
                    hintStyle:GoogleFonts.laila(
                                fontSize: 12,
                               fontWeight: FontWeight.w400,
                     
                           color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter email';
                      }return null;
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
            keyboardType: TextInputType.text,
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: "Create a Strong Password",
              hintText: "Enter Password",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              labelStyle: GoogleFonts.laila(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              hintStyle: GoogleFonts.laila(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Re-enter Password",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              labelStyle: GoogleFonts.laila(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              hintStyle: GoogleFonts.laila(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 255.0),
            child: Container(margin: EdgeInsets.only(top:1.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                    ).catchError((error) {
                      if (error is FirebaseAuthException) {
                        if (error.code == 'email-already-in-use') {
                          Fluttertoast.showToast(
                            msg: "Email is already in use. Please use a different email.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      }
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => _OTPScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text("Get OTP"),
              ),
            ),
          ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.laila(
                         fontSize: 17,
                          fontWeight: FontWeight.w600,
                       color: Colors.black),
                     
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sign In",
                            style: GoogleFonts.laila(
                         fontSize: 17,
                          fontWeight: FontWeight.w600,
                                      color: Colors.black),
                     
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OTPScreen extends StatefulWidget {
  const _OTPScreen({Key? key});

  @override
  State<_OTPScreen> createState() => __OTPScreenState();
}

class __OTPScreenState extends State<_OTPScreen> {
  late int secondsLeft;
  late Stream<int> timerStream;
  late StreamSubscription<int> timerSubscription;
 
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    
    secondsLeft = 59;
    timerStream = Stream.periodic(Duration(seconds: 1), (count) => secondsLeft - count)
        .takeWhile((remainingTime) => remainingTime >= 0);
    timerSubscription = timerStream.listen((remainingTime) {
      setState(() {
        secondsLeft = remainingTime;
      });
    });
  }

  @override
  void dispose() {
    timerSubscription.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
               _getImageBackground(),
              _getBackgroundColor(),
              _getContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageBackground() {
  return Positioned.fill(
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: Transform.scale(
        scale: 1.5,
        child: Opacity(
          opacity: 0.65,
          child: Image.asset(
            'assets/images/sign.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
 Widget _getBackgroundColor() {
    return Positioned.fill(
      child: Container(
          height: MediaQuery.of(context).size.height*0.1,
        color: Color.fromRGBO(245, 235, 224, 0.65),
      ),
    );
  }
  Widget _getContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Center(
            child: Text(
              "Verify email-id",
              style: GoogleFonts.laila(
           fontSize: 30,
         fontWeight: FontWeight.w300,
//           // fontStyle: FontStyle.italic,
         color: Colors.black,)),
          ),
          SizedBox(height:MediaQuery.of(context).size.height*0.18,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter OTP",
                    labelText: "OTP",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                   labelStyle: GoogleFonts.laila(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
//                         // fontStyle: FontStyle.italic,
                        color: Colors.black),
                hintStyle:GoogleFonts.laila(
                            fontSize: 12,
                           fontWeight: FontWeight.w400,
       
                       color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '00:${secondsLeft.toString().padLeft(2, '0')} secs left',
                    style: GoogleFonts.laila(color: Colors.red, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 220.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NameDetails(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      textStyle:  GoogleFonts.laila(
                     fontSize: 17,
                      fontWeight: FontWeight.w600,
                                  color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text("Next"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-up screen
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ));
                  },
                  child: GestureDetector(
                    onTap: () {
                    
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => SignIn(),
                      // ));
                    },
                    child: Text(
                      'Resend OTP?',
                      style: GoogleFonts.laila(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NameDetails extends StatefulWidget {
  const NameDetails({Key? key});

  @override
  State<NameDetails> createState() => _NameDetailsState();
}

class _NameDetailsState extends State<NameDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              _getPhotoBackground(),
              _getContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPhotoBackground() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/screen3.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 400.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Add Your Name",
                style: GoogleFonts.laila(color: Colors.black, fontSize: 30,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "You can change this information in account's settings.",
                style: GoogleFonts.laila(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your full name",
                    labelText: "Full Name",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelStyle: GoogleFonts.laila(color: Colors.black),
                    hintStyle: GoogleFonts.laila(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(margin: EdgeInsets.only(top:1.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddressDetails(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        textStyle: GoogleFonts.laila(fontSize: 20, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text("Next"),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                  child: Text(
                    'Skip to Shop!',
                    style: GoogleFonts.laila(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressDetails extends StatefulWidget {
  const AddressDetails({Key? key});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              _getPhotoBackground(),
              _getContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPhotoBackground() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/screen3.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 400.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Add Your Address",
              style: GoogleFonts.laila(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "You can change this information in account's settings.",
              style: GoogleFonts.laila(color: Colors.black, fontSize: 10),
            ),
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your address",
                  labelText: "Address",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: GoogleFonts.laila(color: Colors.black),
                  hintStyle: GoogleFonts.laila(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.gps_fixed,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Use my Current Location',
                      style: GoogleFonts.laila(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Container(margin: EdgeInsets.only(top:1.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      textStyle: GoogleFonts.laila(fontSize: 20, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text("Let's start blooming!"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                },
                child: Text(
                  'Skip to Shop!',
                  style: GoogleFonts.laila(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
