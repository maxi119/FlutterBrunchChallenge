import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  Square({
    this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        color: backgroundColor,
        child: child,
      ),
    );
  }
}
