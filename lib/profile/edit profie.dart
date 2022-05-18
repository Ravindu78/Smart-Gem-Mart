import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/globals.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();

}
final db = FirebaseFirestore.instance;
TextEditingController _usernameController = TextEditingController();
TextEditingController _mobileController = TextEditingController();
TextEditingController _nicController = TextEditingController();

Future<void> updateName () async{
  // Update one field, creating the document if it does not already exist.
  final data = {"name": _usernameController.text};

  db.collection("users").doc(userEmail).set(data, SetOptions(merge: true));
}
Future<void> updateMobile () async{
  // Update one field, creating the document if it does not already exist.
  final data = {"name": _usernameController.text};

  db.collection("users").doc(userEmail).set(data, SetOptions(merge: true));
}
Future<void> updateNic () async{
  // Update one field, creating the document if it does not already exist.
  final data = {"name": _usernameController.text};

  db.collection("users").doc(userEmail).set(data, SetOptions(merge: true));
}
class _EditProfileState extends State<EditProfile> {
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
