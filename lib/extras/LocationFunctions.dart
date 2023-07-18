import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> FetchCurrentLocation() async {

bool ServiceEnable;
LocationPermission permission;

ServiceEnable= await Geolocator.isLocationServiceEnabled();

if(!ServiceEnable){
  Fluttertoast.showToast(msg: "Location Service not enabled");
}

permission= await Geolocator.checkPermission();

if(permission==LocationPermission.denied){
  permission=await Geolocator.requestPermission();

  if(permission==LocationPermission.denied){
      Fluttertoast.showToast(msg: "You denied the permission");
  }
}

if(permission==LocationPermission.deniedForever){
    Fluttertoast.showToast(msg: "You Denied Permission Forever");
}


Position _currentPosition =  await Geolocator.getCurrentPosition();

String _currentAddress = "";
    await placemarkFromCoordinates(
            _currentPosition.latitude, _currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      //setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.country}';
     // });
    }).catchError((e) {
      debugPrint(e);
    });

return _currentAddress;

}