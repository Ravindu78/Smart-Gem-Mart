import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/globals.dart' as globals;
class PurchusedItmes extends StatefulWidget {
  const PurchusedItmes({Key? key}) : super(key: key);

  @override
  State<PurchusedItmes> createState() => _PurchusedItmesState();
}

class _PurchusedItmesState extends State<PurchusedItmes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  return InkWell(
                    onTap: (){
                   //  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(data['orderId'],);
                    },
                    child:Card(
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
