
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_store/UI/productphoto.dart';
import 'package:flower_store/models/flowerDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  final String id;
 ProductDetail({required this.id });

@override
  State<ProductDetail> createState() => _ProductDetailState();
}
class _ProductDetailState extends State<ProductDetail> {
    late Future<FlowerDetail> flowerDetailFuture;
 @override
  void initState() {
    super.initState();
    flowerDetailFuture = fetchFlowerDetails(widget.id);
  }
Future<FlowerDetail> fetchFlowerDetails(String id) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('flowerDetails')
        .where('id', isEqualTo: '1') 
        .get();

    if (querySnapshot.docs.isNotEmpty) {
    
      DocumentSnapshot document = querySnapshot.docs.first;
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        print("Flower Detail ID: ${data['id']}");
      print("Flower Name: ${data['flowerName']}");
       return FlowerDetail(
        id: data['id'],
        flowerName: data['flowerName'],
        flowerDescription: data['flowerDescription'],
        flowerImage: data['flowerImage'],
        flowerPrice: data['flowerPrice'].toDouble(),
        items: data['items'],
        review: data['review'],
        shippingCharges: data['shippingCharges'].toDouble(),
        deliveryDate: data['deliveryDate'],
        oldFlowerPrice: data['oldFlowerPrice'],
      );
    } else {
      throw Exception('Flower details not found');
    }
  } catch (e) {
    print('Error fetching flower details: $e');
    throw e;
  }
}

    

void _showLocationChangeModal() {
  TextEditingController addressController = TextEditingController(text: '123 Main St, City, Country');

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(

       decoration: BoxDecoration( borderRadius:BorderRadius.vertical(top: Radius.circular(70)),),
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_down, size: 30),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4),
                  Text('Add Location', style: GoogleFonts.laila
                  (fontSize: 17, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: addressController, 
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
                  Container(height: 30,width: 32,
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
              SizedBox(height: 80),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    textStyle: GoogleFonts.laila(fontSize: 20, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Done"),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      );
    },
  );
}
 bool isDrawerOpen = false;
void openDrawer() {
    setState(() {
      isDrawerOpen = true;
    });
  }
void closeDrawer() {
    setState(() {
      isDrawerOpen = false;
    });
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   bool isAddedToBag = false;
@override
  Widget build(BuildContext context) {
    return Scaffold(
     endDrawerEnableOpenDragGesture:false ,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              iconSize: 20,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 2),
            Expanded(
              child: Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sending To - ',
              style: GoogleFonts.laila(fontSize: 17, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   //dummyAddress,
                //   style: GoogleFonts.laila(fontSize: 13, color: Colors.black),
                // ),
                GestureDetector(
                    onTap: _showLocationChangeModal,
                  child: Text(
                    'CHANGE',
                    style: GoogleFonts.laila(fontSize: 10, color: Color(0xffAA5656), decoration: TextDecoration.underline),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: FutureBuilder<FlowerDetail?>(
        future: flowerDetailFuture,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); 
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data == null)  {
            return Text('Flower details not found.');
          } else {
            final flowerDetail = snapshot.data as FlowerDetail;
        
          
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(onTap: () {
        //                  Navigator.of(context).push(
        //                  MaterialPageRoute(
        //                  builder: (context) => ProductImageViewer(
        //                    imagePaths: flowerDetail.flowerImage, // List of image paths
        //                    initialIndex: 0, 
        //   ),
        // ),
        //   );
        },
                          child: Container(
                            width: 263,
                            height: 263,
                            child: Image.asset('assets/images/prod1.png', fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        SizedBox(
                          width: 71,
                          height: 71,
                          child: Image.asset('assets/images/prod11.png'),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: 71,
                          height: 71,
                          child: Image.asset('assets/images/prod12.png'),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: 71,
                          height: 71,
                          child: Image.asset('assets/images/prod13.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        flowerDetail.flowerName,
                        style: GoogleFonts.laila(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width:5),
                        Text('Delivery Date -',style: GoogleFonts.laila(fontSize: 16 ),),SizedBox(width:5),
                        Text(flowerDetail.deliveryDate,style: GoogleFonts.laila(fontSize: 13 ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width:5),
                        Text('Shipping Charges -',style: GoogleFonts.laila(fontSize: 16 ),),SizedBox(width:12),
                        Text('\$${flowerDetail.shippingCharges}',style: GoogleFonts.laila(fontSize: 13 ),)
                      ],
                    ),
                    SizedBox(height:10),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Description',style: GoogleFonts.laila(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                        GestureDetector(
                        onTap: () {
                       _scaffoldKey.currentState!.openEndDrawer(); 
                        },
                          child: Text('How to take Care?',style: GoogleFonts.laila(fontSize: 13,decoration: TextDecoration.underline,
                            color: Color(0xffAA5656),fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
        
                    Text(flowerDetail.flowerDescription,
                      style: GoogleFonts.laila(fontSize: 16,),),
        
                    SizedBox(height: 8,),
                    Align(alignment: Alignment.centerLeft,
                      child: Text(
                        'What’s included?',style: GoogleFonts.laila(fontSize: 17,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        flowerDetail.items,style: GoogleFonts.laila(fontSize: 16),
                      ),
                    ),
                  ],
                  
        
                ),
                SizedBox(height: 10,),
         ElevatedButton(
          
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to Bag'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating, 
        ),
          );
          setState(() {
        isAddedToBag = true;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFAA8B56),
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(350, 70),
        ),
        child: isAddedToBag
        ? CustomButtonSecond()
        : CustomButtonContent(),
      ),
      
          SizedBox(height: 10,),
          Text('Contact',style: GoogleFonts.laila(fontSize: 17,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Row(
            children: [
              Text('Email : ',style: GoogleFonts.laila(fontSize: 16,decoration: TextDecoration.underline,color: Colors.black),),
              SizedBox(width: 5,),
              Text(
                        "store16springs@gmail.com",style: GoogleFonts.laila(fontSize: 16),
                      ),
            ],
          ),
          SizedBox(height: 8,),
           Row(
            children: [
              Text('Phone : ',style: GoogleFonts.laila(fontSize: 16,decoration: TextDecoration.underline,color: Colors.black),),
              SizedBox(width: 5,),
              Text(
                  "+91 9842524612",style: GoogleFonts.laila(fontSize: 16),
                      ),
            ],
          ),
          SizedBox(height: 10,),
          Text('Reviews',style: GoogleFonts.laila(fontSize: 17,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
             Row(
           children: [
              Icon(
               Icons.star,
          color: Colors.orange,
          size: 16,
            ),
            SizedBox(width: 5),
          Text(
           flowerDetail.review as String,
          style: GoogleFonts.laila(fontSize: 16),
            ),
          ],
        ),
        SizedBox(width: 15),
          Row(
        children: [
          Icon(
            Icons.star_border,
            color: Colors.black87,
            size: 36,
          ),
          SizedBox(width: 8,),
           Icon(
            Icons.star_border,
            color: Colors.black87,
            size: 36,
          ),
           SizedBox(width: 8,),
           Icon(
            Icons.star_border,
            color: Colors.black87,
            size: 36,
          ),
           SizedBox(width: 8,),
           Icon(
            Icons.star_border,
            color: Colors.black87,
            size: 36,
          ),
           SizedBox(width: 8,),
           Icon(
            Icons.star_border,
            color: Colors.black87,
            size: 36,
          ),
        ],
          ),
      
          SizedBox(height: 8,),
          Text('Rate our product',style: GoogleFonts.laila(fontSize: 16),),
           SizedBox(height: 15,),
          Text('You may also Like',style: GoogleFonts.laila(fontSize: 17,fontWeight: FontWeight.bold),),
          // SizedBox(height: 8),
          //  SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: RefProductImages.map((imagePath) {
          //       return Padding(
          //         padding: EdgeInsets.only(right: 8.0),
          //         child: buildRefCard(
          //           imagePath,
          //            'Rose Bouquet',
          //           '\$25.99',
          //           cardWidth: 135,
          //           cardHeight: 160,
          //         ),
          //       );
          //     }).toList(),
          //   ),
          // ),
      
              ],
              
            ),
          ),
              );}}
      ),
  
       endDrawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios,size:20),
                  Text(
                    'How to take care',
                    style: TextStyle(
                      color: Color(0xff4E6C50),
                      
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: RichText(
              text: TextSpan(
            
              children: <TextSpan>[
              TextSpan(
             text: '1. Find a Vase-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: ' You may have noticed your flowers no longer have roots, and that they\'re not in soil. Bet they\'re thirsty! Time to put them in your favorite vase with some fresh water.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            ),
            
              onTap: () {
               
                closeDrawer(); 
              },
            ),
            SizedBox(height:10),
              ListTile(
              title: RichText(
              text: TextSpan(
            
              children: <TextSpan>[
              TextSpan(
             text: '2.Trim Those Stems -',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
       TextSpan(
        text: ' - Keep those stems trimmed! Always cut your flowers at an angle so they can absorb more water & won\'t suffocate on the bottom of the vase. After the initial cut, check the bottoms of your stems every couple of days, and if the ends are looking a bit slimy, just snip off an inch or so.',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 17,
        ),
      ),
    ],
  ),
),

              onTap: () {
               
                closeDrawer(); 
              },
            ),  SizedBox(height:10),
              ListTile(
              title: RichText(
              text: TextSpan(
            
              children: <TextSpan>[
               TextSpan(
        text: '3.Remove Leaves',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      TextSpan(
        text: ' - Take off any excess leaves so that all the water is funneled into the petals. Pay special attention to leaves below the water line because they\'ll decompose, causing rot and bacteria to grow, which will shorten the lifespan of your blooms.',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 17,
        ),
      ),
    ],
  ),
),

              onTap: () {
               
                closeDrawer(); 
              },
            ),  SizedBox(height:10),
              ListTile(
              title: RichText(
              text: TextSpan(
            
              children: <TextSpan>[
              TextSpan(
            text: '4.Remove Spent Blooms',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
          TextSpan(
        text: ' - Any flowers that are past their prime release ethylene gas which will age the flowers around them. Remove any flowers that are beginning to wilt to keep the rest of your bouquet fresh and happy.',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 17,
        ),
      ),
    ],
  ),
),

              onTap: () {
               
                closeDrawer(); 
              },
            ),
           
         
          ],
        ),
      ),
    
    );
  }
}
class CustomButtonSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$ 210',
          style: GoogleFonts.laila(
            fontSize: 16,
            decoration: TextDecoration.lineThrough,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 8),
        Text(
          '\$ 199',
          style: GoogleFonts.laila(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
          SizedBox(width: 20),
        Container(
          width: 0.5,
          height: 20,
          color: Colors.white,
        ),
          SizedBox(width: 20),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text(
          'Added to Bag',
          style: GoogleFonts.laila(
            color: Colors.white,
          //  fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
Widget buildRefCard(String imagePath, String productName, String productPrice,
    {double cardWidth = 135, double cardHeight = 200}) {
  return Padding(
    padding: EdgeInsets.only(right: 8.0),
    child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            GestureDetector(
                  onTap: () => {
                  //  Navigator.push(context as BuildContext, MaterialPageRoute(builder:  (context) => ProductDetail(title: '', address: '', deliveryDate: '',  description: '', includedItems: '', shippingCharges: 0.0, dummyEmail: '', dummyPhone: '', dummyReviews: '',))),
                  },
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size:15,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
               color: Colors.black.withOpacity(0.2),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productName,
                      style: GoogleFonts.laila(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      productPrice,
                      style: GoogleFonts.laila(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomButtonContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$ 210',
          style: GoogleFonts.laila(
            fontSize: 16,
            decoration: TextDecoration.lineThrough,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 8),
        Text(
          '\$ 199',
          style: GoogleFonts.laila(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
          SizedBox(width: 20),
        Container(
          width: 0.5,
          height: 20,
          color: Colors.white,
        ),
          SizedBox(width: 20),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text(
          'Add to Bag',
          style: GoogleFonts.laila(
            color: Colors.white,
          //  fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
