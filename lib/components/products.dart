import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/product_details.dart';

import '../product_details.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Advertisment")
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
                        String imgurl=category['imgUrl'];
                        String price=category['price'];
                        String descrip=category['description'];
                        String varient=category['varient'];
                        String color=category['color'];
                        String shape=category['shape'];
                        String weight=category['weight'];
                        String phoneNo=category['phone'];
                        String  email=category['email'];
                        String  location=category['location'];


                        return Container(
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                                onTap: ()=> Navigator.of(context).push(
                                    MaterialPageRoute(
                                      //passing the values of the gem products to the product detils page
                                        builder: (context) => ProductDetails(
                                          imgurl,price,descrip,varient,color,shape,weight,phoneNo,email,location
                                        ))),
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 5, right: 5, left: 5),
                                      width: 100,
                                      height: 80,
                                      child: Image.network(
                                        category['color'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Text(
                                        category['varient'],
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

