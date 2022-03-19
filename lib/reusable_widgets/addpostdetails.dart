
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:path/path.dart' as p;

class AddPost {

  String varient;
  String color;
  String shape;
  String weight;
  String description;
  String price;
  String email;
  String imgUrl;
  String location;
  String phone;
  String filePath;

  AddPost(this.varient,this.color,this.shape,this.weight,this.description,this.price,this.email,this.imgUrl,this.location,this.phone,this.filePath);

  CollectionReference advertisment = FirebaseFirestore.instance.collection('Advertisment');

  Future<void> addPost(String url) {

    // Call the user's CollectionReference to add a new user
    return advertisment

        .add({
      'advertismentId':01,
      'varient': varient, // John Doe
      'color': color, // Stokes and Sons
      'shape':shape,
      'weight':weight,
      'description':description,
      'price':price,
      'email':email,
      'imgUrl':url,
      'location':location,
      'phone':phone,
      'time':DateTime.now(),
    })
        .then((value) {
          print("advertisment Added");
    })
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> uploadImage() async{
    Timestamp time = Timestamp.now();
    String filename = '$email-$time';
    File file = File(filePath);
    try{
      final ref = await storage.FirebaseStorage.instance.ref('advertisments/$filename').putFile(file);
      final url = await ref.ref.getDownloadURL();
      print(url);
      addPost(url);
    } on FirebaseException catch (e) {
      print('image upload error');
    }
  }



}