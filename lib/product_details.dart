import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pay/pay.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';
import 'package:smart_gem_mart/chat/chat_screen.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';
import 'package:smart_gem_mart/globals.dart' as globals;
class ProductDetails extends StatefulWidget {
  String imgurl;
  String price;
  String descrip;
  String varient;
  String color;
  String shape;
  String weight;
  String phoneNo;
  String  email;
  GeoPoint location;

  ProductDetails(this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location);

  //const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location);
}

class _ProductDetailsState extends State<ProductDetails> {
  String imgurl;
  String price;
  String descrip;
  String varient;
  String color;
  String shape;
  String weight;
  String phoneNo;
  String  email;
  GeoPoint location;
  _ProductDetailsState(this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location);
  int lastOrderNumber=0;
  String orderId='';
  String buyerName='';
  String buyerNumber='';


  @override
  void initState() {
    super.initState();
    getUserDetails();
    getOrderNumberNIncrease ();
  }
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }
  void getUserDetails () async
  {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userEmail)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {

          buyerName= '${documentSnapshot['name']}';
          buyerNumber= '${documentSnapshot['number']}';

      } else {
        print('Document does not exist on the database');
      }

    });
  }

  void PaywithPayHere()
  {
    Map paymentObject = {
      "sandbox": true,                 // true if using Sandbox Merchant ID
      "merchant_id": "1211149",        // Replace your Merchant ID
      "notify_url": "http://sample.com/notify",
      "order_id": orderId,
      "items": "Hello from Flutter!",
      "amount": price,
      "currency": "LKR",
      "first_name": buyerName,
      "last_name": "",
      "email": globals.userEmail,
      "phone": buyerNumber,
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "delivery_address": "No. 46, Galle road, Kalutara South",
      "delivery_city": "Kalutara",
      "delivery_country": "Sri Lanka",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(
        paymentObject,
            (paymentId) {
          print("One Time Payment Success. Payment Id: $paymentId");
          addOrderDetails();
          updateOrderNumber ();
        },
            (error) {
          print("One Time Payment Failed. Error: $error");
        },
            () {
          print("One Time Payment Dismissed");
        }
    );
  }


  void getOrderNumberNIncrease () async
  {
    await FirebaseFirestore.instance
        .collection('getOrderCount')
        .doc('orderCount')
        .get()
        .then((DocumentSnapshot ordrNo) {
      if (ordrNo.exists) {
        lastOrderNumber= ordrNo['lastOrderNumber'];
        lastOrderNumber=lastOrderNumber+1;
        orderId='OID${lastOrderNumber}';

        print('Document data: ${ordrNo.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }


  void updateOrderNumber () async
  {
    FirebaseFirestore.instance.collection('getOrderCount').doc('orderCount')
        .update({'lastOrderNumber': FieldValue.increment(1)


        })
        .then((value) => print("orderNumber Updated"))
        .catchError((error) => print("Failed to update Order Number: $error"));
  }


  void addOrderDetails(){
    FirebaseFirestore.instance.collection('orders').doc(orderId)
        .set({
      'orderId': orderId,
      'Price': price,
      'Description' :descrip,
      'Varient': varient,
      'Color': color,
      'Shape' :shape,
      'Weight': weight,
      'SellerPhoneNo' :phoneNo,
      'SellerEmail' : email,
      'BuyerEmail': globals.userEmail,
      'BuyerNumber': buyerNumber,
      'BuyerName': buyerName,
      'Location' :location,
    })
        .then((value) => print("Order details added"))
        .catchError((error) => print("Failed to add order details: $error"));
  }
  @override
  Widget build(BuildContext context) {
    final _paymentItems = [
      PaymentItem(
        label: varient,    amount: price,    status: PaymentItemStatus.final_price,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")],
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0.2,
        title: InkWell(
            onTap: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
              },
            child: Text("Product Details")),
        // actions: [
        //   new IconButton(onPressed:(){}, icon: Icon(Icons.search)
        //   ),
        //
        // ],
      ),

      body: Column(
        children: [
          Container(
            height: 200.0,
            child: GridTile(
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 5,
                  child:Image.network(
                      imgurl),
              ),
              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading:  Text(" $varient",
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children:  [

                      Expanded(child: Text("LKR $price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          //===========the first buttons======//
  


          //===========the second buttons======//
          Row(
            children: [
              //===== the size button
              Expanded(

                child:Container(
                  child: GooglePayButton(
                    width: 150,
                    paymentConfigurationAsset: 'googlepay.json',
                    paymentItems: _paymentItems,
                    style: GooglePayButtonStyle.black,
                    type: GooglePayButtonType.pay,
                    margin: const EdgeInsets.only(top: 15.0),
                    onPaymentResult: onGooglePayResult,
                    // loadingIndicator: const Center(
                    //   child: CircularProgressIndicator(),
                    // ),
                  ),
                ),

              ),

              IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ChatScreen(email)));
              },
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.message_rounded, color: Colors.black54,),
                ),),
            ],
          ),

          ListTile(
            title: Text("More",style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16.0),),
            subtitle: Text(
                "$descrip",style: TextStyle(color: Colors.black , fontSize: 14.0),) ,
          ),

          Divider(),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Varient :", style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$varient"),)
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Color :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 14.0),),),

              //=======remember to creat the product brand====

              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$color"),)

            ],
          ),

          //=======remember to creat the product condition===

          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Cutting Shape :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 14.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$shape"),)

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Weight :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 14.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$weight ct",style: TextStyle(color: Colors.black, fontSize: 15.0),),),

            ],
          ),

        Container(
          child:  Expanded(
            child: Stack(children: [
              GoogleMap(

                markers: {
                  Marker(
                    visible: true,
                    markerId: const MarkerId('_kGooglePlex'),
                    //infoWindow: InfoWindow(title: 'Google Plex'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(location.latitude, location.longitude),
                  ),
                },
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition:
                const CameraPosition(target: LatLng(7.8731, 80.7718), zoom: 7.8),
              ),
            ]),
          ),
        )


        ],
      ),
    );
  }
}





