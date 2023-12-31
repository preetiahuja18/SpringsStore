import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> SearchProductImages = [
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

  int selectedButtonIndex = 0;

  // List of different texts for the containers
  List<String> containerTexts = [
    'Sort By - Low to High',
    'Price -> \$200',
    'Colour- Pink',
    'Delivery within -2 days',
    'Occasion -Birthday'
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
        title: buildSearchBar(context),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: containerTexts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 180,
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF4E6C50),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Add your cross icon functionality here
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        containerTexts[index],
                        style: GoogleFonts.laila(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: SearchProductImages.length,
              itemBuilder: (BuildContext context, int index) {
                if (index.isOdd) {
                  return SizedBox(
                    width: 8,
                    height: 8,
                  );
                }
                if (index + 1 < SearchProductImages.length) {
                  return Row(
                    children: [
                      Expanded(
                        child: SearchProductList(
                          SearchProductImages[index],
                          'Rose Bouquet',
                          '\$25.99',
                          cardWidth: 170,
                          cardHeight: 202,
                        ),
                      ),
                      Expanded(
                        child: SearchProductList(
                          SearchProductImages[index + 1],
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
                      child: SearchProductList(
                        SearchProductImages[index],
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
          ),
        ],
      ),
    );
  }
}


Widget SearchProductList(String imagePath, String productName, String productPrice,
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
                size: 15,
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

Widget buildSearchBar(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Color(0xffF5EBE0),
    ),
    child: Row(
      children: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.tune, size: 24, color: Colors.black),
          ),
        ),
        Expanded(
          child: GestureDetector(onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );
  },
            child: Text(
              "Search",
              style: GoogleFonts.laila(fontSize: 18,color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.mic, size: 24, color: Colors.black),
        ),
      ],
    ),
  );
}

