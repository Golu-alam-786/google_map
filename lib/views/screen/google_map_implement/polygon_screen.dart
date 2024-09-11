import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {

  Completer<GoogleMapController> _completerController = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(25.89975, 84.939),
      zoom: 14
  );
  Set<Polygon> _polygon = HashSet<Polygon>();
  List<LatLng> points = [
    LatLng(24.470901, 39.612236),
    LatLng(25.89975, 84.939),
    LatLng(25.9593472, 85.0311361),
    LatLng(25.89975, 84.939),
    LatLng(24.470901, 39.612236),


  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(
      Polygon(
          polygonId: PolygonId("1"),
        points: points,
        fillColor: Colors.red.withOpacity(0.3),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Polygon"),),
      body: GoogleMap(
          initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        polygons: _polygon,
        onMapCreated: (GoogleMapController controller) {
            _completerController.complete(controller);

        },
      ),
    );
  }
}
