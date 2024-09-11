import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLngToAddressScreen extends StatefulWidget {
  const ConvertLatLngToAddressScreen({super.key});

  @override
  State<ConvertLatLngToAddressScreen> createState() => _ConvertLatLngToAddressScreenState();
}

class _ConvertLatLngToAddressScreenState extends State<ConvertLatLngToAddressScreen> {
  String addressToLongitudeAndLatitude = '';
  String longitudeAndLatitudeToAddress = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(addressToLongitudeAndLatitude),
          Text(longitudeAndLatitudeToAddress),
          GestureDetector(
            onTap: ()async{
              List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placeMarker = await placemarkFromCoordinates(52.2165157, 6.9437819);
              setState(() {
                addressToLongitudeAndLatitude = "${locations.last.longitude} ${locations.last.latitude}";
                longitudeAndLatitudeToAddress = "${placeMarker.reversed.last.country} ${placeMarker.reversed.last.locality} ${placeMarker.reversed.last.subAdministrativeArea}";
              });

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.green
                ),
                child: const Center(
                  child: Text("Convert"),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
