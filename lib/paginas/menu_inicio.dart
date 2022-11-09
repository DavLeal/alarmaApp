import 'package:alarma_app/paginas/menu_configurar.dart';
import 'package:alarma_app/providers/login_form_provider.dart';
import 'package:alarma_app/ui/input_decorations.dart';
import 'package:alarma_app/widgets/card_container_menu.dart';
import 'package:alarma_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../providers/inicio_form_provider.dart';

class MenuInicio extends StatefulWidget {
  const MenuInicio({Key? key}) : super(key: key);

  @override
  State<MenuInicio> createState() => _MenuInicioState();
}

class _MenuInicioState extends State<MenuInicio> {
  int _paginaActual = 0;
  List<Widget> _paginas = [
    PaginaHome(),
    PaginaConfigurar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Icon(Icons.message)),
          SpeedDialChild(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 2, 8, 99),
            child: Icon(Icons.phone),
          ),
        ],
      ),
    );
  }
}

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
                      color: Colors.blue,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                        child: Text("VEHICULO"),
                      ),
                      onPressed: () {
                        //Navigator.of(context).push(
                        //  MaterialPageRoute(builder: (context) => MenuInicio()));
                        /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuInicio()));*/
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
                            EdgeInsets.symmetric(horizontal: 90, vertical: 40),
                        child: Text("HOGAR"),
                      ),
                      onPressed: () {
                        /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuInicio()));*/
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
                          EdgeInsets.symmetric(horizontal: 75, vertical: 40),
                      child: Text("RESIDENCIAL"),
                    ),
                    onPressed: () {
                      /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuInicio()));*/
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

class PaginaConfigurar extends StatelessWidget {
  //const PaginaConfigurar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfigurarPage();
  }
}

/*
class _MenuForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //TODO:Mantener la referencia al key
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: "correo@gmail.com",
                labelText: "Correo Electrónico",
                prefixIcon: Icons.alternate_email_rounded,
              ),
            ),
            SizedBox(height: 28),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: "**********",
                labelText: "Contraseña",
                prefixIcon: Icons.lock_outline,
              ),
            ),
            SizedBox(height: 40),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text("Ingresar"),
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
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Text("Crear nueva cuenta"),
                ),
                onPressed: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuInicio()));*/
                }),
          ],
        ),
      ),
    );
  }
}

*/

/*
body: MenuBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 450,
              ),
              CardContainerMenu(
                  child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Iniciar Sesión",
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 20),
                  //Paso final
                  ChangeNotifierProvider(
                    create: (_) => InicioFormProvider(),
                    child: _MenuForm(),
                  ),
                  _MenuForm(),
                ],
              )),
              SizedBox(height: 50),
              Text(
                "Hola",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
),*/

