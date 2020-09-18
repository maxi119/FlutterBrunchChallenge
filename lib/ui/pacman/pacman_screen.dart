import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/ui/pacman/component/barrier_square.dart';

import 'component/path_square.dart';
import 'pacman_map.dart';

class PacManScreen extends StatefulWidget {
  @override
  _PacManScreenState createState() => _PacManScreenState();
}

class _PacManScreenState extends State<PacManScreen> {
  static int numberInRow = 11;
  static int numberInColumn = 17;
  final int numberOfSquares = 11 * numberInColumn;
  final List<int> barriers = PacManMap().barriers;
  int playerIndex = numberInRow * (numberInColumn - 2) + 1; // 初始位置在左下角
  Timer timer;
  String direction = "";

  _startGame() {
    debugPrint("startGame!");
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _move();
    });
  }

  _move() {
    debugPrint("move! direction=$direction");

    int nextIndex = playerIndex;
    switch (direction) {
      case "left" :
        nextIndex = playerIndex - 1;
        break;
      case "right":
        nextIndex = playerIndex + 1;
        break;
      case "up":
        nextIndex = playerIndex - numberInRow;
        break;
      case "down":
        nextIndex = playerIndex + numberInRow;
        break;
    }

    if (barriers.contains(nextIndex)) {
      // 撞牆，不動
    } else {
      setState(() {
        playerIndex = nextIndex;
//        debugPrint("move to $playerIndex");
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    timer = null;
  }

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
            child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                if (details.delta.dy < 0) {
                  direction = "up";
                } else {
                  direction = "down";
                }
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                if (details.delta.dx < 0) {
                  direction = "left";
                } else {
                  direction = "right";
                }
              },
              child: Container(
                  color: Colors.black,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: numberInRow,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == playerIndex) {
                        return Image.asset("images/pacman.png");
                      }
                      if (barriers.contains(index)) {
                        return BarrierSquare(
                          color: Colors.indigoAccent,
                          innerColor: Colors.blueAccent,
                          child: Text('$index'),
                        );
                      }
                      return PathSquare(
                        color: Colors.black,
                        innerColor: Colors.yellow,
//                      child: Text('$index'),
                      );
                    },
                  )),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Score: ',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  GestureDetector(
                    onTap: () {
                      _startGame();
                    },
                    child: Text(
                      'P L A Y',
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
