import 'package:flutter/material.dart';

class MenuBackground extends StatelessWidget {
  final Widget child;

  const MenuBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color.fromARGB(255, 249, 249, 250),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          //_BlueBox(),
        ],
      ),
    );
  }
}
