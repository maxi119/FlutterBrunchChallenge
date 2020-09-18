import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarrierSquare extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color innerColor;

  const BarrierSquare({
    Key key,
    this.child,
    this.color,
    this.innerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: color,
          padding: EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: innerColor,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
