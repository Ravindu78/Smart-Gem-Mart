
import 'package:cloud_firestore/cloud_firestore.dart';

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

  AddPost(this.varient,this.color,this.shape,this.weight,this.description,this.price,this.email,this.imgUrl,this.location,this.phone);

  CollectionReference advertisment = FirebaseFirestore.instance.collection('Advertisment');

  Future<void> addPost() {
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
      'imgUrl':imgUrl,
      'location':location,
      'phone':phone,
    })
        .then((value) => print("advertisment Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



}