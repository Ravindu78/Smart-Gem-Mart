import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class getPost extends StatefulWidget {


  @override
  _getPostState createState() => _getPostState();
}

class _getPostState extends State<getPost> {
  @override
  Widget build(BuildContext context) {
    CollectionReference advertisment = FirebaseFirestore.instance.collection('Advertisment');
    return Scaffold(
      body: Container(
        child: Column(
          children: [
        FutureBuilder<DocumentSnapshot>(
        future: advertisment.doc('mail2').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("color: ${data['color']} ${data['mail']}");
          }

          return Text("loading");
        },
      ),
          ],
        ),
      )
    );
  }
}
