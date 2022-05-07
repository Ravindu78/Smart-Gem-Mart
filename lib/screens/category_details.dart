import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../product_details.dart';
import '../utils/color_utils.dart';

class CategoryDetails extends StatefulWidget {
  late String catname;
  CategoryDetails(this.catname);


  @override
  State<CategoryDetails> createState() => _CategoryDetailsState(this.catname);
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late String catname;
  _CategoryDetailsState(this.catname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Related to '+catname),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")],
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //carousel begins here
            //  image_carousel,

            //padding widget

            //horizontal list function  calling
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Advertisment")
    .where('varient', isEqualTo: catname)
    .snapshots(),
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
                    height: 529,
                    color: Colors.white,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),

                      itemCount: snapshot.data?.docs.length,

                      // ignore: missing_return
                      itemBuilder: (BuildContext context, index) {
                        QueryDocumentSnapshot category =
                        snapshot.data!.docs[index];

                        String imgurl = category['imgUrl'];
                        String price = category['price'];
                        String descrip = category['description'];
                        String name = category['varient'];
                        String color = category['color'];
                        String shape = category['shape'];
                        String weight = category['weight'];
                        String phoneNo = category['phone'];
                        String email = category['email'];
                        GeoPoint location = category['location'];


                        return Container(
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    //passing the values of the gem products to the product detils page
                                      builder: (context) => ProductDetails(
                                          imgurl,
                                          price,
                                          descrip,
                                          name,
                                          color,
                                          shape,
                                          weight,
                                          phoneNo,
                                          email,
                                          location))),
                              child: GridTile(
                                footer: Container(
                                  height: 40,
                                  color: Colors.white60,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                         color,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Text(
                                        'LKR '+ price,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                child: Image.network(
                                  category['imgUrl'],
                                  fit: BoxFit.fill,
                                ),
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
      ),
    );
  }
}
