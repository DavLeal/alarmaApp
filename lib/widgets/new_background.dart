import 'package:flutter/material.dart';

class NewBackground extends StatelessWidget {
  final Widget child;

  const NewBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color.fromARGB(255, 249, 249, 250),
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
      //color: const Color.fromARGB(255, 4, 79, 141),
      decoration: _bluebackground(),
      child: Stack(
        children: [
          Positioned(
            child: _Buble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: Text("Registrese"),
            top: 40,
            left: 125,
          ),
        ],
      ),
    );
  }

  BoxDecoration _bluebackground() => const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(28, 59, 112, 224),
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
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
