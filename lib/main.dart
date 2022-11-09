import 'package:alarma_app/paginas/login_screen.dart';
import 'package:alarma_app/paginas/menu_inicio.dart';
import 'package:flutter/material.dart';
import 'package:alarma_app/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "splash": (_) => const SplashScreen(),
        "inicio": (_) => const MenuInicio(),
        "login": (_) => LoginScreen(),
        //NewUser.id: (context) => NewUser(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
    );
  }
}
