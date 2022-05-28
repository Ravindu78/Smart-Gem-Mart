import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/globals.dart';
import 'package:smart_gem_mart/profile/profile_screen.dart';
import 'package:smart_gem_mart/screens/home_screen.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();

}

class _EditProfileState extends State<EditProfile> {
  final db = FirebaseFirestore.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _nicController = TextEditingController();
  showAlertDialog(String message, BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert Box"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> updateName () async{
    // Update one field, creating the document if it does not already exist.
    final data = {"name": _usernameController.text};
    try{
      db.collection("users").doc(userEmail).set(data, SetOptions(merge: true));
      _usernameController.text='';
      showAlertDialog('Updated Succesfully!', context);
    }
    catch (e)
    {
      showAlertDialog('Failed to update', context);
    }


  }
  Future<void> updateMobile () async{
    // Update one field, creating the document if it does not already exist.
    final data = {"number": _mobileController.text};


    try{
      db.collection("users").doc(userEmail).set(data, SetOptions(merge: true));
      _mobileController.text='';
      showAlertDialog('Updated Succesfully!', context);
    }
    catch (e)
    {
      showAlertDialog('Failed to update', context);
    }

  }
  Future<void> updateNic () async{
    // Update one field, creating the document if it does not already exist.
    final data = {"nic": _nicController.text};



    try{
      db.collection("users").doc(userEmail).set(data, SetOptions(merge: true));

      _nicController.text='';
      showAlertDialog('Updated Succesfully!', context);
    }
    catch (e)
    {
      showAlertDialog('Failed to update', context);
    }
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

        title: Text("Edit Profile"),


      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: reusableTextField7(
                    " update the name", Icons.monitor_weight, false, true,
                    _usernameController, 'Please Enter the name'),),
                Expanded(
                    child: priceCheckerUiButton1(context, "Update name", () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>  Profile(),
                        ),
                      );
                      updateName();
                    })),
              ],

            ),
            Row(
              children: [
                Expanded(child: reusableTextField7(
                    " update mobile", Icons.monitor_weight, false, true,
                    _mobileController, 'Please Enter the mobile'),),
                Expanded(
                    child: priceCheckerUiButton1(context, "Update mobile", () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>  Profile(),
                        ),
                      );
                      updateMobile();
                    })),
              ],

            ),
            Row(
              children: [
                Expanded(child: reusableTextField7(
                    " update nic", Icons.monitor_weight, false, true,
                    _nicController, 'Please Enter nic'),),
                Expanded(
                    child: priceCheckerUiButton1(context, "Update nic", () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>  Profile(),
                        ),
                      );
                      updateNic();
                    })),
              ],

            )
          ],
        ),
      ),
    );
  }

}
