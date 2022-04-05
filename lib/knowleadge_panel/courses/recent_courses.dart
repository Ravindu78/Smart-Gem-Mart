import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import 'courseDetails_screen.dart';


class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
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
                child: Text("Recent Courses"))),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Courses').snapshots(),
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
                    QueryDocumentSnapshot Courses = snapshot.data!.docs[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseDetails(
                                    Courses['CourseName'],
                                    Courses['Institute'],
                                    Courses['number'],
                                    Courses['Details'],
                                    Courses['imgUrl'])),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(Courses['imgUrl']),
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
                                  child: Text(Courses['CourseName'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
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
