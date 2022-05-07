import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:smart_gem_mart/product_details.dart';

import '../product_details.dart';
import '../reusable_widgets/addpostdetails.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<AddPost> allitems = [];
  List<AddPost> _products = [];
  List<AddPost> prod = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Advertisment")
                  .orderBy('time', descending: true)
                  .where('publish', isEqualTo: 'true')

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
                    height: MediaQuery.of(context).size.height / 1.77,
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
                        String varient = category['varient'];
                        String color = category['color'];
                        String shape = category['shape'];
                        String weight = category['weight'];
                        String phoneNo = category['phone'];
                        String email = category['email'];
                        GeoPoint location = category['location'];

                        allitems = [
                          for (var i = 0; i < snapshot.data!.docs.length; i++)
                            AddPost(
                                varient,
                                color,
                                shape,
                                weight,
                                descrip,
                                price,
                                email,
                                imgurl,
                                location,
                                phoneNo,
                                'filepath')
                        ];

                        if (_products.length == snapshot.data!.docs.length &&
                            prod.length == snapshot.data!.docs.length) {
                          print('List fulled');
                        } else {
                          _products.add(allitems[index]);
                          prod.add(allitems[index]);
                          print('items added to search list');
                        }

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
                                          varient,
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
                                          varient,
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


      //==========SEARCH ==================================================================================////


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        heroTag: null,
        tooltip: 'Search For Your Gem',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<AddPost>(
            onQueryUpdate: (s) => print(s),
            items: _products,
            searchLabel: 'Search people',
            suggestion: Center(
              child: Text('Filter people by name, surname or age'),
            ),
            failure: Center(
              child: Text('No person found :('),
            ),
            filter: (prod) => [
              prod.varient,
              prod.color,
              prod.shape,
            ],
            builder: (prod) => Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      //passing the values of the gem products to the product detils page
                      builder: (context) => ProductDetails(
                          prod.imgUrl,
                          prod.price,
                          prod.description,
                          prod.varient,
                          prod.color,
                          prod.shape,
                          prod.weight,
                          prod.phone,
                          prod.email,
                          prod.location))),

                  child: GridTile(
                    footer: Container(
                      height: 40,
                      color: Colors.white60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              prod.varient,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          Text(

                            prod.price,
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    child: Image.network(
                      prod.imgUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}
