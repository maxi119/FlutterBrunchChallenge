import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/ui/pacman/barrier_map.dart';

import 'component/path_square.dart';
import 'component/square.dart';

class PacManScreen extends StatefulWidget {
  @override
  _PacManScreenState createState() => _PacManScreenState();
}

class _PacManScreenState extends State<PacManScreen> {
  static int _numberInRow = 11;
  static int _numberInColumn = 17;
  int _numberOfSquares = _numberInRow * _numberInColumn;
  int player = _numberInRow * (_numberInColumn - 2) + 1;
  List _barriers = PacManMap().barriers;
  List<int> _foods = List();
  Timer _timer;
  String direction;

  _playGame() {
    debugPrint('play game');
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      _move();
    });
  }

  _eatFood() {
    _foods.remove(player);
  }

  _move() {
    debugPrint('move()');
    if (_foods.contains(player)) {
      // 若 食物列表 包含 player 上個 frame 移動後的位置，則代表，可以吃到！！
      _eatFood();
    }
    switch (direction) {
      case "up":
        _moveUp();
        break;
      case "down":
        _moveDown();
        break;
      case "left":
        _moveLeft();
        break;
      case "right":
        _moveRight();
        break;
    }
  }

  _moveUp() {
    if (_barriers.contains(player - _numberInRow)) {
      debugPrint('撞牆，不動');
    } else {
      player -= _numberInRow;
      setState(() {});
    }
  }

  _moveDown() {
    if (_barriers.contains(player + _numberInRow)) {
      debugPrint('撞牆，不動');
    } else {
      player += _numberInRow;
      setState(() {});
    }
  }

  _moveLeft() {
    if (_barriers.contains(player - 1)) {
      debugPrint('撞牆，不動');
    } else {
      player--;
      setState(() {});
    }
  }

  _moveRight() {
    if (_barriers.contains(player + 1)) {
      debugPrint('撞牆，不動');
    } else {
      player++;
      setState(() {});
    }
  }

  Widget _playerRolw() {
    double angle = 0;
    switch (direction) {
      case "up":
        angle = pi / 2 * 3;
        break;
      case "down":
        angle = pi / 2;
        break;
      case "left":
        angle = pi;
        break;
      case "right":
        angle = pi * 2;
        break;
    }
    return Transform.rotate(
      angle: angle,
      child: Image.asset("images/pacman.png"),
    );
  }


  @override
  void initState() {
    super.initState();
    for (int i=0; i<_numberOfSquares; i++) {
      if (_barriers.contains(i)) {
        // 是路障，不會有食物
      } else {
        _foods.add(i);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    debugPrint('dispose()');
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
                  itemCount: _numberOfSquares,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _numberInRow,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == player) {
                      return _playerRolw();
                    }
                    final childForDebug = Text('$index');
                    if (_barriers.contains(index)) {
                      return Square(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.cyan,
                        child: childForDebug,
                      );
                    }
                    if (_foods.contains(index)) {
                      return PathSquare(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.yellow,
                        child: childForDebug,
                      );
                    }
                    return PathSquare(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.black,
                      child: childForDebug,
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Score:',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  GestureDetector(
                    onTap: () {
                      _playGame();
                    },
                    child: Text(
                      'P L A Y',
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
