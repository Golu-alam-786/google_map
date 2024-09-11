import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerInfoWindowScreen extends StatefulWidget {
  const CustomMarkerInfoWindowScreen({super.key});

  @override
  State<CustomMarkerInfoWindowScreen> createState() => _CustomMarkerInfoWindowScreenState();
}

class _CustomMarkerInfoWindowScreenState extends State<CustomMarkerInfoWindowScreen> {
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final List<Marker> _markers = [];
  final List<LatLng> _latLng = [
    const LatLng(25.779566, 84.749886),
    const LatLng(25.89975, 84.939),
    const LatLng(25.9593472, 85.0311361),
    const LatLng(24.470901, 39.612236),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    for (int i = 0; i < _latLng.length; i++) {
      if (i % 2 == 0) {
        _markers.add(
          Marker(
              markerId: MarkerId(i.toString()),
              icon: BitmapDescriptor.defaultMarker,
              position: _latLng[i],
              onTap: () {
                _customInfoWindowController.addInfoWindow!(
                    // Text(i.toString()),
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: const CircleAvatar(radius: 20,backgroundColor: Colors.blue,),
                    ),
                    _latLng[i]);
              }),
        );
      }else{
        _markers.add(Marker(
            markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.defaultMarker,
            position: _latLng[i],
            onTap: () {
              if(_customInfoWindowController.addInfoWindow != null){
                _customInfoWindowController.addInfoWindow!(
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/photo-delicious-hamburger-isolated-white-background_125540-3378.jpg?t=st=1726046343~exp=1726049943~hmac=e1aa9e9badd208b0fc8d04d06337c26b83ce321de4f2b9622af41a07e97d4cd1&w=900",
                                ),
                                fit: BoxFit.fitWidth,
                                filterQuality: FilterQuality.high,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),

                          const Padding(
                            padding:
                            EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Beef Tacos',
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  ),
                                ),
                                Spacer(),
                                Text(".3 mi.")
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Text(
                              'Help me finish tagfdjdksaasj khsakd ashk akkaskhd kasd aksdaskdh kasdh ksadh kjshd kas dkhas dsa d',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          )
                        ],
                      ),
                    ),
                    _latLng[i]);
              }else{
                print("Error");
              }
            },
        ),
        );
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Info Window"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
                target: LatLng(25.9593472, 85.0311361), zoom: 14),
            markers: Set.of(_markers),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            width: 300,
            height: 200,
            offset: 35,
          )
        ],
      ),
    );
  }
}
