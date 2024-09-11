import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GooglePlacesApiScreen extends StatefulWidget {
  const GooglePlacesApiScreen({super.key});

  @override
  State<GooglePlacesApiScreen> createState() => _GooglePlacesApiScreenState();
}

class _GooglePlacesApiScreenState extends State<GooglePlacesApiScreen> {
  TextEditingController searchController = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = "123456";
  List<dynamic> _placesList = [];
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      onChange();
    },);
  }
  void onChange() {
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v8();
      });
    }
    getSuggestion(searchController.text);
  }

  void getSuggestion(String inputSearchData)async{
    String googleApiKey = "AIzaSyCPAcuB259rhTenxSaQEbbbEU3VadkXJUs";
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$inputSearchData&key=$googleApiKey&sessiontoken=$_sessionToken';
    
    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    print('data');
    print(data);
    if(response.statusCode == 200){
      setState(() {
        _placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }else{
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Search Places"), elevation: 0,),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
        children: [
          TextFormField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search places with name'
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _placesList.length,
                itemBuilder: (context, index) {
                  var data = _placesList[index];
                  return ListTile(
                    onTap: ()async{
                      List<Location> location = await locationFromAddress(data['description']);
                      print(location.last.longitude);
                      print(location.last.latitude);
                    },
                    title: Text(data['description']),
                  );

              },)
          )
        ],
      ),
    ),);
  }
}


