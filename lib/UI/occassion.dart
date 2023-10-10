import 'package:flower_store/UI/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OcassionScreen extends StatefulWidget {
  const OcassionScreen({Key? key}) : super(key: key);

  @override
  State<OcassionScreen> createState() => _OcassionScreenState();
}

class _OcassionScreenState extends State<OcassionScreen> {
  List<String> OccassionProductImages = [
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

  List<String> occasionButtons = [
    'Birthday',
    'Get Well',
    'New Baby',
    'Wedding',
    'Anniversary',
    'Sympathy',
  ];

  int selectedButtonIndex = 0;

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
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By Occasion - ',
                style: GoogleFonts.laila(fontSize: 20, color: Colors.black),
              ),
              TextSpan(
                text: occasionButtons[selectedButtonIndex],
                style: GoogleFonts.laila(
                  fontSize: 20,
                  color: Color(0xFFAA8B56),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.black,
            onPressed: () {
               Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Page2(), 
        ),
      );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: occasionButtons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedButtonIndex = index;
                    });
                  },
                  child: Container(
                    width: 78,
                    height: 28,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: selectedButtonIndex == index
                          ? Color(0xFFAA8B56)
                          : Color(0xFFF5EBE0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      occasionButtons[index],
                      style: GoogleFonts.laila(
                        color: selectedButtonIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: OccassionProductImages.length,
              itemBuilder: (BuildContext context, int index) {
                if (index.isOdd) {
                  return SizedBox(
                    width: 8,
                    height: 8,
                  );
                }
                if (index + 1 < OccassionProductImages.length) {
                  return Row(
                    children: [
                      Expanded(
                        child: OcassionProductList(
                          OccassionProductImages[index],
                          'Rose Bouquet',
                          '\$25.99',
                          cardWidth: 170,
                          cardHeight: 202,
                        ),
                      ),
                      Expanded(
                        child: OcassionProductList(
                          OccassionProductImages[index + 1],
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
                      child: OcassionProductList(
                        OccassionProductImages[index],
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

Widget OcassionProductList(String imagePath, String productName, String productPrice,
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
