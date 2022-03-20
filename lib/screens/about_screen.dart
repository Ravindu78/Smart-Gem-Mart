import 'package:flutter/material.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';



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
    );
  }
}
