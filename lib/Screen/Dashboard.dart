// import 'package:akses_lokasi/Services/getlokasi.dart';
// import 'package:akses_lokasi/Services/getlokasi.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:flutter/services.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';

// void main() {
//   runApp(MyApp());
// }

class LokasiPage extends StatefulWidget {
  // location
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<LokasiPage> {
  var locationMessage = '';
  String latitude = '0';
  String longitude = '0';
  // GeolocatorService geolocatorService = new GeolocatorService();

  // function for getting the current location
  // but before that you need to add this permission!
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    // passing this to latitude and longitude strings
    latitude = "$lat";
    longitude = "$long";
    // getjalan(latitude, longitude);
    // getjalan(latitude, longitude);
    // geolocatorService.getlokasi();
    _getPlace(latitude, longitude);

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });
  }

  // function for opening it in google maps

  void googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    // if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
    // } else
    //   throw ("Couldn't open google maps");
  }

  void getjalan(lat, long) async {
    // final coordinates = new Coordinates(1.10, 45.50);
    // final addresses =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // final first = addresses.first;
    // print("${first.featureName} : ${first.addressLine}");
  }
  List<Placemark> place = [];
  void _getPlace(lat, long) async {
    double latitude = double.parse(lat);
    double longitude = double.parse(long);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark placeMark = placemarks[0];
    // print(placeMark.toJson());
    // final data = placeMark.toJson();
    // // final json = jsonDecode(data2(data));
    // // final student = Student.fromJson(json);
    // print("ini semuanya");
    // print(placeMark);
    // var json2 = placeMark.toJson();
    String jalan = '${placeMark.street}';
    String kelurhan = '${placeMark.subLocality}';
    String kecamatan = '${placeMark.locality}';
    String kota = '${placeMark.subAdministrativeArea}';
    String prov = '${placeMark.administrativeArea}';
    String kodepos = '${placeMark.postalCode}';
    String Addreas =
        '${jalan},${kelurhan},${kecamatan},${kota},${prov} ${kodepos}';
    print(Addreas);
    // var parsedJson = json.decode(json2); // need to import convert library
    // print('${parsedJson.runtimeType} : $parsedJson'); //Display full json Parse
    // print(parsedJson['name']); //fetch value using key 'name'
    // print(parsedJson['website']);

    // String name = placeMark;
    // this is all you need
    //   Placemark placeMark  = place[0];
    // String name = placemarks.name;
    // String subLocality = placemarks.subLocality;
    // String locality = placemarks.locality;
    // String administrativeArea = placemarks.administrativeArea;
    // String postalCode = placemarks.postalCode;
    // String country = placemarks.country;
    // String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    // print(placeMark);
    // print(placemarks);
    setState(() {
      place = placemarks;
      // print(place);
      // String data = place.toString();
      // print(data);

      //  List<String>data=new List();
    });
  }

  Map<String, dynamic> data2(Map<String, dynamic> data) => data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User location application',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 45.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Get User Location",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                locationMessage,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 05.0,
              ),

              // button for taking the location
              FlatButton(
                color: Colors.white,
                onPressed: () {
                  getCurrentLocation();
                },
                child: Text("Get User Location"),
              ),

              FlatButton(
                color: Colors.white,
                onPressed: () {
                  googleMap();
                },
                child: Text("Open GoogleMap"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
