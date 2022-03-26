
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/globals.dart' as globals;

class ChatScreen extends StatefulWidget {
  String email;

   ChatScreen(this.email);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                //color: Colors.deepPurple,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('users').doc(globals.userEmail).collection('messages').doc(widget.email).collection('messages').orderBy('time',descending: false).snapshots(),
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
                        return ListTile(
                          //title: Text(data['sender']),
                          subtitle: widget.email==data['sender']?Text(data['text'],)
                              :Text(data['text'],textAlign: TextAlign.right,)
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 80,
              //color: Colors.pink,
              child: Row(
            children: [
              Expanded(
                child: TextField(
                controller: messageController,
                  decoration: InputDecoration(
                    labelText: 'enter message'
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                addMessage(messageController.text);
              }, child: Text('send'))
            ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addMessage(String text) async {
    await FirebaseFirestore.instance.collection('users').doc(globals.userEmail).collection('messages').doc(widget.email).collection('messages').add({
      'text': text,
      'time': DateTime.now(),
      'sender':globals.userEmail,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    await FirebaseFirestore.instance.collection('users').doc(widget.email).collection('messages').doc(globals.userEmail).collection('messages').add({
      'text': text,
      'time': DateTime.now(),
      'sender':globals.userEmail,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


}

