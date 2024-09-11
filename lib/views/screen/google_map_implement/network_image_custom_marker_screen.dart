import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:ui';

class NetworkImageCustomMarkerScreen extends StatefulWidget {
  const NetworkImageCustomMarkerScreen({super.key});

  @override
  State<NetworkImageCustomMarkerScreen> createState() => _NetworkImageCustomMarkerScreenState();
}

class _NetworkImageCustomMarkerScreenState extends State<NetworkImageCustomMarkerScreen> {

  Completer<GoogleMapController> _completerController = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(25.89975, 84.939),
      zoom: 14
  );

  final List<Marker> _markers = [];
  List<LatLng> _latLng = [
    const LatLng(25.779566, 84.749886),
    const LatLng(25.89975, 84.939),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    for(int i = 0; i < _latLng.length; i++){
      Uint8List? image = await loadNetworkImage("https://img.freepik.com/free-photo/photo-delicious-hamburger-isolated-white-background_125540-3378.jpg?t=st=1726046343~exp=1726049943~hmac=e1aa9e9badd208b0fc8d04d06337c26b83ce321de4f2b9622af41a07e97d4cd1&w=900",);
      final ui.Codec marketImageCodec = await ui.instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 100,
        targetWidth: 100
      );
      final ui.FrameInfo frameInfo = await marketImageCodec.getNextFrame();
      final ByteData? byteData = await frameInfo.image.toByteData(
        format: ui.ImageByteFormat.png
      );

      final Uint8List resizedImageMarker = byteData!.buffer.asUint8List();

      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
          position: _latLng[i],
          infoWindow: InfoWindow(
            snippet: 'Title of Marler $i'
          ),
          icon: BitmapDescriptor.fromBytes(resizedImageMarker)
        )
      );
        setState(() {

        });
    }
  }

 Future<Uint8List?> loadNetworkImage(String path)async{
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((image, synchronousCall) => completer.complete(image),)
    );

    final imageInfo = await completer.future;
    final byteData = await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PolyLine"),),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: Set.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _completerController.complete(controller);
        },
      ),
    );
  }
}
