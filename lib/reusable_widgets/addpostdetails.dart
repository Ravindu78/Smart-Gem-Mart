
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

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
        .doc(email)
        .set({
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
    })
        .then((value) {
          print("advertisment Added");
    })
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> uploadImage() async{
    File file = File(filePath);
    try{
      final ref = await storage.FirebaseStorage.instance.ref('uploads/image.png').putFile(file);
      final url = await ref.ref.getDownloadURL();
      print(url);
      addPost(url);
    } on FirebaseException catch (e) {
      print('image upload error');
    }
  }



}