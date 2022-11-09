import 'package:alarma_app/paginas/new_user.dart';
import 'package:alarma_app/providers/login_form_provider.dart';
import 'package:alarma_app/ui/input_decorations.dart';
import 'package:alarma_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:alarma_app/paginas/menu_inicio.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: const Center(child: Text("Login")),
      //),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 400,
              ),
              CardContainer(
                  child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Iniciar Sesión",
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 20),
                  //Paso final
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  ),
                  //_LoginForm(),
                ],
              )),
              /*SizedBox(height: 50),
              Text(
                "CREAR UNA NUEVA CUENTA",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),*/
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        //TODO:Mantener la referencia al key
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

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
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? "")
                    ? null
                    : "El valor ingresado no corresponde a un correo";
              },
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
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;

                return "La contraseña debe tener 6 caracteres";
              },
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MenuInicio()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewUser()));
                }),
          ],
        ),
      ),
    );
  }
}
