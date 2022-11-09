import 'package:flutter/material.dart';

import 'login_screen.dart';

class ConfigurarPage extends StatefulWidget {
  static String id = 'menu_configurar';
  @override
  State<ConfigurarPage> createState() => _ConfigurarPageState();
}

class _ConfigurarPageState extends State<ConfigurarPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Hogar")),
        ),
        drawer: Drawer(
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
                      height: 10.0,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 4, 70, 124),
                ),
              ),
              ListTile(
                iconColor: Colors.white,
                leading: Icon(Icons.home),
                textColor: Colors.white,
                title: Text('Configurar Casa'),
                onTap: () {},
              ),
              ListTile(
                iconColor: Colors.white,
                leading: Icon(Icons.build),
                textColor: Colors.white,
                title: Text('Configurar Residencial'),
                onTap: () {},
              ),
              ListTile(
                iconColor: Colors.white,
                leading: Icon(Icons.car_rental),
                textColor: Colors.white,
                title: Text('Configurar Carro'),
                onTap: () {},
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
        ),
      ),
    );
  }
}
