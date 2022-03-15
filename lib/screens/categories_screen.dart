import 'package:flutter/material.dart';

import '../cart/cart.dart';
import '../components/horizontal_listview.dart';
import '../components/products.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          //horizontal list function  calling
          HorizontalList(),
        ],
      ),
    );
  }
}
