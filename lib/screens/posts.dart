import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../components/products.dart';
import 'addpost_screen.dart';
import 'category_details.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    // Widget image_carousel = new Container(
    //   height: 200.0,
    //   child: new Carousel(
    //     boxFit: BoxFit.cover,
    //     images: [AssetImage('images/p1.jpg'),
    //       AssetImage('images/p2.jpg'),
    //       AssetImage('images/p3.jpg'),
    //     ],
    //     autoplay: true,
    //     animationCurve: Curves.fastOutSlowIn,
    //     animationDuration: Duration(milliseconds: 1000),
    //     dotSize: 5.0,
    //     dotColor: Colors.white70,
    //     dotBgColor: Colors.transparent,
    //     indicatorBgPadding: 5.0,
    //   ),
    // );
    return Scaffold(

      body: Column(
        children: [
          StreamBuilder(
            stream:
            FirebaseFirestore.instance.collection("categories").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                //  return CircularProgressIndicator();
              }

              if (snapshot.hasData) {
                print('has data');
                return Container(
                  height: 130,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.docs.length,

                    // ignore: missing_return
                    itemBuilder: (BuildContext context, index) {
                      QueryDocumentSnapshot category =
                      snapshot.data!.docs[index];
                      String imgurl = category['imgUrl'];
                      String name = category['name'];
                      int catId = category['catId'];

                      return Container(
                        child: Card(
                          elevation: 5,
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryDetails(category['name']))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, right: 5, left: 5),
                                  width: 100,
                                  height: 80,
                                  child: Image.network(
                                    imgurl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              return SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          //carousel begins here
        //  image_carousel,

          //padding widget
          //horizontal list function  calli
          //recent products
         // Padding(padding: EdgeInsets.all(20.0),
         //   child: Text('recent products'),
         // ),
          Container(


            child: Flexible(child: Products()),
          ),


        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),backgroundColor: Colors.purpleAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
