import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';
import 'package:smart_gem_mart/globals.dart' as globals;

class PurchasedDetails extends StatefulWidget {

  String docId;
  String orderId;
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
  String sellerEmail;
  String sellerphone;

  PurchasedDetails(this.docId,this.orderId,this.imgurl,this.price,this.descrip,this.varient,this.color,this.shape,this.weight,this.phoneNo,this.email,this.location,this.sellerEmail,this.sellerphone);

  @override
  _PurchasedDetailsState createState() => _PurchasedDetailsState();
}

class _PurchasedDetailsState extends State<PurchasedDetails> {


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
        title: Text("Item Details"),
      ),

      body: SafeArea(
        child: Column(
            children: [
              Container(
                height: 200.0,
                child: GridTile(
                  child: InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(20.0),
                    minScale: 0.1,
                    maxScale: 5,
                    child: Image.network(
                        widget.imgurl),
                  ),
                  footer: Container(
                    color: Colors.white54,
                    child: ListTile(
                      leading: Text(" ${widget.varient}",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      title: Row(
                        children: [

                          Expanded(child: Text("LKR ${widget.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),)
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("More", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),),
                subtitle: Text(
                  "${widget.descrip}",
                  style: TextStyle(color: Colors.black, fontSize: 14.0),),
              ),



              Divider(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                    child: Text(
                      "Varient :", style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),),),
                  Padding(padding: EdgeInsets.all(5.0),
                    child: Text("${widget.varient}"),)
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                    child: Text(
                      "Color :", style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),),),

                  //=======remember to creat the product brand====

                  Padding(padding: EdgeInsets.all(5.0),
                    child: Text("${widget.color}"),)

                ],
              ),


              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                    child: Text(
                      "Cutting Shape :", style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),),),
                  Padding(padding: EdgeInsets.all(5.0),
                    child: Text("${widget.shape}"),)

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                    child: Text(
                      "Weight :", style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),),),
                  Padding(padding: EdgeInsets.all(5.0),
                    child: Text("${widget.weight} ct", style: TextStyle(
                        color: Colors.black, fontSize: 15.0),),),

                ],
              ),

              Container(
                child: Expanded(
                  child: Stack(children: [
                    GoogleMap(

                      markers: {
                        Marker(
                          visible: true,
                          markerId: const MarkerId('_kGooglePlex'),
                          //infoWindow: InfoWindow(title: 'Google Plex'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: LatLng(widget.location.latitude,
                              widget.location.longitude),
                        ),
                      },
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      initialCameraPosition:
                      const CameraPosition(
                          target: LatLng(7.8731, 80.7718), zoom: 7.8),
                    ),
                  ]),
                ),
              ),
            ]
        ),
      ),
    );
  }
}





