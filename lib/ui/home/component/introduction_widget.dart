import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/ui/home/component/sectoin_header_widget.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          SectionHeaderWidget(
            text: 'App Introduction',
            textColor: Colors.deepPurple,
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade300,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                '這是一個，用於展示 每次 Flutter Brunch 現場 小挑戰內容的 App。',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
