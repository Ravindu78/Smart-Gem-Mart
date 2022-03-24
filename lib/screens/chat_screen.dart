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
                  stream: FirebaseFirestore.instance.collection('messages').doc(globals.userEmail).collection(widget.email).snapshots(),
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
                          title: Text(data['sender']),
                          subtitle: Text(data['text']),
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
    final res = await FirebaseFirestore.instance.collection('messages').doc(globals.userEmail).collection(widget.email).add({
      'text': text,
      'time': DateTime.now(),
      'sender':globals.userEmail,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    final res2 = await FirebaseFirestore.instance.collection('messages').doc(widget.email).collection(globals.userEmail).add({
      'text': text,
      'time': DateTime.now(),
      'sender':globals.userEmail,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


}

