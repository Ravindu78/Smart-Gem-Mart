import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_gem_mart/screens/chat_screen.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';

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
  GeoPoint location;

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
  GeoPoint location;
  _ProductDetailsState(this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0.2,
        title: InkWell(
            onTap: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
              },
            child: Text("Product Details")),
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
                            fontWeight: FontWeight.bold, color: Colors.deepPurple),)
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
                child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen('ravindu54@gmail.com')));
                    },
                    color: Colors.purpleAccent,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Chat")
                ),
              ),
              IconButton(onPressed: () {},
                icon: Icon(Icons.favorite_border, color: Colors.deepPurple,),),
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

        Container(
          child:  Expanded(
            child: Stack(children: [
              GoogleMap(

                markers: {
                  Marker(
                    visible: true,
                    markerId: const MarkerId('_kGooglePlex'),
                    //infoWindow: InfoWindow(title: 'Google Plex'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(location.latitude, location.longitude),
                  ),
                },
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition:
                const CameraPosition(target: LatLng(7.8731, 80.7718), zoom: 7.8),
              ),
            ]),
          ),
        )


        ],
      ),
    );
  }
}





