// ignore_for_file: file_names
import 'package:flutter/material.dart';


void main() {
  runApp(
    const MaterialApp(
      home: MapsView(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  String address = "null";
  String autocompletePlace = "null";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('location picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // PlacesAutocomplete(
          //   searchController: _controller,
          //   apiKey: "YOUR_API_KEY_HERE",
          //   mounted: mounted,
          //   showBackButton: false,
          //   onGetDetailsByPlaceId: (PlacesDetailsResponse? result) {
          //     if (result != null) {
          //       setState(() {
          //         autocompletePlace = result.result.formattedAddress ?? "";
          //       });
          //     }
          //   },
          // ),

          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Pick location",
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () {

            },
            child: const Text("Spot hub"),
          ),
          const Spacer(),
          Center(
              child: ElevatedButton(
                  child: const Text('Pick location'),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return
                            //  MapLocationPicker(

                            //   apiKey: "pk.eyJ1Ijoic2hlaWtodGFiYXJhayIsImEiOiJjbGNlNXhubHQzMTR4M3F0ODhveGIxOTEyIn0.EARmaF1MgHrRp7pgJbxFkA",
                            //   canPopOnNextButtonTaped: true,
                            //   currentLatLng: const LatLng(29.121599, 76.396698),
                            //   onNext: (GeocodingResult? result) {
                            //     if (result != null) {
                            //       setState(() {
                            //         address = result.formattedAddress ?? "";
                            //       });
                            //     }
                            //   },
                            //   onSuggestionSelected: (PlacesDetailsResponse? result) {
                            //     if (result != null) {
                            //       setState(() {
                            //         autocompletePlace =
                            //             result.result.formattedAddress ?? "";
                            //       });
                            //     }
                            //   },
                            // );

                            Text("data");
                      },
                    ));

                    // },
                  })),

          // const Spacer(),
          // ListTile(
          //   title: Text("Geocoded Address: $address"),
          // ),
          // ListTile(
          //   title: Text("Autocomplete Address: $autocompletePlace"),
          // ),
          // const Spacer(
          //   flex: 3,
          // ),
        ],
      ),
    );
  }
}
