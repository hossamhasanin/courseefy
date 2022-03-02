import 'package:flutter/material.dart';

class CardSoftShadow extends StatelessWidget {
  final Widget child;
  const CardSoftShadow({Key? key , required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 5.0)
          ],
          borderRadius: BorderRadius.circular(4.0)),
      child: child,
    );
  }
}
