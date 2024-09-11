import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLineScreen extends StatefulWidget {
  const PolyLineScreen({super.key});

  @override
  State<PolyLineScreen> createState() => _PolyLineScreenState();
}

class _PolyLineScreenState extends State<PolyLineScreen> {

  Completer<GoogleMapController> _completerController = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(25.89975, 84.939),
      zoom: 14
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLine = {};
  List<LatLng> _latLng = [
    const LatLng(25.779566, 84.749886),
    const LatLng(25.89975, 84.939),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 0; i < _latLng.length; i++){
      _markers.add(
        Marker(markerId: MarkerId(i.toString()),
          position: _latLng[i],
          infoWindow: const InfoWindow(
            title: "Really cool place",
            snippet: "5 Star Rating"
          ),
          icon: BitmapDescriptor.defaultMarker
        )
      );

      setState(() {

      });
      _polyLine.add(
          Polyline(polylineId: PolylineId("1"),points: _latLng,color: Colors.orange)
      );

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PolyLine"),),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        myLocationEnabled: true,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _completerController.complete(controller);
        },
        polylines: _polyLine,
      ),
    );
  }
}
