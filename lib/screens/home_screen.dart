
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_gem_mart/knowleadge_panel/knowleadgepanel_screen.dart';
import 'package:smart_gem_mart/price_checker/pricechecker_screen.dart';
import 'package:smart_gem_mart/chat/messages_screen.dart';
import 'package:smart_gem_mart/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/screens/posts.dart';
import 'package:smart_gem_mart/screens/qrscanner.dart';
import 'package:smart_gem_mart/screens/signin_screen.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';
import 'package:smart_gem_mart/screens/about_screen.dart';
import 'package:smart_gem_mart/globals.dart' as globals;


import '../reusable_widgets/reusable_widget.dart';
import 'addpost_screen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String email;
  String name='';
  bool states=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var currentUser = FirebaseAuth.instance.currentUser;


    if (currentUser != null) {
      email=currentUser.email!;
      print(currentUser.email);
      globals.userEmail = currentUser.email!;
    }
    getUserName ();
  }

  void getUserName () async
  {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          name= '${documentSnapshot['name']}';
        });

        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  // TODO: implement widget
  Widget Loading()
  {
    return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 20),
        child: CircularProgressIndicator(
          value: 0.8,
        )
    );
  }

  @override
  Widget build(BuildContext context) =>
      DefaultTabController(

    length: 4,
    child: Scaffold(

      appBar: AppBar(

        //centerTitle: true,
        //leading: IconButton(
         // icon: Icon(Icons.menu),
          //onPressed: () {

         // },
       // ),
        actions: [

          IconButton(

            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPostScreen()));
            },
          )

        ],
        //backgroundColor: Colors.purple,
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
        bottom: TabBar(
          //isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.calculate), text: 'Price Checker'),

            Tab(icon: Icon(Icons.book), text: 'Education'),
            Tab(icon: Icon(Icons.message), text: 'Messages'),
          ],
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
        drawer: Drawer(
         backgroundColor: Colors.white,
          child: ListView(
            children: [
              Container(

                child: UserAccountsDrawerHeader(accountName: Text(name), accountEmail: Text(email),
                   decoration: BoxDecoration(

                     gradient: LinearGradient(
                       colors: [hexStringToColor("CB2B93"),
                         hexStringToColor("9546C4"),
                         hexStringToColor("5E61F4")],
                       begin: Alignment.topCenter, end: Alignment.bottomCenter,
                     ),
                   ),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white,
                      ),
                    ),
                  ),

                ),
              ),
              Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: ()=> Navigator.of(context).push(
                          MaterialPageRoute(
                            //passing the values of the gem products to the product detils page
                              builder: (context) => Profile())),
                      child: ListTile(
                        title: Text('My Profile'),
                        leading: Icon(Icons.person, color: Colors.purple,),
                      ),
                    ),
                    InkWell(
                      child: ListTile(
                        title: Text('Home Page'),
                        leading: Icon(Icons.home, color: Colors.purple,),
                        onTap: ()=> Navigator.of(context).push(
                            MaterialPageRoute(
                              //passing the values of the gem products to the product detils page
                                builder: (context) => HomeScreen())),),
                    ),


                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const QRViewExample()));
                      },
                      child: ListTile(
                        title: Text('QR Scanner'),
                        leading: Icon(Icons.qr_code_scanner, color: Colors.purple,),
                      ),
                    ),


                    Divider(),
                    InkWell(
                      onTap: ()=> Navigator.of(context).push(
                          MaterialPageRoute(
                            //passing the values of the gem products to the product detils page
                              builder: (context) => About())),
                      child: ListTile(
                        title: Text('About'),
                        leading: Icon(Icons.help, color: Colors.purple,),
                      ),

                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut().whenComplete(() {
                         Navigator.pop(context);
                         Navigator.pushReplacementNamed(context, '/1');
                        },);

                      },
                      child: ListTile(
                        title: Text('Log Out'),
                        leading: Icon(Icons.settings, color: Colors.purple,),

                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),

      body: TabBarView(

        children: [
          //buildPage('Home Page'),

          //=====body testing button remove this====
          Posts(),
          PriceChecker(),
          KnowledgePanel(),
          MessagesScreen(),


        ],
      ),



    ),

  );
  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 28),
    ),
  );
}

