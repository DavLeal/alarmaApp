import 'dart:convert' show json;
import 'dart:ffi';

import 'package:alarma_app/providers/providermap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_street_map/flutter_open_street_map.dart';
import 'package:http/http.dart' as http;

Future<Coordenadas> fetchPost() async {
  final response = await http.get(Uri.parse(""));
  if (response.statusCode == 200) {
    return Coordenadas.fromJson(json.decode(response.body));
  } else {
    throw Exception('No se pudieron obtener datos');
  }
}

class Coordenadas {
  final int userID;
  final double latitud; //= 19.644347
  final double longitud; // = -99.241016
  Coordenadas(
      {required this.userID, required this.latitud, required this.longitud});
  factory Coordenadas.fromJson(Map<String, dynamic> json) {
    return Coordenadas(
        userID: json['userID'],
        latitud: json['latitud'],
        longitud: json['longitud']);
  }
}

class MapPage extends StatelessWidget {
  String coordenada = mapProvider as String;
  static String id = 'map_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Coordenadas? coordenadas;
  @override
  Widget build(BuildContext context) {
    //double lat = coordenadas?.latitud.toString() as double;
    //double long = coordenadas?.longitud.toString() as double;
    return Scaffold(
      key: _scaffoldKey,
      body: FlutterOpenStreetMap(
          center: LatLong(19.644430, -99.240947), //19.644430, -99.240947
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
          }),
    );
  }
}



/* */