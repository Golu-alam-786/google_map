import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerScreen extends StatefulWidget {
  const CustomMarkerScreen({super.key});

  @override
  State<CustomMarkerScreen> createState() => _CustomMarkerScreenState();
}

class _CustomMarkerScreenState extends State<CustomMarkerScreen> {

  final Completer<GoogleMapController> _completerController = Completer();
  Uint8List? markerImage;

  List<String> images = [
    'assets/icons/car.png',
    'assets/icons/man.png',
    'assets/icons/man-walking.png',
    'assets/icons/train.png',
  ];


  List<Marker> _marker = [];

  List<LatLng> _latlng = [
    LatLng(25.779566, 84.749886),
    LatLng(25.89975, 84.939),
    LatLng(25.9593472, 85.0311361),
    LatLng(24.470901, 39.612236),
  ];

  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(25.89975, 84.939),
      zoom: 14
  );

  Future<Uint8List> getBytesFromAssets(String path, int width)async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();



  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData()async{
    for(int i = 0; i < images.length; i++){
      final Uint8List markerIcon = await getBytesFromAssets(images[i], 100);
      _marker.add(
        Marker(markerId: MarkerId(i.toString()),
          position: _latlng[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: "This is title marker$i"
          )
        )
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
            initialCameraPosition: _cameraPosition,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: Set.of(_marker),
            onMapCreated: (GoogleMapController controller) {
              _completerController.complete(controller);
          },
        ),
      ),
    );
  }
}
