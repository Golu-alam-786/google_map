import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';

class GetUserCurrentLocationScreen extends StatefulWidget {
  const GetUserCurrentLocationScreen({super.key});

  @override
  State<GetUserCurrentLocationScreen> createState() => _GetUserCurrentLocationScreenState();
}

class _GetUserCurrentLocationScreenState extends State<GetUserCurrentLocationScreen> {



  final Completer<GoogleMapController> _completerController = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(25.779566, 84.749886),
      zoom: 8
  );

  final List<Marker> _markers = [
    const Marker(
        markerId: MarkerId("1"),
      position: LatLng(25.779566, 84.749886),
      infoWindow: InfoWindow(
        title: "My current location"
      )
    )

  ] ;

  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value) {

    },).onError((error, stackTrace) {
      print("Error : $error");
    },);
    return await Geolocator.getCurrentPosition();
  }

  loadData(){
    getUserCurrentLocation().then((value) async{
      print("My current location");
      print(value.latitude.toString()+" "+ value.longitude.toString());


      _markers.add(
          Marker(
              markerId: const MarkerId("2"),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: const InfoWindow(
                  title: "My current location"
              )
          )
      );

      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );

      final GoogleMapController googleMapController = await _completerController.future;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {

      });

    },);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: _cameraPosition,
        markers: Set.of(_markers),
        onMapCreated: (GoogleMapController controller) {
            _completerController.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
      },child: const Icon(CupertinoIcons.list_bullet),),
    );
  }
}

