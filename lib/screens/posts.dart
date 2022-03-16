import 'package:flutter/material.dart';

import '../cart/cart.dart';
import '../components/category_screen.dart';
import '../components/products.dart';
import 'addpost_screen.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    // Widget image_carousel = new Container(
    //   height: 200.0,
    //   child: new Carousel(
    //     boxFit: BoxFit.cover,
    //     images: [AssetImage('images/p1.jpg'),
    //       AssetImage('images/p2.jpg'),
    //       AssetImage('images/p3.jpg'),
    //     ],
    //     autoplay: true,
    //     animationCurve: Curves.fastOutSlowIn,
    //     animationDuration: Duration(milliseconds: 1000),
    //     dotSize: 5.0,
    //     dotColor: Colors.white70,
    //     dotBgColor: Colors.transparent,
    //     indicatorBgPadding: 5.0,
    //   ),
    // );
    return Scaffold(

      body: Column(
        children: [
          //carousel begins here
        //  image_carousel,

          //padding widget
          //horizontal list function  calli
          //recent products
          Padding(padding: EdgeInsets.all(20.0),
            child: Text('recent products'),
          ),
          Container(

            child: Flexible(child: Products()),
          ),


        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
