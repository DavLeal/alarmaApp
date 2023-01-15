import 'package:alarma_app/widgets/auth_background.dart';
import 'package:alarma_app/widgets/card_container_menu.dart';
import 'package:flutter/material.dart';
import 'package:alarma_app/paginas/login_screen.dart';

import '../widgets/new_background.dart';

class NewUser extends StatefulWidget {
  static String id = 'new_user';
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
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
          keyboardType: TextInputType.number,
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
              'Registrarse',
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
          onPressed: () {});
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
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          });
    });
  }
}
