import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'labDetails_screen.dart';

class Labs extends StatefulWidget {
  const Labs({Key? key}) : super(key: key);

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Labs').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data?.docs.length,

                  // ignore: missing_return
                  itemBuilder: (BuildContext context, index) {
                    QueryDocumentSnapshot Labs =
                    snapshot.data!.docs[index];
                  return Card(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LabDetails(Labs['labName'], Labs['address'], Labs['number'], Labs['services'],Labs['imgUrl'])),
                        );
                      },
                      child: ListTile(
                        title: Text(Labs['labName']),
                        subtitle: Text(Labs['address']),
                      ),
                    ),
                  );
                }
              );
            },
          ),
        ),
      ),
    );
  }
}
