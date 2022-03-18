import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            //carousel begins here
            //  image_carousel,

            //padding widget
            Padding(padding: EdgeInsets.all(8.0),
              child: Text('Categories'),
            ),
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
                    child: ListView.builder(

                      itemCount: snapshot.data?.docs.length,

                      // ignore: missing_return
                      itemBuilder: (BuildContext context, index) {
                        QueryDocumentSnapshot category =
                        snapshot.data!.docs[index];
                        String imgurl=category['imgUrl'];
                        String name=category['color'];



                        return Container(
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: (){},
                              // =>
                              //     Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //       //passing the values of the gem products to the product detils page
                              //         builder: (context) => ProductDetails(
                              //             imgurl,price,descrip,varient,color,shape,weight,phoneNo,email,location
                              //         ))),
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
                                    padding:  EdgeInsets.only(
                                        top: 5, bottom: 5),
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
      ),
    );
  }
}
