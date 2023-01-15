import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiJsonPage extends StatefulWidget {
  @override
  State<ApiJsonPage> createState() => _ApiJsonPageState();
}

class _ApiJsonPageState extends State<ApiJsonPage> {
  static const String URLFROMAPI = 'https://my.viagogo.com.mx/sales';
  late http.Client cliente;
  bool loading = true;
  bool error = false;

  @override
  void initState() {
    cliente = http.Client();
    fetchDataFromJSON();
    super.initState();
  }

  Future<void> fetchDataFromJSON() async {
    final respuesta = await cliente.get(Uri.parse(URLFROMAPI));
    if (respuesta.statusCode == 200) {
      //Ok
      List jsonData = json.decode(utf8.decode(respuesta.bodyBytes));

      setState(() {
        loading = false;
      });
    } else {
      Exception('Ha sucedido un error al consultar la API');
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  @override
  void dispose() {
    cliente?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget customloading() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

data() {}
