import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/const.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Wording.homePageName),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('這是一個，用於展示每次 Flutter Brunch 現場小挑戰內容的 App。'),
              Text('活動與練習項目'),
              //  https://flutter.dev/docs/cookbook/design/drawer
              Text('Flutter Brunch 2020/08 '
                  '\n 1. Widget 練習：Drawer'
                  '\n 2. 動畫練習：幫 App 介紹區塊加上動畫效果'
                  '\n 3. 點擊開啟 Drawer'),
            ],
          ),
        ),
      ),
    );
  }
}