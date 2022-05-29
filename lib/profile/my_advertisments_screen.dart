import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/globals.dart' as globals;

import '../utils/color_utils.dart';
import 'my ads details.dart';

class MyAdvertisements extends StatefulWidget {
  const MyAdvertisements({Key? key}) : super(key: key);

  @override
  State<MyAdvertisements> createState() => _MyAdvertisementsState();
}

class _MyAdvertisementsState extends State<MyAdvertisements> {

  @override
  void initState() {
    print("globals loaded(email logged)"+globals.userEmail);
  }

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

        title: Text("Published Advertisements"),


      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Advertisment').where("email",isEqualTo:globals.userEmail ).snapshots(),
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
                String imgurl = data['imgUrl'];
                String price = data['price'];
                String descrip = data['description'];
                String varient = data['varient'];
                String color = data['color'];
                String shape = data['shape'];
                String weight = data['weight'];
                String phoneNo = data['phone'];
                String email = data['email'];
                GeoPoint location = data['location'];
                return InkWell(

                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ListTile(
                      tileColor:Colors.deepPurple[100],
                      title: Text(data['varient']),
                      subtitle: Text(data['color']),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          //passing the values of the gem products to the product detils page
                            builder: (context) => publishAdDetils(
                                docId,
                                imgurl,
                                price,
                                descrip,
                                varient,
                                color,
                                shape,
                                weight,
                                phoneNo,
                                email,
                                location)));

                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
