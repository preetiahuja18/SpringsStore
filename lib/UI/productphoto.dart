import 'package:flutter/material.dart';

class ProductImageViewer extends StatefulWidget {
  final List<String> imagePaths;
  final int initialIndex;

  ProductImageViewer({
    required this.imagePaths,
    required this.initialIndex,
  });

  @override
  _ProductImageViewerState createState() => _ProductImageViewerState();
}

class _ProductImageViewerState extends State<ProductImageViewer> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void goToNextImage() {
    setState(() {
      if (currentIndex < widget.imagePaths.length - 1) {
        currentIndex++;
      }
    });
  }

  void goToPreviousImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,
        backgroundColor: Colors.white,
        
        leading:  IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              iconSize: 20,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(width: 350,height:455,
             decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.asset(
                
                widget.imagePaths[currentIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(height:60,width:350,
           decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05), // 5% black shadow
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,size: 18,),
                  onPressed: goToPreviousImage,
                ),
                SizedBox(width:10),
                Container(color: (Color(0xffF5EBE0
)),
                  child: Text(
                    '${currentIndex + 1}/${widget.imagePaths.length}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                 SizedBox(width:10),
                IconButton(
                  icon: Icon(Icons.arrow_forward,size: 18,),
                  onPressed: goToNextImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
