import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0.2,
        title: InkWell(
            onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
            },
            child: Container(
                child: Text("Recent Labs"))),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Labs').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    QueryDocumentSnapshot Labs = snapshot.data!.docs[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LabDetails(
                                    Labs['labName'],
                                    Labs['address'],
                                    Labs['number'],
                                    Labs['services'],
                                    Labs['imgUrl'])),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(Labs['imgUrl']),
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),

                           child: Padding(
                             padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                             child: Container(
                               color: Colors.white60,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(9, 8, 0, 0),
                                   child: Text(Labs['labName'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                 )),
                           ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
