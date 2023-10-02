// import 'package:flower_store/UI/homePage.dart';
// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List<String> SearchProductImages = [
//     'assets/images/flower1.png',
//     'assets/images/flower2.png',
//     'assets/images/flower3.png',
//     'assets/images/flower4.png',
//     'assets/images/flower5.png',
//     'assets/images/flower6.png',
//     'assets/images/flower7.png',
//     'assets/images/flower8.png',
//     'assets/images/flower9.png',
//     'assets/images/flower10.png',
//   ];

//   List<String> searchButtons = [
//     'Birthday',
//     'Get Well',
//     'New Baby',
//     'Wedding',
//     'Anniversary',
//     'Sympathy',
//   ];

//   int selectedButtonIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           color: Colors.black,
//           iconSize: 20,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: 'By Occasion - ',
//                 style: TextStyle(fontSize: 20, color: Colors.black),
//               ),
//               TextSpan(
//                 text: searchButtons[selectedButtonIndex],
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Color(0xFFAA8B56),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border),
//             color: Colors.black,
//             onPressed: () {
//                Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => Page2(), 
//         ),
//       );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 50,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: searchButtons.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedButtonIndex = index;
//                     });
//                   },
//                   child: Container(
//                     width: 78,
//                     height: 28,
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       color: selectedButtonIndex == index
//                           ? Color(0xFFAA8B56)
//                           : Color(0xFFF5EBE0),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       searchButtons[index],
//                       style: TextStyle(
//                         color: selectedButtonIndex == index
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: searchButtons.length,
//               itemBuilder: (BuildContext context, int index) {
//                 if (index.isOdd) {
//                   return SizedBox(
//                     width: 8,
//                     height: 8,
//                   );
//                 }
//                 if (index + 1 < searchButtons.length) {
//                   return Row(
//                     children: [
//                       Expanded(
//                         child: SearchProductList(
//                           searchButtons[index],
//                           'Rose Bouquet',
//                           '\$25.99',
//                           cardWidth: 170,
//                           cardHeight: 202,
//                         ),
//                       ),
//                       Expanded(
//                         child: SearchProductList(
//                           searchButtons[index + 1],
//                           'Rose Bouquet',
//                           '\$25.99',
//                           cardWidth: 170,
//                           cardHeight: 202,
//                         ),
//                       ),
//                     ],
//                   );
//                 } else {
//                   return Center(
//                     child: Expanded(
//                       child: SearchProductList(
//                         searchButtons[index],
//                         'Rose Bouquet',
//                         '\$25.99',
//                         cardWidth: 170,
//                         cardHeight: 202,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget SearchProductList(String imagePath, String productName, String productPrice,
//     {double cardWidth = 170, double cardHeight = 202}) {
//   return Padding(
//     padding: EdgeInsets.only(right: 8.0),
//     child: Card(
//       elevation: 3.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Container(
//         width: cardWidth,
//         height: cardHeight,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Stack(
//           children: [
//             Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//             Positioned(
//               top: 8.0,
//               right: 8.0,
//               child: Icon(
//                 Icons.favorite,
//                 color: Colors.white,
//                 size: 15,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 color: Colors.black.withOpacity(0.2),
//                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       productName,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Text(
//                       productPrice,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
