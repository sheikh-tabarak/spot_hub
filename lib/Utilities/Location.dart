import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:spot_hub/Utilities/LocationFunctions.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Position? position;
  String? address;

  Future<void> _getAddressFromLatLng(Position position) async {}

  fetchCurrentLocation() async {
    bool ServiceEnable;
    LocationPermission permission;

    ServiceEnable = await Geolocator.isLocationServiceEnabled();

    if (!ServiceEnable) {
      Fluttertoast.showToast(msg: "Location Service not enabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "You denied the permission");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "You Denied Permission Forever");
    }

    Position _currentPosition = await Geolocator.getCurrentPosition();

    String? _currentAddress = "";
    await placemarkFromCoordinates(
            _currentPosition.latitude, _currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.country}';
      });
    }).catchError((e) {
      debugPrint(e);
    });

    setState(() {
      position = _currentPosition;
      address = _currentAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: BigText(
          text: "Location Frame",
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallText(
                text: position == null
                    ? "Location will go here"
                    : "${position.toString()}"),
                     SmallText(
                text: address == null
                    ? "Adress will go here"
                    : "$address"),
            PrimaryButton(
                TapAction: () async {
                  await 
                  FetchCurrentLocation().then((value) {
                    setState(() {
                      address = value;
                    });
                  });
                 // fetchCurrentLocation();
                },
                text: "Show Location",
                color: AppColors.PrimaryColor,
                icon: Icons.pin_drop)
          ],
        ),
      ),
    );
  }
}
