import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/globals.dart' as globals;
import 'package:smart_gem_mart/chat/chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').doc(globals.userEmail).collection('messages').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(document.id)));
                    },
                    child: ListTile(
                      title: FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance.collection('users').doc(document.id).get(),
                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return Text("Document does not exist");
                          }

                          if (snapshot.connectionState == ConnectionState.done) {
                            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                            return
                              Row(
                                children: [
                                   Icon(Icons.message),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width:330,
                                      height: 50,
                                      // margin: const EdgeInsets.all(2.0),
                                      padding: const EdgeInsets.all(3.0),

                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple[100],
                                        // border: Border.all(color: Colors.black,width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0) //                 <--- border radius here
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(110, 6, 0, 10),
                                            child: Text("${data['name']}",style: TextStyle(fontSize: 17),),
                                          ),
                                          // Padding(
                                          //
                                          //   padding: const EdgeInsets.fromLTRB(2, 6, 0, 10),
                                          //   child: Icon(Icons.person,size: 15,),
                                          // ),
                                        ],

                                      ),

                                      alignment: AlignmentDirectional.centerEnd,
                                    ),
                                  ),
                                ],
                              );

                          }

                          return Text("");
                        },
                      ),
                      //subtitle: Text(data['company']),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<String?> getName(String id) async {
    String name = "";
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot.get('name');
        print('Document exists on the database');
      }
    });
    return name;
  }

}
