import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/knowleadge_panel/labs/Laboratory_screen.dart';

class KnowledgePanel extends StatefulWidget {
  const KnowledgePanel({Key? key}) : super(key: key);

  @override
  State<KnowledgePanel> createState() => _KnowledgePanelState();
}

class _KnowledgePanelState extends State<KnowledgePanel> {

  List<String> images = [];
  bool carouselSet = false;

  Future<void> getImages() async{
    FirebaseFirestore.instance.collection('newspanel').get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["imgUrl"]);
        images.add((doc["imgUrl"]));
      });
      setState(() {
        carouselSet = true;
      });
    });

  }

  @override
  void initState() {
    getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(

              child: Container(
                  height: 200.0,
                  width: 390.0,
                  child: (carouselSet)? Carousel(
                    images: [
                      NetworkImage(images[0]),
                      NetworkImage(images[1]),
                      NetworkImage(images[2]),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.5),
                    borderRadius: true,
                  ): Center(
                    child: CircularProgressIndicator(),
                  ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            color: Colors.deepPurple[100],
            child: ListTile(
              onTap: (){
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Labs(),
                  ),
                );
              },
                  title: Text('LABORATORIES'),
                  subtitle: Text(
                      'Lab Services'
                  ),

          ),
          ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              color: Colors.pink[100],
              child: ListTile(
                onTap: () {},
                title: Text('Cources'),
                subtitle: Text(
                    'Courses and Deplomas'
                ),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              color: Colors.deepPurple[100],
              child: ListTile(
                onTap: () {},
                title: Text('Cources'),
                subtitle: Text(
                    'Courses and Deplomas'
                ),

              ),
            ),


          ],

        ),

      ),

    );
  }
}
