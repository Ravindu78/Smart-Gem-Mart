import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';
import 'package:smart_gem_mart/globals.dart' as globals;

class ProductDetails extends StatefulWidget {


  //const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {



  @override
  void initState() {

    super.initState();

  }



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
            child: Text("Item Details")),
        // actions: [
        //   new IconButton(onPressed:(){}, icon: Icon(Icons.search)
        //   ),
        //
        // ],
      ),

      body: Column(
        children: [
          Container(
            height: 200.0,
            child: GridTile(
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 5,
                child:Image.network(
                    imgurl),
              ),
              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading:  Text(" $varient",
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children:  [

                      Expanded(child: Text("LKR $price",
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


          ListTile(
            title: Text("More",style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16.0),),
            subtitle: Text(
              "$descrip",style: TextStyle(color: Colors.black , fontSize: 14.0),) ,
          ),

          Divider(),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Varient :", style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$varient"),)
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Color :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 14.0),),),

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
                  "Cutting Shape :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 14.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$shape"),)

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Weight :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 14.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("$weight ct",style: TextStyle(color: Colors.black, fontSize: 15.0),),),

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





