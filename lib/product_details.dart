import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String imgurl;
  String price;
  String descrip;
  String varient;
  String color;
  String shape;
  String weight;
  String phoneNo;
  String  email;
  String location;

  ProductDetails(this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location);

  //const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location);
}

class _ProductDetailsState extends State<ProductDetails> {
  String imgurl;
  String price;
  String descrip;
  String varient;
  String color;
  String shape;
  String weight;
  String phoneNo;
  String  email;
  String location;
  _ProductDetailsState(this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
              },
            child: Text("Smart Gem Mart")),
        actions: [
          new IconButton(onPressed:(){}, icon: Icon(Icons.search)
          ),

        ],
      ),

      body: Column(
        children: [
          Container(
            height: 200.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                  child:Image.network(
                      imgurl),
              ),
              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading:  Text(" $varient",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children:  [

                      Expanded(child: Text("$price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          //===========the first buttons======//
  


          //===========the second buttons======//
          Row(
            children: [
              //===== the size button
              Expanded(
                child: MaterialButton(onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Buy now")
                ),
              ),
              IconButton(onPressed: () {},
                icon: Icon(Icons.add_shopping_cart, color: Colors.red,),),
              IconButton(onPressed: () {},
                icon: Icon(Icons.favorite_border, color: Colors.red,),),
            ],
          ),

          ListTile(
            title: Text("Description"),
            subtitle: Text(
                "$descrip"),
          ),

          Divider(),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Varient", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$varient"),)
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Color", style: TextStyle(color: Colors.grey),),),

              //=======remember to creat the product brand====

              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$color"),)

            ],
          ),

          //=======remember to creat the product condition===

          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Cutting Shape", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$shape"),)

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Weight", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$weight"),)

            ],
          ),




        ],
      ),
    );
  }
}





