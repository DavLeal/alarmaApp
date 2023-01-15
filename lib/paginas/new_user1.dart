import 'dart:convert' as convert;
import 'dart:convert';

import 'package:alarma_app/paginas/menu_inicio.dart';
import 'package:alarma_app/widgets/auth_background.dart';
import 'package:alarma_app/widgets/card_container_menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:alarma_app/paginas/login_screen.dart';

import '../providers/login_form_provider.dart';
import '../widgets/new_background.dart';

class NewUser1 extends StatefulWidget {
  static String id = 'new_user1';
  @override
  _NewUser1State createState() => _NewUser1State();
}

class _NewUser1State extends State<NewUser1> {
  final url = Uri.parse("https://lcix7d.deta.dev/api/v1/users/?limit=100");
  final url1 = Uri.parse("https://lcix7d.deta.dev/docs#/users/");
  late Future<List<Usuario>> _listaUsuarios;
  final nombre = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final last_name = TextEditingController();
  final role = TextEditingController();

  Future<List<Usuario>> _getUsuario() async {
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
    saveUsuarios();
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
                      _userEmailTextField(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _userNameTextField(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _userLastNameTextField(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _passwordTextField(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _roleTextField(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buttonSignIn(),
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

  Widget _userNameTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: nombre,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Juan',
            labelText: 'Ingrese su(s) nombre(s)',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _userEmailTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo Electrónico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _userLastNameTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: last_name,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(Icons.perm_identity_sharp),
            hintText: 'Pérez',
            labelText: 'Ingrese sus apellidos',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: password,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _roleTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: role,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.privacy_tip),
            hintText: '(Administrador, Usuario)',
            labelText: 'Rol de usuario',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _buttonSignIn() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
            child: Text(
              'Registrar',
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
            saveUsuarios();
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

  Future<List<Usuario>> getUsuarios() async {
    final res = await http.get(url);
    //final encodeFirst = json.encode(); //texto
    //final lista = json.decode(res.body);
    String json = res.body;
    List list = convert.json.decode(json);
    final user = <Usuario>[];
    List<Usuario> usuarios = [];
    list.forEach((element) {
      final Usuario user = Usuario.fromJson(element);
      usuarios.add(user);
    });
    return usuarios;
  }

  /*Future<dynamic> _getUsuarios() async {
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      print("Error en la respuesta");
    }
  } */

  void saveUsuarios() async {
    final user = {
      "name": nombre.text,
      "last_name": last_name.text,
      //"role": role.text,
      "email": email.text,
      "password": password.text
    };
    var response = await http.post(url,
        body: convert.jsonEncode(user),
        headers: {"Content-Type": "application/json;charset=UTF-8"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(await http.read(Uri.https('example.com', 'foobar.txt')));
    nombre.clear();
    last_name.clear();
    role.clear();
    email.clear();
    password.clear();
    setState(() {
      _listaUsuarios = _getUsuario();
    });
  }
}
