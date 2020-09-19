import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PacManScreen extends StatefulWidget {
  @override
  _PacManScreenState createState() => _PacManScreenState();
}

class _PacManScreenState extends State<PacManScreen> {
  @override
  void initState() {
    timerSeconds = Timer.periodic(Duration(seconds: 1), _updateSeconds);
    super.initState();
  }

  @override
  void dispose() {
    timerSeconds?.cancel();
    super.dispose();
  }

  void _updateSeconds(Timer timer) {
    if (currentDirection == -1) {
      if (indexToRow(currentIndex) >= 1) {
        if (mapdata[currentIndex - numberInRow] != 1) {
          currentIndex -= numberInRow;
          itemList[currentIndex] = 0;
          setState(() {});
        } else {
          currentDirection = 0;
        }
      } else {
        currentDirection = 0;
      }
    } else if (currentDirection == 1) {
      if (indexToRow(currentIndex) < (numberInCol - 1)) {
        if (mapdata[currentIndex + numberInRow] != 1) {
          currentIndex += numberInRow;
          itemList[currentIndex] = 0;
          setState(() {});
        } else {
          currentDirection = 0;
        }
      } else {
        currentDirection = 0;
      }
    }

    if (currentDirection == -2) {
      if (indexToColumn(currentIndex) >= 1) {
        if (mapdata[currentIndex - 1] != 1) {
          currentIndex -= 1;
          itemList[currentIndex] = 0;
          setState(() {});
        } else {
          currentDirection = 0;
        }
      } else {
        currentDirection = 0;
      }
    } else if (currentDirection == 2) {
      if (indexToColumn(currentIndex) < (numberInRow - 1)) {
        if (mapdata[currentIndex + 1] != 1) {
          currentIndex += 1;
          itemList[currentIndex] = 0;
          setState(() {});
        } else {
          currentDirection = 0;
        }
      } else {
        currentDirection = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ///    小精靈圖檔
    ///    Image.asset("images/pacman.png")
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: (detail) {
          if (detail.delta.dy < 0) {
            currentDirection = -1;
          } else if (detail.delta.dy > 0) {
            currentDirection = 1;
          }
        },
        onHorizontalDragUpdate: (detail) {
          print(detail);
          print('$currentIndex');
          if (detail.delta.dx < 0) {
            currentDirection = -2;
          } else if (detail.delta.dx > 0) {
            currentDirection = 2;
          }
        },
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  color: Colors.red.shade200,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: numberInRow,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: _gridMap(),
                  )),
            ),
            Expanded(
              child: Container(
                color: Colors.red,

                ///              child:   這邊可以放 分數 或 開始遊戲 按鈕
              ),
            ),
          ],
        ),
      ),
    );
  }

  final mapdata = [
    1, 1, 1, 1, 0, 1, 1, 1, //
    1, 1, 1, 1, 0, 1, 1, 1, //
    0, 0, 0, 0, 0, 0, 0, 0, //
    1, 1, 1, 0, 0, 1, 1, 0, //
    1, 1, 1, 0, 0, 1, 1, 0, //
    0, 0, 0, 0, 0, 0, 0, 0, //
    1, 1, 1, 0, 0, 1, 1, 1, //
    1, 1, 1, 0, 0, 1, 1, 1, //
    1, 1, 1, 0, 0, 1, 1, 1, //
  ];
  static const int numberInRow = 8;
  static const int numberInCol = 9;
  List<int> itemList = <int>[
    1, 1, 1, 1, 1, 1, 1, 1, //
    1, 1, 1, 1, 1, 1, 1, 1, //
    1, 1, 1, 1, 1, 1, 1, 1, //
    1, 1, 1, 1, 1, 1, 1, 1, //
    1, 1, 1, 1, 1, 1, 1, 1, //
    2, 2, 2, 2, 2, 2, 2, 2, //
    1, 1, 1, 2, 2, 1, 1, 1, //
    1, 1, 1, 2, 2, 1, 1, 1, //
    1, 1, 1, 2, 2, 1, 1, 1, //
  ];
  Timer timerSeconds;
  int currentDirection = 0; // -1 up 1 down -2 left 2 right, 0 idle
  int currentIndex = 68;
  int indexToRow(int idx) {
    return (idx / numberInRow).floor();
  }

  int indexToColumn(int idx) {
    return idx % numberInRow;
  }

  Widget _pacmanOrItem(int index) {
    if (index == currentIndex) {
      double angle = 0;
      if (currentDirection == -1) {
        angle = -pi / 2;
      } else if (currentDirection == 1) {
        angle = pi / 2;
      } else if (currentDirection == -2) {
        angle = pi;
      } else if (currentDirection == 2) {
        angle = 0;
      }
      return Transform.rotate(
        angle: angle,
        child: Image.asset(
          "images/pacman.png",
        ),
      );
    } else if (itemList[index] == 2) {
      return Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ));
    } else {
      return Container();
    }
  }

  List<Widget> _gridMap() {
    final ret = <Widget>[];
    int index = 0;
    for (final element in mapdata) {
      if (element == 0) {
        ret.add(
          Container(
            padding: EdgeInsets.all(5),
            width: 20,
            height: 20,
            color: Colors.grey,
            child: _pacmanOrItem(index),
          ),
        );
      } else {
        ret.add(
          Container(
            padding: EdgeInsets.all(5),
            width: 20,
            height: 20,
            color: Colors.blue,
            //child: Text('$element'),
          ),
        );
      }
      index += 1;
    }
    return ret;
  }
}
