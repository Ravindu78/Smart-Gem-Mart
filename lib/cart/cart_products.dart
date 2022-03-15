import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  const Cart_products({Key? key}) : super(key: key);

  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {

  var Products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/recentproducts/g3.jpg",
      "price": 85,
      "size":"M",
      "colour":"Red",
      "Quantity":1,
    },
    {
      "name": "Blazer",
      "picture": "images/recentproducts/g3.jpg",
      "price": 85,
      "size":"M",
      "colour":"Red",
      "Quantity":1,
    },
    {
      "name": "Blazer",
      "picture": "images/recentproducts/g3.jpg",
      "price": 85,
      "size":"M",
      "colour":"Red",
      "Quantity":1,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index){
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]["name"],
          cart_prod_color: Products_on_the_cart[index]["colour"],
          cart_prod_qty: Products_on_the_cart[index]["quantity"],
          cart_prod_size: Products_on_the_cart[index]["size"],
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_picture: Products_on_the_cart[index]["picture"],
        );
      });
  }
}

class Single_cart_product extends StatelessWidget {

  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
  this.cart_prod_name,
  this.cart_prod_picture,
  this.cart_prod_price,
  this.cart_prod_size,
  this.cart_prod_color,
  this.cart_prod_qty
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(

        child:ListTile(



          //===LEADING SECTION====

          leading: Image.asset(cart_prod_picture,width: 100.0,height: 100.0,),

          //==TITLE SECTION=====

          title: Text(cart_prod_name),

          //==SUBTITLE SECTION=====

          subtitle: Column(
            //==Row inside the column===
            children: [
             Row(
               children: [


                 //====this section is for the size of the product===

                 Padding(
                   padding: const EdgeInsets.all(0.0),
                   child: Text("size:"),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Text(cart_prod_size, style: TextStyle(color: Colors.red),),
                 ),

                 //====this section is for the color of the product===

                 Padding(padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                   child: Text("colour:"),),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(cart_prod_color,style: TextStyle(color: Colors.red),),
                 ),


               ],
             ),

              //=====THIS SECTION IS FOR THE PRODUCT PRICE====

              Container(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(right: 40),
                      child: Text("\$${cart_prod_price}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_up),),
                    Text('1'),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down),),
                  ],
                ),
              ),

            ],

          ),

         //trailing:
        ),
      ),
    );
  }

  void addQuantity(){

  }
}
