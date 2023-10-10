import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), 
        child: AppBar(
          backgroundColor: Color(0xFF4E6C50),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 19.0), 
                child: Text(
                  "Estimated Total",
                  style: GoogleFonts.laila(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                "\$357.00",
                style: GoogleFonts.laila(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                  textStyle: GoogleFonts.laila(fontSize: 20, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                ),
                child: Text(
                  "Checkout",
                  style: GoogleFonts.laila(fontSize: 17),
                ),
              ),
            ),
          SizedBox(width: 10),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                
              },
              
            ),
            
            title: Row(
              children: [
                Image.asset('assets/images/prod1.png',    height: 90,
                    width: 60, fit: BoxFit.cover,), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                       padding: const EdgeInsets.only(left:8.0,right:8.0),
                          child: Text('Circle Bloom',style: GoogleFonts.laila(fontSize: 20),),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left:28.0),
                          child: Align(child: Text('\$199',style: GoogleFonts.laila(fontSize: 16),)),
                        ),

                      
                      ],
                    ),
                     
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text("Roses, Aster, and Aistromeria",style: GoogleFonts.laila(fontSize: 12),),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Text("Quantity",style: GoogleFonts.laila(fontSize: 13),),
                //           ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.white,
                //     textStyle: TextStyle(fontSize: 20, color: Colors.black),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(0),
                //     ),
                //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //   ),
                //   child: Text("Done"),
                // ),
                //        
                 ],
                        
                      ),
                    ), 
                  
                  ],
                ),
                
              ],
            ),
          );
        },
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
          style: GoogleFonts.laila(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.laila(fontSize: 16),
                  ),
                  SizedBox(width: 15),
                  Text(
                    widget.phoneNumber,
                    style: GoogleFonts.laila(fontSize: 13),
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
                        style: GoogleFonts.laila(
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
                            style: GoogleFonts.laila(fontSize: 13, color: Colors.black),
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
                              child: GestureDetector(
                                child: Text(
                                  'CHANGE',
                                  style: GoogleFonts.laila(
                                    fontSize: 10,
                                    color: Color(0xffAA5656),
                                    decoration: TextDecoration.underline,
                                  ),
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
                style: GoogleFonts.laila(
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
                      style: GoogleFonts.laila(fontSize: 10, color: Colors.black),
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
                child: Text("Total shipping Charges:  \$357.00",style: GoogleFonts.laila(fontSize:16,fontWeight: FontWeight.w400),),
              )
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Apply Coupon",style: GoogleFonts.laila(fontSize:16,fontWeight: FontWeight.w400),),
              ),             SizedBox(width:30),
              Spacer(),
              Text("Enter code to claim coupons ",style: GoogleFonts.laila(fontSize:13),),
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
                    style: GoogleFonts.laila(fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Text(
                    "\$${bagTotal.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
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
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "\$${shippingCharges.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16),
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
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "-\$${totalDiscount.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16),
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
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "-\$${couponDiscount.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16),
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
                    style: GoogleFonts.laila(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Text(
                    "\$${bagTotal.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 17, fontWeight: FontWeight.bold),
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
            //SizedBox(height: 30),
            Align(alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Total Amount to pay:    ",
                          style: GoogleFonts.laila(fontSize: 17,color:Colors.black),
                        ),
                        TextSpan(
                          text: "\$${bagTotal.toStringAsFixed(2)}",
                          style: GoogleFonts.laila(
                            fontSize: 17,
                            fontWeight: FontWeight.bold, color:Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:10),
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
        textStyle: GoogleFonts.laila(fontSize: 18),
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
          ),
          child: Text("Place Order"),
        ),
      ),
      
      
      
          ],
        ),
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
          style: GoogleFonts.laila(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
               alignment: Alignment.topLeft,
              child: Text("Make Payment",style: GoogleFonts.laila(fontSize: 17,fontWeight: FontWeight.bold),)),
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
              style: GoogleFonts.laila(
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
                    style: GoogleFonts.laila(fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Text(
                    "\$${bagTotal.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
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
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "\$${shippingCharges.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16),
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
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "-\$${totalDiscount.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16),
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
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "-\$${couponDiscount.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16),
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
                    style: GoogleFonts.laila(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Text(
                    "\$${bagTotal.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 17, fontWeight: FontWeight.bold),
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
          //  SizedBox(height: 30),
            Align(alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Total Amount to pay:    ",
                          style: GoogleFonts.laila(fontSize: 17,color:Colors.black),
                        ),
                        TextSpan(
                          text: "\$${bagTotal.toStringAsFixed(2)}",
                          style: GoogleFonts.laila(
                            fontSize: 17,
                            fontWeight: FontWeight.bold, color:Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //  SizedBox(height:20),
            Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
      
                          showModalBottomSheet(
                           
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top:Radius.circular(20))),
                            isScrollControlled: true,
                          //  backgroundColor: Colors.green,
                            context: context, builder: (context) => buildSheet(),);
                 },
          style: ElevatedButton.styleFrom(
        primary: Color(0xff4E6C50), 
        textStyle: GoogleFonts.laila(fontSize: 18),
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
          ),
          child: Text("Place Order"),
        ),
      ),
      
       ]),
      ),
    );
  }
  
 Widget buildSheet()=> Container( height: MediaQuery.of(context).size.height * 0.9,
 decoration: BoxDecoration(  borderRadius: BorderRadius.circular(30.0),color: Colors.white),
  //color: Colors.white,
  padding: EdgeInsets.all(16),
   child: Column( 
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
         children:[
    
          Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.keyboard_arrow_down, size: 30,),
                ),
                SizedBox(height: 40),
                Align(alignment:Alignment.center,
                  child: Image.asset("assets/images/end.png")),
                  SizedBox(height:20),
                  Center(child: Text("Thank You!",style:GoogleFonts.laila(fontSize: 22,fontWeight: FontWeight.bold))),
                  SizedBox(height:5),
                   Center(child: Text("Your order has been received.",style:GoogleFonts.laila(fontSize: 13))),
                    SizedBox(height:25),
                     Padding(
                       padding: const EdgeInsets.only(left:16.0),
                       child: Text("Your order contains:",style:GoogleFonts.laila(fontSize: 16)),
                     ),
                        SizedBox(height:5),
                         Padding(
                           padding: const EdgeInsets.only(left:16.0),
                           child: Text("Circle Bloom (\$357.00), Black Bloom(\$79)",style:GoogleFonts.laila(fontSize: 16)),
                         ),
                         SizedBox(height:15),
                          Opacity(
                         opacity: 0.3, // 10% opacity
                        child: Divider(
                         color: Colors.black,
                       thickness: 1.0,
                       ),
                     ),
              // SizedBox(height:15),
               Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Text(
                    "Total Order: ",
                    style: GoogleFonts.laila(fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Text(
                    "\$${bagTotal.toStringAsFixed(2)}",
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Text(
                    "Contact Shop: ",
                    style: GoogleFonts.laila(fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Text(
                   "+1-202-555-0178",
                    style: GoogleFonts.laila(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
             SizedBox(height:15),
                          Opacity(
                         opacity: 0.3, // 10% opacity
                        child: Divider(
                         color: Colors.black,
                       thickness: 1.0,
                       ),
                     ),
             //  SizedBox(height:15),
               Padding(
                 padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                 child: Row(
                   children: [
                     Icon(
                       Icons.location_on_outlined,
                       size: 20,
                       color: Colors.black,
                     ),
                     SizedBox(width:5),
                           Text(
                     'Delivery Address : ',
                     style: GoogleFonts.laila(
                       fontSize: 17,
                       color: Colors.black,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                   ],
                 ),
               ),
                 Padding(
                   padding: const EdgeInsets.only(left:36.0),
                   child: Text(
                       " 567g,34 Street,Alogoia,Hermenia,US",
                         style: GoogleFonts.laila(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                       ),
                 ),
                  Padding(
                 padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                 child: Row(
                   children: [
                     Icon(
                      Icons.calendar_today,
                       size: 20,
                       color: Colors.black,
                     ),
                     SizedBox(width:5),
                           Text(
                     'Delivery Date : ',
                     style: GoogleFonts.laila(
                       fontSize: 17,
                       color: Colors.black,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                   ],
                 ),
               ),
                 Padding(
                   padding: const EdgeInsets.only(left:36.0),
                   child: Text(
                       "Wednesday-January 18, 2023",
                         style: GoogleFonts.laila(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                       ),
                 ),
                   Padding(
                 padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                 child: Row(
                   children: [
                     Icon(
                       Icons.local_shipping_outlined,
                       size: 20,
                       color: Colors.black,
                     ),
                     SizedBox(width:5),
                           Text(
                        'Order Progress:',
                     style: GoogleFonts.laila(
                       fontSize: 17,
                       color: Colors.black,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                   ],
                 ),
               ),
                SizedBox(height: 40),
                  ]
            ),
 );
          }

