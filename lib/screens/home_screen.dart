
import 'package:smart_gem_mart/cart/cart.dart';
import 'package:smart_gem_mart/screens/knowleadgepanel_screen.dart';
import 'package:smart_gem_mart/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/screens/categories_screen.dart';
import 'package:smart_gem_mart/screens/posts.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';


import '../reusable_widgets/reusable_widget.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
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
            icon: Icon(Icons.shopping_cart),
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
            Tab(icon: Icon(Icons.book), text: 'Education'),
          ],
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
        drawer: Drawer(

          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ListView(
              children: [
                UserAccountsDrawerHeader(accountName: Text('Ravindu Arsakualsooriya'), accountEmail: Text('ravindup33@gmail.com'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white,
                      ),
                    ),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.white

                  ),
                  height: 550,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: ListTile(
                          title: Text('Home Page'),
                          leading: Icon(Icons.home, color: Colors.red,),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: ListTile(
                          title: Text('My Account'),
                          leading: Icon(Icons.person, color: Colors.red,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
                        },
                        child: ListTile(
                          title: Text('Shopping Cart'),
                          leading: Icon(Icons.shopping_cart, color: Colors.red,),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: ListTile(
                          title: Text('Home Page'),
                          leading: Icon(Icons.home, color: Colors.red,),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: ListTile(
                          title: Text('Favorite'),
                          leading: Icon(Icons.favorite, color: Colors.red,),
                        ),
                      ),
                      Divider(),
                      InkWell(
                        onTap: (){},
                        child: ListTile(
                          title: Text('Settings'),
                          leading: Icon(Icons.settings, color: Colors.red,),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: ListTile(
                          title: Text('About'),
                          leading: Icon(Icons.help, color: Colors.red,),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),

      body: TabBarView(
        children: [
          //buildPage('Home Page'),

          //=====body testing button remove this====
          Posts(),
          Categories(),
          Profile(),
          Education()

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

