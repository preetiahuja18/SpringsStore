import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LimitedBox(
          maxHeight: 150, 
          child: Container(
            color: Color(0xFF4E6C50),
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$357.00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Estimated Total",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight, 
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => OrderSummaryScreen(
      name: "SHYNA SHARMA",
      phoneNumber: "+1-202-555-0178",
      address: "123 Main Street, City, Country",
    ),
  ),
);

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(fontSize: 20, color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            
          ),
        ),
      ),
    );
  }
}
class OrderSummaryScreen extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String address;

  const OrderSummaryScreen({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.address,
  }) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  
  double bagTotal = 357.00;
  double shippingCharges = 20.00;
  double totalDiscount = 50.00;
  double couponDiscount = 10.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
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
          'Order Summary',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 15),
                Text(
                  widget.phoneNumber,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sending To - ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.address,
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        GestureDetector(
                          onTap:() {
                        Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlaceOrder(),
                    ),
                  );
      
    },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                            child: Text(
                              'CHANGE',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffAA5656),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '* Order placed now is expected to be delivered around Wed, 18 Jan - 20 Jan',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/prod1.png',
                  height: 60,
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Image.asset(
                    'assets/images/prod11.png',
                    height: 60,
                    width: 50,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    '1 item',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
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
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left:16.0,top:8.0),
              child: Text("Total shipping Charges:  \$357.00",style: TextStyle(fontSize:16,fontWeight: FontWeight.w400),),
            )
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Apply Coupon",style: TextStyle(fontSize:16,fontWeight: FontWeight.w400),),
            ),             SizedBox(width:30),
            Spacer(),
            Text("Enter code to claim coupons ",style: TextStyle(fontSize:13),),
            // SizedBox(width:10),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios,size: 18,), onPressed: () {  },
                  //onPressed: goToNextImage,
                ),
          ],),
            Opacity(
            opacity: 0.3, // 10% opacity
            child: Divider(
              color: Colors.grey,
              thickness: 5.0,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  "Bag Total: ",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                child: Text(
                  "\$${bagTotal.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Shipping Charges:  ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "\$${shippingCharges.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Total Discount:  ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "-\$${totalDiscount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Coupon Discount:  ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "-\$${couponDiscount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),SizedBox(height: 8),
          Opacity(
            opacity: 0.3, // 10% opacity
            child: Divider(
              color: Colors.grey,
              thickness: 5.0,
            ),
          ),SizedBox(height: 10),
           Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  "Total: ",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                child: Text(
                  "\$${bagTotal.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),SizedBox(height: 10),
           Opacity(
            opacity: 0.3, // 10% opacity
            child: Divider(
              color: Colors.grey,
              thickness: 5.0,
            ),
          ),
          SizedBox(height: 30),
          Align(alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total Amount to pay:    ",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextSpan(
                        text: "\$${bagTotal.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:30),
          Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {
                        Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlaceOrder(),
                    ),
                  );
      
    },
    style: ElevatedButton.styleFrom(
      primary: Color(0xff4E6C50), 
      textStyle: TextStyle(fontSize: 18),
      padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
    ),
    child: Text("Place Order"),
  ),
),



        ],
      ),
    );
  }
}

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
    double bagTotal = 357.00;
  double shippingCharges = 20.00;
  double totalDiscount = 50.00;
  double couponDiscount = 10.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        elevation: 2,
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
          'Place Order',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
             alignment: Alignment.topLeft,
            child: Text("Make Payment",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
        ),
        //SizedBox(height:10),
        Center(child: Image.asset('assets/images/card.png')),
        Padding(
  padding: const EdgeInsets.all(16.0),
  child: SizedBox(
    width: 330,
    height: 48,
    child: OutlinedButton(
      onPressed: () {
    
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), 
        ),
        side: BorderSide(
          color: Colors.black,
          width: 2.0, 
        ),
        padding: EdgeInsets.zero, 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            size: 24, 
            color: Colors.black, 
          ),
          SizedBox(width: 8), 
          Text(
            "Add New Card",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  ),
),
            Opacity(
            opacity: 0.3, // 10% opacity
            child: Divider(
              color: Colors.grey,
              thickness: 5.0,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  "Bag Total: ",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                child: Text(
                  "\$${bagTotal.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Shipping Charges:  ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "\$${shippingCharges.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Total Discount:  ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "-\$${totalDiscount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Coupon Discount:  ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "-\$${couponDiscount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),SizedBox(height: 8),
          Opacity(
            opacity: 0.3, // 10% opacity
            child: Divider(
              color: Colors.grey,
              thickness: 5.0,
            ),
          ),SizedBox(height: 10),
           Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  "Total: ",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                child: Text(
                  "\$${bagTotal.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),SizedBox(height: 10),
           Opacity(
            opacity: 0.3, // 10% opacity
            child: Divider(
              color: Colors.grey,
              thickness: 5.0,
            ),
          ),
          SizedBox(height: 30),
          Align(alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total Amount to pay:    ",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextSpan(
                        text: "\$${bagTotal.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:30),
          Padding(
          padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(
               onPressed: () {
                 showModalBottomSheet(context:context,builder:(context){
                  return Container(
                  decoration: BoxDecoration( borderRadius:BorderRadius.vertical(top: Radius.circular(70)),),
              padding: EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height*9.0 ,
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
                  //           Navigator.of(context).push(
                  //            MaterialPageRoute(
                  //     builder: (context) => ProfileScreen(),
                  //   ),
                  // );
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
                  //           Navigator.of(context).push(
                  //            MaterialPageRoute(
                  //     builder: (context) => ProfileScreen(),
                  //   ),
                  // );
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
    style: ElevatedButton.styleFrom(
      primary: Color(0xff4E6C50), 
      textStyle: TextStyle(fontSize: 18),
      padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
    ),
    child: Text("Place Order"),
  ),
),


      ]),
    );
  }
}
