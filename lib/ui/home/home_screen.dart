import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/const.dart';

import 'component/home_drawer_widget.dart';
import 'component/introduction_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _visible = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(Wording.homePageName),
      ),
      backgroundColor: Colors.blue.shade900,
      drawer: HomeDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAnimatedIntroductionArea(),
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
                child: RaisedButton(
                  color: Colors.deepOrange.shade400,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    setState(() {
                      _scaffoldKey.currentState.openDrawer();
                    });
                  },
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIntroductionArea() {
    return GestureDetector(
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
    );
  }
}
