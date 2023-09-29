import 'dart:async';

import 'package:flower_store/UI/homePage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late VideoPlayerController _controller;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/loginvideo.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
            _getBackgroundColor(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _getVideoBackground() {
    return Positioned.fill(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Transform.scale(
          scale: 1.2,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  Widget _getBackgroundColor() {
    return Container(
      color: Color.fromRGBO(245, 235, 224, 0.65),
    );
  }

  Widget _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 100.0,
        ),
        Center(
          child: Text(
            "Sign In",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter email",
                  labelText: "Email-id",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 320.0),
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
                    textStyle: TextStyle(fontSize: 20, color: Colors.white),
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
                  
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late VideoPlayerController _controller;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/loginvideo.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
            _getBackgroundColor(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _getVideoBackground() {
    return Positioned.fill(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Transform.scale(
          scale: 1.2,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  Widget _getBackgroundColor() {
    return Container(
      color: Color.fromRGBO(245, 235, 224, 0.65),
    );
  }

  Widget _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 100.0,
        ),
        Center(
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter email",
                  labelText: "Email-id",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Create a Strong Password",
                  hintText: "Enter Password",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Re-enter Password",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 320.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => _OTPScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    textStyle: TextStyle(fontSize: 20, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Get OTP"),
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
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
  late VideoPlayerController _controller;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/loginvideo.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
            _getBackgroundColor(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Widget _getVideoBackground() {
    return Positioned.fill(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Transform.scale(
          scale: 1.2,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  Widget _getBackgroundColor() {
    return Container(
      color: Color.fromRGBO(245, 235, 224, 0.65),
    );
  }

  Widget _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 130.0,
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
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        SizedBox(height: 100),
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
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
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
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 320.0),
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
                    textStyle: TextStyle(fontSize: 20, color: Colors.white),
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
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
      body: Center(
        child: Stack(
          children: <Widget>[
            _getPhotoBackground(),
            _getContent(),
          ],
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
          height: 420.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Add Your Name",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "You can change this information in account's settings.",
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ),
        ),
        SizedBox(height: 80),
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
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
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
                    textStyle: TextStyle(fontSize: 20, color: Colors.white),
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
                },
                child: Text(
                  'Skip to Shop!',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
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
      body: Center(
        child: Stack(
          children: <Widget>[
            _getPhotoBackground(),
            _getContent(),
          ],
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
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "You can change this information in account's settings.",
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ),
        ),
        SizedBox(height: 80),
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
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
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
                    textStyle: TextStyle(fontSize: 20, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Let's start blooming!"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
                },
                child: Text(
                  'Skip to Shop!',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
