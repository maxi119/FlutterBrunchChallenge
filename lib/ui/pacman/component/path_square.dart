import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathSquare extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color innerColor;

  const PathSquare({
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
          padding: EdgeInsets.all(12),
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
