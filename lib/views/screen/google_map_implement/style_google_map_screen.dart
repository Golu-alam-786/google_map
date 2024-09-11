import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StyleGoogleMapScreen extends StatefulWidget {
  const StyleGoogleMapScreen({super.key});

  @override
  State<StyleGoogleMapScreen> createState() => _StyleGoogleMapScreenState();
}

class _StyleGoogleMapScreenState extends State<StyleGoogleMapScreen> {
  String mapTheme = '';
  final Completer<GoogleMapController> _completerController = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(25.89975, 84.939),
      zoom: 14
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context).loadString("assets/map_theme/night_theme.json").then((value) {
      mapTheme = value;
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps Theme"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: (){
                    _completerController.future.then((value) {
                      DefaultAssetBundle.of(context).loadString("assets/map_theme/silver_theme.json").then((stringValue) {
                        value.setMapStyle(stringValue);
                      },);
                    },);
                  },
                    child: const Text("Silver")
                ),
                PopupMenuItem(
                    onTap: (){
                      _completerController.future.then((value) {
                        DefaultAssetBundle.of(context).loadString("assets/map_theme/dark_theme.json").then((stringValue) {
                          value.setMapStyle(stringValue);
                        },);
                      },);
                    },
                    child: const Text("Dark")
                ),
                PopupMenuItem(
                    onTap: (){
                      _completerController.future.then((value) {
                        DefaultAssetBundle.of(context).loadString("assets/map_theme/night_theme.json").then((stringValue) {
                          value.setMapStyle(stringValue);
                        },);
                      },);
                    },
                    child: const Text("Night")
                ),
                PopupMenuItem(
                    onTap: (){
                      _completerController.future.then((value) {
                        DefaultAssetBundle.of(context).loadString("assets/map_theme/retro_theme.json").then((stringValue) {
                          value.setMapStyle(stringValue);
                        },);
                      },);
                    },
                    child: const Text("Retro")
                ),
                PopupMenuItem(
                    onTap: (){
                      _completerController.future.then((value) {
                        DefaultAssetBundle.of(context).loadString("assets/map_theme/aubergine_theme.json").then((stringValue) {
                          value.setMapStyle(stringValue);
                        },);
                      },);
                    },
                    child: const Text("Aubergine")
                ),

              ];

          },)
        ],
      ),
      body: GoogleMap(
          initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(mapTheme);
            _completerController.complete(controller);
        },
      ),
    );
  }
}
