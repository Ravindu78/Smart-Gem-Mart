

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/profile/Purchased%20items.dart';
import 'package:smart_gem_mart/profile/edit%20profie.dart';
import 'package:smart_gem_mart/profile/my_advertisments_screen.dart';
import 'package:smart_gem_mart/reusable_widgets/reusable_widget.dart';
import 'package:smart_gem_mart/screens/signin_screen.dart';
import 'package:smart_gem_mart/screens/splash_screen.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';

class Profile extends StatefulWidget{
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String _emailController='';
  String name='';


  void initState() {
    super.initState();
    var currentUser = FirebaseAuth.instance.currentUser;


    if (currentUser != null) {
      _emailController=currentUser.email!;
      print(currentUser.email);
    }
  }



  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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

        title: Text("My Profile"),


      ),
      body:  Stack(

        fit: StackFit.expand,
        children: [
          Container(

            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),



          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Column(
                  children: [
                    ImageIcon(
                      AssetImage("assets/images/categories/profile.png"),
                      color: Colors.grey,
                      size: 110,
                    ),

                    FutureBuilder<DocumentSnapshot>(
                      future: users.doc(_emailController).get(),
                      builder:
                          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

                          return    Column(
                            children: [
                              Container(

                                height: height * .3,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double innerHeight = constraints.maxHeight;
                                    double innerWidth = constraints.maxWidth;
                                    return Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(

                                            height: innerHeight * 1,
                                            width: innerWidth,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: Colors.white60,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 30),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: [Icon(Icons.person),

                                                        SizedBox(
                                                          width: 15,
                                                        ),

                                                        Text( data['name'],
                                                          textAlign: TextAlign.left,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 28,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: [Icon(Icons.mail),

                                                        SizedBox(
                                                          width: 15,
                                                        ),

                                                        Text(  data['email'],
                                                          textAlign: TextAlign.left,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: [Icon(Icons.phone),

                                                        SizedBox(
                                                          width: 15,
                                                        ),

                                                        Text( data['number'],
                                                          textAlign: TextAlign.left,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: [Icon(Icons.perm_identity),

                                                        SizedBox(
                                                          width: 15,
                                                        ),

                                                        Text( data['nic'],
                                                          textAlign: TextAlign.left,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          width: 140,
                                                        ),
                                                        // IconButton(onPressed: (){}, icon: const Icon(Icons.edit),
                                                        // color: Colors.deepPurple,)
                                                      ],
                                                    ),
                                                  ),
                                                ],

                                              ),
                                            ),
                                          ),

                                        ),
                                      ],


                                    );
                                  },
                                ),

                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Container(

                                  child: myProfileUiButton(context, "My Advertisements", () {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>  MyAdvertisements(),
                                      ),
                                    );
                                  }
                                  ),),
                              ),
                              Container(
                                child: myProfileUiButton(context, "Items Purchased", () {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>  PurchusedItmes(),
                                    ),
                                  );

                                }
                                ),),
                              Container(
                                child: myProfileUiButton(context, "Edit Profile", () {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>  EditProfile(),
                                    ),
                                  );
                                }
                                ),),
                              Container(
                                child: myProfileUiButton(context, "Log Out", () async {

                                    await FirebaseAuth.instance.signOut().whenComplete(() {
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(context, '/1');
                                    },);

                                  },
                                  // await FirebaseAuth.instance.signOut().whenComplete(() {
                                  //   Navigator.popUntil(context, ModalRoute.withName('/'));
                                  // },);


                                ),),
                            ],

                          );
                        }

                        return Text("loading")
                        ;
                      },
                    ),


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

