import 'package:flutter/material.dart';

class CardContainerMenu extends StatelessWidget {
  final Widget child;
  const CardContainerMenu({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        height: 600,
        decoration: _createCardShapeMenu(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShapeMenu() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ]);
}
