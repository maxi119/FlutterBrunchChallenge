import 'package:flutter/material.dart';

class PacManScreen extends StatefulWidget {
  @override
  _PacManScreenState createState() => _PacManScreenState();
}

class _PacManScreenState extends State<PacManScreen> {
  @override
  Widget build(BuildContext context) {
///    小精靈圖檔
///    Image.asset("images/pacman.png")
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.red.shade200,
///              child:   TODO 加上地圖
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
///              child:   這邊可以放 分數 或 開始遊戲 按鈕
            ),
          ),
        ],
      ),
    );
  }
}
