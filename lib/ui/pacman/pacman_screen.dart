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

  _startGame() {
    debugPrint("startGame!");
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
                color: Colors.black,
                child: GridView.builder(
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
