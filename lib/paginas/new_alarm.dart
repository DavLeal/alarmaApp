import 'dart:convert' as convert;
import 'dart:convert';

import 'package:alarma_app/paginas/menu_inicio.dart';
import 'package:alarma_app/widgets/auth_background.dart';
import 'package:alarma_app/widgets/card_container_menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:alarma_app/paginas/login_screen.dart';

import '../providers/alarm_form_provider.dart';
import '../widgets/new_background.dart';

class NewAlarm extends StatefulWidget {
  static String id = 'new_uAlarm';
  @override
  _NewAlarmState createState() => _NewAlarmState();
}

class _NewAlarmState extends State<NewAlarm> {
  final url = Uri.parse("https://lcix7d.deta.dev/api/v1/alarms/?limit=100");
  final url1 = Uri.parse("https://lcix7d.deta.dev/docs#/users/");
  late Future<List<Alarm>> _listaCar;
  final code = TextEditingController();
  final phone = TextEditingController();
  final mode = TextEditingController();

  Future<List<Alarm>> _getUsuario() async {
    final res = await http.get(url);
    if (res.statusCode == 200) {
      //print(res.body);
      String body = utf8.decode(res.bodyBytes);
      final jsonData = convert.jsonDecode(body);
    } else {
      throw Exception("Fallo la conexion");
    }
    return _getUsuario();
  }

  void initState() {
    super.initState();
    saveAlarm();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NewBackground(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /* Flexible(
                child: Image.asset(
                  "images/profile.png",
                  height: 200.0,
                  width: 280.0,
                ),
              ), */
                SizedBox(height: 200),
                CardContainerMenu(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      _codeTextField(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _phoneTextField(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _modeTextField(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buttonAdd(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buttonBack(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _codeTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: code,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.code),
            hintText: '000101010101652145647',
            labelText: 'Ingrese el código de su alarma',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _phoneTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: phone,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.phone),
            hintText: '5516479512',
            labelText: 'Ingrese el numero telefónico de su tarjeta SIM',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _modeTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: mode,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(Icons.perm_identity_sharp),
            hintText: 'Car/house',
            labelText: 'Ingrese el modo de su alarma',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _buttonAdd() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
            child: Text(
              'Agregar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Color.fromARGB(255, 29, 113, 182),
          onPressed: () {
            saveAlarm();
          });
    });
  }

  Widget _buttonBack() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
            child: Text(
              'Regresar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Color.fromARGB(255, 29, 113, 182),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => MenuInicio()),
            );
          });
    });
  }

  @override
  // void initState() {
  //   super.initState();
  //   usuarios = getUsuarios();
  // }

  Future<List<Alarm>> _getAlarm() async {
    final res = await http.get(url);
    //final encodeFirst = json.encode(); //texto
    //final lista = json.decode(res.body);
    String json = res.body;
    List list = convert.json.decode(json);
    final user = <Alarm>[];
    List<Alarm> alarm = [];
    list.forEach((element) {
      final Alarm alarms = Alarm.fromJson(element);
      alarm.add(alarms);
    });
    return alarm;
  }

  /*Future<dynamic> _getUsuarios() async {
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      print("Error en la respuesta");
    }
  } */

  void saveAlarm() async {
    final user = {
      "code": code.text,
      "phone": phone.text,
      //"role": role.text,
      "mode": mode.text,
    };
    var response = await http.post(url,
        body: convert.jsonEncode(user),
        headers: {"Content-Type": "application/json;charset=UTF-8"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(await http.read(Uri.https('example.com', 'foobar.txt')));
    code.clear();
    phone.clear();
    mode.clear();
    setState(() {
      _listaCar = _getAlarm();
    });
  }
}
