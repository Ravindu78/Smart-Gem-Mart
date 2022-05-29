import 'package:flutter/material.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';

import '../reusable_widgets/reusable_widget.dart';



class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  AboutState createState() =>AboutState();
}

class AboutState extends State<About> {
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

        title: Text("About Us"),


      ),
      body: Container(
child: SingleChildScrollView(
  child: Column(
    children: <Widget>[
      Center(child: logoWidgetaboutpage("assets/images/categories/logo1.png")),
      const SizedBox(
        height: 30,
      ),


          Center(

            // color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,2, 2, 2),
              child: Text (

                '"Smart Gem Mart is a gem buying and selling app that connects every stackeholders related to Sri lankan gem industry.'
                    'Smart Gem Mart assures Convenience, Reliability, security when people using this.  " ',style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold, fontSize: 20.0),

              ),
            )
      ),
      SizedBox(
        height:110 ,
      ),
      Center(

        // color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,2, 2, 2),
            child: Text (

              'Contact Us',style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold, fontSize: 14.0),

            ),
          )
      ),
      SizedBox(
        height:10 ,
      ),
      Center(

        // color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,2, 2, 2),
            child: Text (

              'Email : ravinduarsakulasooriya@gmail.com\nMobile : 01124343567',style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold, fontSize: 14.0),

            ),
          )
      ),

    ],
  )
),
      ),
    );
  }
}
