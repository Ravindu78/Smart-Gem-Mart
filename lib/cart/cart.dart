import 'package:flutter/material.dart';


import 'cart_products.dart';

class Cart extends StatefulWidget {
   const Cart({Key? key}) : super(key: key);

   @override
   _CartState createState() => _CartState();
 }

 class _CartState extends State<Cart> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: new AppBar(
         elevation: 0.2,
         backgroundColor: Colors.red,
         title: Text("Cart"),
     actions: [
     new IconButton(onPressed:(){}, icon: Icon(Icons.search)
     ),

     ],
     ),
       body: Cart_products(),
       bottomNavigationBar: Container(
         color: Colors.white,
         child: Row(
           children: [
             Expanded(child: ListTile(
               title: Text("Total"),
               subtitle: Text("\$230"),
             )),
             Expanded(child: MaterialButton(onPressed: (){},
             child: Text("Check out", style: TextStyle(color: Colors.white),),
             color: Colors.red,),
             ),
           ],
         ),
       ),
     );
   }
 }
