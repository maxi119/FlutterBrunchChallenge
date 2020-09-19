import 'dart:async';

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
  Timer _timer;

  _playGame() {
    debugPrint('play game');
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      _move();
    });
  }

  _move() {
    debugPrint('move()');
    if (_barriers.contains(player + 1)) {
      debugPrint('撞牆，不動');
    } else {
      player ++;
      setState(() {});
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
            child: Container(
              child: GridView.builder(
                itemCount: _numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _numberInRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == player) {
                    return Image.asset("images/pacman.png");
                  }
                  if (_barriers.contains(index)) {
                    return Square(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.cyan,
                      child: Text('$index'),
                    );
                  }
                  return PathSquare(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.yellow,
                    child: Text('$index'),
                  );
                },
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
