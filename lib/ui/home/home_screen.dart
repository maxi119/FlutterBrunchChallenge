import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/const.dart';

import 'component/introduction_widget.dart';

class HomeScreen extends StatefulWidget {
  // TODO 2020/08/29 小挑戰3：點擊開啟 Drawer。宣告一個型別為 GlobalKey<ScaffoldState> 的變數，建議名稱：_scaffoldKey
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2020/08/29 小挑戰3：點擊開啟 Drawer。將 Scaffold 的 key 設定為宣告的 _scaffoldKey
      appBar: AppBar(
        title: Text(Wording.homePageName),
      ),
      backgroundColor: Colors.blue.shade900,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                Wording.homePageName,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.lime.shade100,
                ),
              ),
              decoration: BoxDecoration(color: Colors.deepOrange.shade200),
            ),
            ListTile(
              title: Text('小挑戰們',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )),
              leading: Icon(
                Icons.assistant_photo,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                child: AnimatedOpacity(
                  // If the widget is visible, animate to 0.0 (invisible).
                  // If the widget is hidden, animate to 1.0 (fully visible).
                  opacity: _visible ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 500),
                  // The green box must be a child of the AnimatedOpacity widget.
                  child: IntroductionWidget(),
                ),
              ),
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
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  // TODO 2020/08/29 小挑戰3：點擊開啟 Drawer。幫文字加上點擊事件，
                  //  並在點擊後，透過 _scaffoldKey 取得 currentState，
                  //  將狀態變更為 openDrawer，最後呼叫 setState()
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
  } }
