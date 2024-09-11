import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _completerController = Completer();
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(25.779566, 84.749886), zoom: 8);

  final List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(25.779566, 84.749886),
        infoWindow: InfoWindow(title: "My Current Location")),
    const Marker(
        markerId: MarkerId("2"),
        position: LatLng(25.89975, 84.939),
        infoWindow: InfoWindow(title: "Pakri Mohammad")),
    const Marker(
        markerId: MarkerId("3"),
        position: LatLng(25.9593472, 85.0311361),
        infoWindow: InfoWindow(title: "Maker")),
    const Marker(
        markerId: MarkerId("4"),
        position: LatLng(24.470901, 39.612236),
        infoWindow: InfoWindow(title: "Madina")),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          compassEnabled: true,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _completerController.complete(controller);
          },
          markers: Set.of(_marker),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _completerController.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
                const CameraPosition(target: LatLng(24.470901, 39.612236),zoom: 14)),
          );
        },
        child: const Icon(Icons.location_disabled_outlined),
      ),
    );
  }
}
