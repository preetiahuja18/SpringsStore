

import 'package:flower_store/UI/signIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
         Stack(
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  Positioned(
      top: 10.0,
      left: 16.0,
     // bottom: 10.0,
      
      child: Container(
        padding: EdgeInsets.only(right:16.0),
        width: 34.0,
        height: 34.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        child: Positioned( top: 55.0,
      left: 25.0,
          child: IconButton(
            icon: Icon(
              Icons.logout,
              size: 24,
              color: Colors.black,
            ),
            onPressed: () {
                 showModalBottomSheet(context:context,builder:(context){
                  return Container(
                      decoration: BoxDecoration( borderRadius:BorderRadius.vertical(top: Radius.circular(70)),),
              padding: EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height * 0.3,
             child: ClipRRect(
           borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_down, size: 30),
              ),
              SizedBox(height: 20),
             Center(child: Text('Do you really want to log-out?',style:TextStyle(fontSize:16,color:Colors.black))),
             SizedBox(height:30),
              Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16.0),
                              
                              //width: 174,
                              child:ElevatedButton(
                              onPressed: () {
                            Navigator.of(context).push(
                             MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.black),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text("No",style:TextStyle(color: Colors.black)),
              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 16.0),
                              // height: 48,
                              // width: 174,
                              child: ElevatedButton(
                              onPressed: () {
                            Navigator.of(context).push(
                             MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
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
                child: Text("Yes"),
              ),
                            ),
                          ],
                        ),
           ],
          ),
        ),
      );
                 });
              
            },
          ),
        ),
      ),
    ),
  ],
),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.topCenter, 
                children: [
                  Positioned(
                    top: -10,
                    child: Container(
                      width: 100, 
                      height: 100, 
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //color: Colors.red,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/picc.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90, 
                    child: Text(
                      'Shynaa sharma',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                // SizedBox(height:50),
                  Padding(
                    padding: const EdgeInsets.only(top: 146.0, left: 25.0,right:25.0 ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         GestureDetector(
                          onTap:(){         Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditPage(),
                      ),
                    );},
                           child: Row(
                           children: [
                              Padding(
                               padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                               child: Icon(
                             Icons.person_2_outlined, 
                             color: Colors.black, 
                            size: 24.0, 
                                                ),
                            ),
                           Expanded(
                             child: ListTile(
                                          title: Text('Personal Information',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,size: 20,
                                  color: Colors.black, 
                                ),
                                onPressed: () {
                                 Navigator.of(context).push(
                                         MaterialPageRoute(
                                           builder: (context) => EditPage(),
                                         ),
                                       );
                                },
                              ),),
                           ),
                              ],
                              ),
                         ),
                              Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
                        GestureDetector(
                          onTap:(){ Navigator.of(context).push(
                                              MaterialPageRoute(
                          builder: (context) => OrdersPage(),
                                              ),
                                            );},
                          child: Row(
                           children: [
                              Padding(
                               padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                               child: Icon(
                             Icons.shopping_bag_outlined, 
                             color: Colors.black, 
                            size: 24.0, 
                                               ),
                            ),
                                              Expanded(
                                              child: ListTile(
                                               title: Text('Orders',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                                               trailing:  IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,size: 20,
                                color: Colors.black, 
                              ),
                              onPressed: () {
                               Navigator.of(context).push(
                                              MaterialPageRoute(
                          builder: (context) => OrdersPage(),
                                              ),
                                            );
                              },
                            ),
                                              ),
                                         ),
                                         ],
                                      ),
                        ),
                                     Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
                        Row(
                         children: [
                            Padding(
                             padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                             child: Icon(
                           Icons.settings_outlined, 
                           color: Colors.black, 
                          size: 24.0, 
                       ),
                          ),
                      Expanded(
                      child: ListTile(
                       title: Text('App Settings',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                       trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,size: 20,
                              color: Colors.black, 
                            ),
                            onPressed: () {
                      //        Navigator.of(context).push(
                      // MaterialPageRoute(
                      //   builder: (context) => OrdersPage(),
                     // ),
                   // );
                            },
                          ),
                      ),
                                       ),
                                       ],
                                    ),
                                     Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
                        GestureDetector(onTap:(){ Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LanguagePage(),
                      ),
                    );},
                          child: Row(
                           children: [
                              Padding(
                               padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                               child: Icon(
                             Icons.translate_outlined, 
                             color: Colors.black, 
                            size: 24.0, 
                                               ),
                            ),
                                              Expanded(
                                              child: ListTile(
                                               title: Text('Change Language',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                                               trailing: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,size: 20,
                                color: Colors.black, 
                              ),
                              onPressed: () {
                               Navigator.of(context).push(
                                              MaterialPageRoute(
                          builder: (context) => LanguagePage(),
                                              ),
                                            );
                            
                              },
                            ),
                                              ),
                                         ),
                                         ],
                                      ),
                        ),
                                     Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
                        Row(
                         children: [
                            Padding(
                             padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                             child: Icon(
                           Icons.account_balance_outlined ,
                           color: Colors.black, 
                          size: 24.0, 
                       ),
                          ),
                      Expanded(
                      child: ListTile(
                       title: Text('Wallet',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                       trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,size: 20,
                              color: Colors.black, 
                            ),
                            onPressed: () {
                    //          Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => OrdersPage(),
                    //   ),
                    // );
                            },
                          ),
                      ),
                            ),
                                       ],
                                    ),
                                     Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
                        Row(
                         children: [
                            Padding(
                             padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                             child: Icon(
                           Icons.live_help_outlined, 
                           color: Colors.black, 
                          size: 24.0, 
                       ),
                          ),
                      Expanded(
                      child: ListTile(
                       title: Text('FAQs',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                       trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,size: 20,
                              color: Colors.black, 
                            ),
                            onPressed: () {
                    //          Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => OrdersPage(),
                    //   ),
                    // );
                            },
                          ),
                      ),
                                       ),
                                       ],
                                    ),
                                     Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
                        Row(
                         children: [
                            Padding(
                             padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                             child: Icon(
                           Icons.phone_outlined, 
                           color: Colors.black, 
                          size: 24.0, 
                       ),
                          ),
                      Expanded(
                      child: ListTile(
                       title: Text('Need help? Contact Us',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                       trailing:IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,size: 20,
                              color: Colors.black, 
                            ),
                            onPressed: () {
                    //          Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => OrdersPage(),
                    //   ),
                    // );
                            },
                          ),
                      ),
                                       ),
                                       ],
                                    ),
                                     Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
                          Row(
                         children: [
                            Padding(
                             padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                             child: Icon(
                           Icons.info_outline, 
                           color: Colors.black, 
                          size: 24.0, 
                       ),
                          ),
                      Expanded(
                      child: ListTile(
                       title: Text('About Us',style: GoogleFonts.laila(fontSize: 17,color: Colors.black),),
                       trailing:IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,size: 20,
                              color: Colors.black, 
                            ),
                            onPressed: () {
                    //          Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => OrdersPage(),
                    //   ),
                    // );
                            },
                          ),
                      ),
                                       ),
                                       ],
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

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController(text: 'Shynaa Sharma');
  TextEditingController PhoneController = TextEditingController(text: '+1-202-555-0178');
  TextEditingController emailController = TextEditingController(text: 'shynasharma@gmail.com');
  TextEditingController primaryAddressController = TextEditingController(text: '567g, 34 Street, Alogoia, Hermenia, US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10.0,
                left: 16.0,
                child: Container(
                  padding: EdgeInsets.only(right: 16.0),
                  width: 34.0,
                  height: 34.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: Positioned(
                    top: 55.0,
                    left: 25.0,
                    child: IconButton(
            icon: Icon(
              Icons.logout,
              size: 24,
              color: Colors.black,
            ),
            onPressed: () {
                 showModalBottomSheet(context:context,builder:(context){
                  return Container(
                      decoration: BoxDecoration( borderRadius:BorderRadius.vertical(top: Radius.circular(70)),),
              padding: EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height * 0.3,
             child: ClipRRect(
           borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_down, size: 30),
              ),
              SizedBox(height: 20),
             Center(child: Text('Do you really want to log-out?',style:GoogleFonts.laila(fontSize:16,color:Colors.black))),
             SizedBox(height:30),
              Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16.0),
                              
                              //width: 174,
                              child:ElevatedButton(
                              onPressed: () {
                            Navigator.of(context).push(
                             MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle: GoogleFonts.laila(fontSize: 20, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.black),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text("No",style:GoogleFonts.laila(color: Colors.black)),
              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 16.0),
                              // height: 48,
                              // width: 174,
                              child: ElevatedButton(
                              onPressed: () {
                            Navigator.of(context).push(
                             MaterialPageRoute(
                      builder: (context) => SignUp(),
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
                child: Text("Yes"),
              ),
                            ),
                          ],
                        ),
              
            ],
          ),
        ),
      );
                 });
              
            },
          ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
               width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: -10,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/picc.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    child: Text(
                      'Shynaa Sharma',
                      style: GoogleFonts.laila(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  
                  Positioned(
                    top: 130,
                    left: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Edit Your Personal Information -',
                          style: GoogleFonts.laila(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 180.0, left: 25.0, right: 25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    labelStyle: GoogleFonts.laila(color: Colors.black),
                                    hintStyle: GoogleFonts.laila(color: Colors.black),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.grey,
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // "Your Name" text
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Your Name',
                              style: GoogleFonts.laila(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: PhoneController,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    labelStyle: GoogleFonts.laila(color: Colors.black),
                                    hintStyle: GoogleFonts.laila(color: Colors.black),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.grey,
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // "Your Name" text
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Phone Number',
                              style: GoogleFonts.laila(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    labelStyle: GoogleFonts.laila(color: Colors.black),
                                    hintStyle: GoogleFonts.laila(color: Colors.black),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.grey,
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // "Your Name" text
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Email Address',
                              style: GoogleFonts.laila(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: primaryAddressController,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    labelStyle: GoogleFonts.laila(color: Colors.black),
                                    hintStyle: GoogleFonts.laila(color: Colors.black),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.grey,
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // "Your Name" text
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Primary Address',
                              style: GoogleFonts.laila(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 16.0),
                                
                                //width: 174,
                                child:ElevatedButton(
                                onPressed: () {
                              Navigator.of(context).push(
                               MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: GoogleFonts.laila(fontSize: 20, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Discard",style:GoogleFonts.laila(color: Colors.black)),
                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 16.0),
                                // height: 48,
                                // width: 174,
                                child: ElevatedButton(
                                onPressed: () {
                              Navigator.of(context).push(
                               MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
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
                  child: Text("Save"),
                ),
                              ),
                            ],
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


class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class Order {
  final String imageUrl;
  final String deliveryDate;
  final double totalPrice;
  final String storeName;
  final String orderStatus;
  final Color orderStatusColor; 

  Order({
    required this.imageUrl,
    required this.deliveryDate,
    required this.totalPrice,
    required this.storeName,
    required this.orderStatus,
    required this.orderStatusColor, 
  });
}


class _OrdersPageState extends State<OrdersPage> {
List<Order> orders = [
  Order(
    imageUrl: 'assets/images/prod1.png',
    deliveryDate: ' on Jan 24, 2023',
    totalPrice: 199.0,
    storeName: 'Circle Bloom',
    orderStatus: 'Delivered',
    orderStatusColor: Color(0xff0F9D58), 
  ),
  Order(
      imageUrl: 'assets/images/prod1.png',
    deliveryDate: 'on Jan 25, 2023',
    totalPrice: 149.0,
    storeName: 'Example Store',
    orderStatus: 'Cancelled',
    orderStatusColor: Color(0xffAA5656), 
  ),
  Order(
      imageUrl: 'assets/images/prod1.png',
    deliveryDate: 'on Feb 1, 2023',
    totalPrice: 299.0,
    storeName: 'Another Store',
    orderStatus: 'Received',
    orderStatusColor: Colors.yellow, 
  ),
];

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        iconSize: 20,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        'Your Orders',
        style: GoogleFonts.laila(fontSize: 20, color: Colors.black),
      ),
    ),
   body: ListView.builder(
  itemCount: orders.length,
  itemBuilder: (context, index) {
    final order = orders[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    height: 100,
                    width: 90,
                    order.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: -5,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: order.orderStatusColor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: order.orderStatus + ' ',
                              style: GoogleFonts.laila(
                                color: order.orderStatusColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: order.deliveryDate,
                              style: GoogleFonts.laila(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      GestureDetector(
                         onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => TrackOrder(),
                  ));
                },
                        child: Text(
                          'Track Order',
                          style: GoogleFonts.laila(
                            color: Color(0xffAA5656),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        '\$${order.totalPrice}',
                        style: GoogleFonts.laila(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        order.storeName,
                        style: GoogleFonts.laila(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ), 
            ],
          ),Opacity(
                      opacity: 0.1, // 10% opacity
                                     child: Divider(
                                      color: Colors.black,
                      thickness: 1.0,
                      ),
                       ),
        ],
      ),
       
    );
    
  },
),


  );
}
}    
       




class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  // Sample list of languages
  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Chinese',
    'Japanese',
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Chinese',
    'Japanese',
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Chinese',
    'Japanese',
  ];

  String selectedLanguage = 'English'; // Default selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 20,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Choose Your Language',
          style: GoogleFonts.laila(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          buildSearchBar(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  selectedLanguage,
                  style: GoogleFonts.laila(fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Opacity(
            opacity: 0.3, // 10% opacity
            child: Divider(
              color: Colors.grey,
              thickness: 10.0,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final language = languages[index];
                return ListTile(
                  leading: selectedLanguage == language
                      ? Icon(Icons.check_circle, size: 20)
                      : Icon(Icons.circle_outlined, size: 20),
                  minLeadingWidth: 5,
                  title: Text(language),
                  onTap: () {
                    setState(() {
                      selectedLanguage = language;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // Save button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              textStyle: GoogleFonts.laila(fontSize: 20, color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            ),
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}

Widget buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Search Language",
        hintStyle: GoogleFonts.laila(fontSize: 18),
      
        suffixIcon: Icon(Icons.mic, size: 24, color: Colors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        
        fillColor: Color(0xffF5EBE0), 
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    ),
  );
}
class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 20,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Track Your Order',
          style: GoogleFonts.laila(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          
          Container(
            height: 200, 
           
            color: Colors.grey, 
          ),
          SizedBox(height: 50),
          Column(
            children: [

              Row(
                children: [
                  Icon(
                    Icons.check_box,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 10),
                  Text("Order received on Jan 2023",style: GoogleFonts.laila(fontSize: 20),),
                ],
              ),
              SizedBox(height: 20), 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 2,
                      color: Colors.black,
                    ),SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 2,
                      color: Colors.black,
                    ),SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 2,
                        color: Colors.black,
                    ),SizedBox(height: 5),
                  
                  
                  ],
                ),
              ),
              SizedBox(height: 20), 
              Row(
                children: [
                  Icon(
                    Icons.present_to_all_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text("Order is on your way",style: GoogleFonts.laila(fontSize: 16),),
                ],
              ),
              SizedBox(height: 10), 
              Column(
                children: [
                    Container(
                      height: 10,
                      width: 2,
                      color: Colors.black,
                    ),SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 2,
                      color: Colors.black,
                    ),SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 2,
                        color: Colors.black,
                    ),SizedBox(height: 5),
                 
                ],
              ),
              SizedBox(height: 20), 
              Row(
                children: [
                  Icon(
                    Icons.check_box_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  Text("Order will be delivered by Jan 16",),
                ],
              ),
              SizedBox(height: 10),
              // Text(
              //   "123 Main Street, City, Country",
              //   style: TextStyle(fontSize: 16),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

