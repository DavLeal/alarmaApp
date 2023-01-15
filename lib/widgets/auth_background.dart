import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 214, 225, 243),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BlueBox(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 80),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _BlueBox extends StatelessWidget {
  const _BlueBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      color: Color.fromARGB(255, 19, 92, 151),
      //decoration: _bluebackground(),
      child: Stack(
        children: [
          Positioned(
            child: _Buble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: Text(
              "TRACKYLARM",
              textAlign: TextAlign.center,
            ),
            top: 60,
            left: 150,
          ),
        ],
      ),
    );
  }

  BoxDecoration _bluebackground() => const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(28, 33, 62, 124),
          Color.fromARGB(24, 4, 38, 131),
        ]),
      );
}

class _Buble extends StatelessWidget {
  const _Buble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromARGB(10, 189, 192, 235),
      ),
    );
  }
}
