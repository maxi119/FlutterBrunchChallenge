import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/const.dart';
import 'package:flutter_brunch_challenge/ui/home/component/challenge_item_widget.dart';
import 'package:flutter_brunch_challenge/ui/home/component/sectoin_header_widget.dart';
import 'package:flutter_brunch_challenge/ui/pacman/pacman_screen.dart';

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
      backgroundColor: Colors.lime.shade200,
      drawer: HomeDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAnimatedIntroductionArea(),
              SectionHeaderWidget(
                text: 'Challenges',
                textColor: Colors.teal.shade400,
              ),
              _challengeItem20200919(),
              _challengeItem20200829(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _challengeItem20200919() {
    return ChallengeItemWidget(
      backgroundColor: Colors.teal.shade200,
      onPressed: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext buildContext) {
                return PacManScreen();
              },
            ),
          );
        });
      },
      displayText: 'Flutter Brunch 2020/09 '
          '\n>>>> PACMAN CHALLENGE <<<<',
      textColor: Colors.white,
    );
  }

  Widget _challengeItem20200829() {
    return ChallengeItemWidget(
      backgroundColor: Colors.teal.shade200,
      onPressed: () {
        setState(() {
          _scaffoldKey.currentState.openDrawer();
        });
      },
      displayText: 'Flutter Brunch 2020/08 '
          '\n 1. Widget 練習：Drawer'
          '\n 2. 動畫練習：幫 App 介紹區塊加上動畫效果'
          '\n 3. 點擊開啟 Drawer',
      textColor: Colors.white,
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
