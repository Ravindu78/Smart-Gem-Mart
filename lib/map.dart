import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_gem_mart/reusable_widgets/addpostdetails.dart';


class SelectLocation extends StatefulWidget {

  String varient;
  String color;
  String shape;
  String weight;
  String description;
  String price;
  String email;
  String imgUrl;
  String phone;
  String filePath;

  SelectLocation(this.varient,this.color,this.shape,this.weight,this.description,this.price,this.email,this.imgUrl,this.phone,this.filePath);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {

  var lati = 0.0;
  var longi = 0.0;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position =
    await Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
    setState(() {
      lati = position.latitude;
      longi = position.longitude;

    });
  }

  @override
  void initState() {
    _determinePosition();
    _mapTapped(LatLng(lati, longi));
    super.initState();
  }

  var markerVisibility = false;
  _mapTapped(LatLng location) {
    setState(() {
      lati = location.latitude;
      longi = location.longitude;
      markerVisibility = true;
      print(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              GoogleMap(
                onTap: _mapTapped,
                markers: {
                  Marker(
                    visible: markerVisibility,
                    markerId: const MarkerId('_kGooglePlex'),
                    //infoWindow: InfoWindow(title: 'Google Plex'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(lati, longi),
                  ),
                },
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition:
                const CameraPosition(target: LatLng(7.8731, 80.7718), zoom: 7.8),
              ),
            ]),
          ),
          ElevatedButton(
            onPressed: (){
              AddPost(widget.varient,widget.color,widget.shape,widget.weight,widget.description,widget.price,widget.email,widget.imgUrl,GeoPoint(lati,longi),widget.phone,widget.filePath).uploadImage();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
