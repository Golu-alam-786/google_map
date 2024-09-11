import 'package:flutter/material.dart';
import 'package:google_map/views/screen/google_map_implement/convert_latlng_to_address_screen.dart';
import 'package:google_map/views/screen/google_map_implement/custom_marker_info_window_screen.dart';
import 'package:google_map/views/screen/google_map_implement/custom_marker_screen.dart';
import 'package:google_map/views/screen/google_map_implement/get_user_current_location_screen.dart';
import 'package:google_map/views/screen/google_map_implement/google_places_api_screen.dart';
import 'package:google_map/views/screen/google_map_implement/home_screen.dart';
import 'package:google_map/views/screen/google_map_implement/network_image_custom_marker_screen.dart';
import 'package:google_map/views/screen/google_map_implement/poly_line_screen.dart';
import 'package:google_map/views/screen/google_map_implement/polygon_screen.dart';
import 'package:google_map/views/screen/google_map_implement/style_google_map_screen.dart';

class GoogleMapListScreen extends StatefulWidget {
  const GoogleMapListScreen({super.key});

  @override
  State<GoogleMapListScreen> createState() => _GoogleMapListScreenState();
}

class _GoogleMapListScreenState extends State<GoogleMapListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Google Map Screen",style: TextStyle(color: Colors.white),)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConvertLatLngToAddressScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Convert LatLng To Address",style: TextStyle(color: Colors.white),)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetUserCurrentLocationScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Get User Current Location",style: TextStyle(color: Colors.white),)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomMarkerScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Custom Marker Screen",style: TextStyle(color: Colors.white),)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomMarkerInfoWindowScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child:
                      const Center(child: Text("Custom Marker Info Window Screen",style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GooglePlacesApiScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Google Places Api Screen",style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const NetworkImageCustomMarkerScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(
                      child: Text("Network Image Custom Marker Screen",style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PolyLineScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Poly Line Screen",style: TextStyle(color: Colors.white),)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PolygonScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Polygon Screen",style: TextStyle(color: Colors.white),)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StyleGoogleMapScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: const Center(child: Text("Style Google Map Screen",style: TextStyle(color: Colors.white),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
