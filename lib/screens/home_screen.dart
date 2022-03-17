
import 'package:smart_gem_mart/cart/cart.dart';
import 'package:smart_gem_mart/getpost.dart';
import 'package:smart_gem_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/screens/addpost_screen.dart';
import 'package:smart_gem_mart/screens/categories_screen.dart';
import 'package:smart_gem_mart/screens/drawer_screen.dart';
import 'package:smart_gem_mart/screens/home_screen.dart';
import 'package:smart_gem_mart/screens/posts.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';
//import 'package:smart_gem_mart/screens/';

import '../reusable_widgets/reusable_widget.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
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
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
          IconButton(
            icon: Icon(Icons.scanner),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
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
            Tab(icon: Icon(Icons.star), text: 'Categories'),
            Tab(icon: Icon(Icons.face), text: 'Profile'),

          ],
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
        drawer: mydrawer(),

      body: TabBarView(
        children: [
          //buildPage('Home Page'),

          //=====body testing button remove this====
          Posts(),
          Categories(),
          Posts(),

        ],
      ),


      /*bottomNavigationBar: BottomNavigationBar(

          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.hide_image),
              label: 'add',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.add),
              label: 'add',

            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              label: 'add',
            ),
          ],
      ),*/

    ),

  );

  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 28),
    ),
  );
}

