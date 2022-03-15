import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/screens/signin_screen.dart';
import 'package:smart_gem_mart/screens/signup_screen.dart';
import 'package:smart_gem_mart/reusable_widgets/reusable_widget.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const SignInScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Container(width: 410.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo here
              logoWidget("assets/images/logo1.png"),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
               height: 20,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
