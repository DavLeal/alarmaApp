import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_background.dart';
import '../widgets/card_container.dart';

class AdministrarCondominio extends StatefulWidget {
  @override
  State<AdministrarCondominio> createState() => _AdministrarCondominioState();
}

class _AdministrarCondominioState extends State<AdministrarCondominio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Condominio"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        disabledColor: Colors.grey,
                        elevation: 0,
                        color: Colors.blue,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 38, vertical: 15),
                          child: Text("Agregar administradores"),
                        ),
                        onPressed: () {
                          //Navigator.of(context).push(
                          //  MaterialPageRoute(builder: (context) => MenuInicio()));
                          /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuInicio()));*/
                        }),
                    SizedBox(height: 40),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        disabledColor: Colors.grey,
                        elevation: 0,
                        color: Color.fromARGB(255, 149, 175, 197),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: Text("Configurar botones"),
                        ),
                        onPressed: () {
                          //Navigator.push(context,
                          //  MaterialPageRoute(builder: (context) => NewUser()));
                        }),
                    Container(child: Column()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
