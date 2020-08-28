import 'package:flutter/material.dart';

class ChallengeItemWidget extends StatelessWidget {
  const ChallengeItemWidget({
    Key key,
    @required this.backgroundColor,
    @required this.onPressed,
    @required this.displayText,
    @required this.textColor,
  }) : super(key: key);

  final Color backgroundColor;
  final Null Function() onPressed;
  final String displayText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
      child: RaisedButton(
        color: backgroundColor,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            displayText,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
