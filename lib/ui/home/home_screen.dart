import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/const.dart';

import 'component/introduction_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Wording.homePageName),
      ),
      backgroundColor: Colors.blue.shade900,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IntroductionWidget(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Challenges',
                    style: TextStyle(color: Colors.cyanAccent, fontSize: 18),
                  ),
                ),
              ),
              //  https://flutter.dev/docs/cookbook/design/drawer
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Flutter Brunch 2020/08 '
                    '\n 1. Widget 練習：Drawer'
                    '\n 2. 動畫練習：幫 App 介紹區塊加上動畫效果'
                    '\n 3. 點擊開啟 Drawer',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
