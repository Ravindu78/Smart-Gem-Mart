import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/category_screens/category_details.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //carousel begins here
          //  image_carousel,

          //padding widget
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          //horizontal list function  calling
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
                  height: 150,
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
        ],
      ),
    );
  }
}
