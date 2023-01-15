import 'dart:convert' as convert;

import 'package:alarma_app/paginas/admin_menu_casa.dart';
import 'package:alarma_app/paginas/admin_menu_res.dart';
import 'package:alarma_app/paginas/menu_configurar.dart';
import 'package:alarma_app/paginas/menu_mapa.dart';
import 'package:alarma_app/providers/login_form_provider.dart';
import 'package:alarma_app/ui/input_decorations.dart';
import 'package:alarma_app/widgets/card_container_menu.dart';
import 'package:alarma_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../providers/inicio_form_provider.dart';
import 'menu_casa.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';

class MenuInicio extends StatefulWidget {
  const MenuInicio({Key? key}) : super(key: key);

  @override
  State<MenuInicio> createState() => _MenuInicioState();
}

class _MenuInicioState extends State<MenuInicio> {
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
      String body = convert.utf8.decode(res.bodyBytes);
      final jsonData = convert.jsonDecode(body);
    } else {
      throw Exception("Fallo la conexion");
    }
    return _getUsuario();
  }

  void initState() {
    super.initState();
    //saveEstado();
  }

  int _paginaActual = 0;
  List<Widget> _paginas = [
    PaginaHome(),
    PaginaConfigurar(),
  ];
  @override
  Widget build(BuildContext context) {
    String message = "This is a test message!";
    List<String> recipents = ["1234567890", "5525332351"];

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Bienvenido")),
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          //BottomNavigationBarItem(
          //icon: Icon(Icons.shield_outlined), label: "Alarma"),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configurar",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        backgroundColor: Color.fromARGB(255, 2, 8, 99),
        //closeManually: true,
        overlayColor: Colors.amber,
        overlayOpacity: 0.2,
        child: Icon(Icons.warning),
        children: [
          SpeedDialChild(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 2, 8, 99),
            child: Icon(Icons.web),
            //),
            //onTap: () => _sendSMS(message, recipents)
          ),
          SpeedDialChild(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 2, 8, 99),
            child: Icon(Icons.phone),
            onTap: _callNumber,
          ),
        ],
      ),
    );
  }
}

_callNumber() async {
  const number = '5522209174'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

/* Future<void> _sendSMS(String message, List<String> recipents) async {
  String _result =
      await sendSMS(message: message, recipients: recipents, sendDirect: true);
  Future.error((onError) {
    print(onError);
  });
  print(_result);
} */

class PaginaHome extends StatelessWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CardContainerMenu(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Seleccione una opción",
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 60),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      color: Color.fromARGB(52, 224, 169, 117),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/car.png"),
                              height: 35,
                              width: 55,
                              alignment: Alignment.centerLeft,
                            ),
                            SizedBox(width: 99),
                            Text(
                              "VEHICULO",
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MapPage()));
                        /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuInicio()));*/
                      }),
                  SizedBox(height: 60),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      color: Color.fromARGB(255, 209, 222, 235),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                        child: Row(
                          children: [
                            Text(
                              "HOGAR",
                              textAlign: TextAlign.end,
                            ),
                            SizedBox(width: 99),
                            Image(
                              image: AssetImage("assets/house.png"),
                              height: 45,
                              width: 60,
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdministrarCasa()));
                      }),
                  SizedBox(height: 60),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Color.fromARGB(255, 149, 175, 197),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage("assets/residencial.png"),
                            height: 35,
                            width: 55,
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(width: 78),
                          Text(
                            "RESIDENCIAL",
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdministrarCondominio()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* void saveEstado() async {
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
} */

class PaginaConfigurar extends StatelessWidget {
  //const PaginaConfigurar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfigurarPage();
  }
}
