import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/globals.dart' as globals;
import 'package:smart_gem_mart/profile/purchased%20item%20details.dart';

import '../utils/color_utils.dart';
class PurchusedItmes extends StatefulWidget {
  const PurchusedItmes({Key? key}) : super(key: key);

  @override
  State<PurchusedItmes> createState() => _PurchusedItmesState();
}

class _PurchusedItmesState extends State<PurchusedItmes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
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

        title: Text("Purchased Items"),


      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('orders')
            .where('BuyerEmail', isEqualTo: globals.userEmail).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  String docId= document.id;
                  String orderId=data['orderId'];

                  String imgurl=data['ImgUrl'];
                  String price = data['Price'];
                  String descrip = data['Description'];
                  String varient = data['Varient'];
                  String color = data['Color'];
                  String shape = data['Shape'];
                  String weight = data['Weight'];
                  String phoneNo = data['BuyerNumber'];
                  String email = data['BuyerEmail'];
                  String selleremail = data['SellerEmail'];
                  String sellernumber = data['SellerPhoneNo'];
                  GeoPoint location = data['Location'];
                  return InkWell(
                    onTap: (){
                   //  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(data['orderId'],);
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            //passing the values of the gem products to the product detils page
                              builder: (context) => PurchasedDetails(
                                  docId,
                                  orderId,
                                  imgurl,
                                  price,
                                  descrip,
                                  varient,
                                  color,
                                  shape,
                                  weight,
                                  phoneNo,
                                  email,
                                  location,
                            selleremail,
                              sellernumber)));
                    },
                    child:Card(
                      color: Colors.deepPurple[100],
                      child: Column(
                        children: [

                          Text(data['orderId']),

                          Text(data['Varient']),

                        ],
                      ),
                    )
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
