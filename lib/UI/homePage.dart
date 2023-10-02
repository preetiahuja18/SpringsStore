import 'package:flower_store/UI/checkout.dart';
import 'package:flower_store/UI/occassion.dart';
import 'package:flower_store/UI/productDetail.dart';
import 'package:flower_store/UI/profilscreen.dart';
import 'package:flower_store/UI/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  bool showVideo = true;

  final pages = [
    const Page1(),
    const Page2(),
    const CheckOutScreen(),
    const ProfileScreen(),
  ];

  late VideoPlayerController _controller;
  List<String> bestSellingProductImages = [
  'assets/images/flower1.png',
   'assets/images/flower2.png',
    'assets/images/flower3.png',
     'assets/images/flower4.png',
      'assets/images/flower5.png',
];

List<String> recommendedProductImages = [
  'assets/images/flower6.png',
   'assets/images/flower7.png',
    'assets/images/flower8.png',
     'assets/images/flower9.png',
      'assets/images/flower10.png'
 
];


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/images/cat.mp4',
    )..initialize().then((_) {
      setState(() {});
      _controller.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      children: [
           if (pageIndex == 0)
       if (showVideo)
    Padding(
    padding: const EdgeInsets.all(5.0),
    child: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
           height: MediaQuery.of(context).size.height*0.089,
          width:MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(05, 25, 5, 8),
            child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: VideoPlayer(_controller),
      ),),
          
          Positioned(
            child: Center(
              child: GestureDetector(
                onTap :(){Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => CatalogueProducts(),
                  ));} ,
                child: Text(
                  "Catalogue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    ),
    
      //  SizedBox(height: 5),
        if (pageIndex == 0)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "By Occasion",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        if (pageIndex == 0) buildImageCarousel(),
        if (pageIndex == 0) buildSearchBar(),
    
        if (pageIndex == 0)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(height: 8),
        if (pageIndex == 0)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: bestSellingProductImages.map((imagePath) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: buildProductCard(
                    imagePath,
    
                    'Rose Bouquet',
                    '\$25.99',
                     cardWidth: 135,
                    cardHeight: 170,
                  ),
                );
              }).toList(),
            ),
          ),
        if (pageIndex == 0)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),  
        SizedBox(height: 8),
          if (pageIndex == 0)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: recommendedProductImages.map((imagePath) {
              return Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: buildProductCard(
                  imagePath,
                   'Rose Bouquet',
                  '\$25.99',
                  cardWidth: 135,
                  cardHeight: 150,
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: pages[pageIndex],
        ),
      ],
    ),
    bottomNavigationBar: buildMyNavBar(context),
  );
}


  Widget buildImageCarousel() {
  return Container(
    height: 90, 
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
      ),
      color: Colors.white,
    ),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        buildImageCard('Birthday', 'assets/images/cake.png'),
        buildImageCard('Romance', 'assets/images/couple.png'),
        buildImageCard('Get Well', 'assets/images/heart.png'),
        buildImageCard('New Baby', 'assets/images/feet.png'),
        buildImageCard('Wedding', 'assets/images/wed.png'),
        buildImageCard('Friendship', 'assets/images/friends.png'),
      ],
    ),
  );
}

  Widget buildImageCard(String title, String imagePath) {
    return GestureDetector(onTap:(){
       Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OcassionScreen(),
        ),
      );
    },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 90.0,
            height: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget buildProductCard(String imagePath, String productName, String productPrice,
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
              onTap:(){
                Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(title: '', address: '', deliveryDate: '', shippingCharges:9.9, description: '', includedItems: '', dummyEmail: '', dummyPhone: '', dummyReviews: '',),
                      ),
                    );
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      productPrice,
                      style: TextStyle(
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

 Widget buildSearchBar() {
  return GestureDetector(
    onTap:(){
       Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchScreen(),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Icon(Icons.tune, size: 24, color: Colors.black),
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
    ),
  );
}



  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
                showVideo = true;
              });
            },
            icon: Icon(
              Icons.home_outlined,
              color: const Color(0xFFAA8B56),
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
                showVideo = false;
              });
            },
            icon: Icon(
              Icons.favorite_border,
              color: const Color(0xFFAA8B56),
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: const Color(0xFFAA8B56),
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: Icon(
              Icons.person_outline,
              color: const Color(0xFFAA8B56),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<String> LikedProductImages = [
    'assets/images/flower1.png',
    'assets/images/flower2.png',
    'assets/images/flower3.png',
    'assets/images/flower4.png',
    'assets/images/flower5.png',
    'assets/images/flower6.png',
    'assets/images/flower7.png',
    'assets/images/flower8.png',
    'assets/images/flower9.png',
    'assets/images/flower10.png',
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
          'Liked Products',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: LikedProductImages.length,
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return SizedBox(width: 8,height: 8,); 
          }
          if (index + 1 < LikedProductImages.length) {
            
            return Row(
              children: [
                Expanded(
                  child: LikedProductList(
                    LikedProductImages[index],
                    'Rose Bouquet',
                    '\$25.99',
                    cardWidth: 170,
                    cardHeight: 202,
                  ),
                ),
                Expanded(
                  child: LikedProductList(
                    LikedProductImages[index + 1],
                    'Rose Bouquet',
                    '\$25.99',
                    cardWidth: 170,
                    cardHeight: 202,
                  ),
                ),
              ],
            );
          } else {
            
            return Center(
              child: Expanded(
                child: LikedProductList(
                  LikedProductImages[index],
                  'Rose Bouquet',
                  '\$25.99',
                  cardWidth: 170,
                    cardHeight: 202,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

Widget LikedProductList(String imagePath, String productName, String productPrice,
    {double cardWidth = 170, double cardHeight = 202}) {
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
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Icon(
                Icons.favorite,
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      productPrice,
                      style: TextStyle(
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
class CatalogueProducts extends StatefulWidget {
  const CatalogueProducts({super.key});

  @override
  State<CatalogueProducts> createState() => _CatalogueProductsState();
}

class _CatalogueProductsState extends State<CatalogueProducts> {
    List<String> CatalogueProductImages = [
    'assets/images/flower1.png',
    'assets/images/flower2.png',
    'assets/images/flower3.png',
    'assets/images/flower4.png',
    'assets/images/flower5.png',
    'assets/images/flower6.png',
    'assets/images/flower7.png',
    'assets/images/flower8.png',
    'assets/images/flower9.png',
    'assets/images/flower10.png',
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
          'Our Catalogue',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: CatalogueProductImages.length,
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return SizedBox(width: 8,height: 8,); 
          }
          if (index + 1 < CatalogueProductImages.length) {
            
            return Row(
              children: [
                Expanded(
                  child: LikedProductList(
                    CatalogueProductImages[index],
                    'Rose Bouquet',
                    '\$25.99',
                    cardWidth: 170,
                    cardHeight: 202,
                  ),
                ),
                Expanded(
                  child: LikedProductList(
                    CatalogueProductImages[index + 1],
                    'Rose Bouquet',
                    '\$25.99',
                    cardWidth: 170,
                    cardHeight: 202,
                  ),
                ),
              ],
            );
          } else {
            
            return Center(
              child: Expanded(
                child: LikedProductList(
                  CatalogueProductImages[index],
                  'Rose Bouquet',
                  '\$25.99',
                  cardWidth: 170,
                    cardHeight: 202,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
Widget CatalogueProductList(String imagePath, String productName, String productPrice,
    {double cardWidth = 170, double cardHeight = 202}) {
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
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Icon(
                Icons.favorite_outline,
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      productPrice,
                      style: TextStyle(
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




