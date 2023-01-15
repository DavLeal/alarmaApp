import 'package:alarma_app/paginas/menu_inicio.dart';
import 'package:alarma_app/paginas/new_alarm.dart';
import 'package:alarma_app/paginas/new_condo.dart';
import 'package:flutter/material.dart';

import 'admin_menu_casa.dart';
import 'login_screen.dart';
import 'menu_casa.dart';
import 'new_user1.dart';

class ConfigurarPage extends StatefulWidget {
  static String id = 'menu_configurar';
  @override
  State<ConfigurarPage> createState() => _ConfigurarPageState();
}

class _ConfigurarPageState extends State<ConfigurarPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 4, 67, 119),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                //Expanded(
                //child: Image.asset("assets/home.png"),
                //),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://alarmas.plus/wp-content/uploads/2021/04/como-instalar-una-alarma-en-casa.png"),
                fit: BoxFit.contain,
              ),
              color: Color.fromARGB(255, 4, 70, 124),
            ),
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.person_add),
            textColor: Colors.white,
            title: Text('Agregar Usuario/Administrador'),
            onTap: () {
              /* Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => NewUser1()));*/
            },
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.contact_phone),
            textColor: Colors.white,
            title: Text('Agregar Contacto de Confianza'),
            onTap: () {},
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.add_alert),
            textColor: Colors.white,
            title: Text('Agregar Alarma'),
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewAlarm()),
              ); */
            },
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.logout),
            textColor: Colors.white,
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PaginaCasa extends StatelessWidget {
  //const PaginaConfigurar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdministrarCasa();
  }
}

/*SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Configuración")),
        ),
        drawer: */