
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  String email;
  String username;
  String number;
  String password;
  String nic;

  AddUser({required this.email,required this.username,required this.number,required this.password,required this.nic,});

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .doc(email)
          .set({
        'email': email,
        'name': username,
         'number':number,
        'password':password,
        'nic':nic,
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }



}