import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/ui/pacman/component/barrier_square.dart';

import 'component/path_square.dart';
import 'pacman_map.dart';

class PacManScreen extends StatefulWidget {
  @override
  _PacManScreenState createState() => _PacManScreenState();
}

class _PacManScreenState extends State<PacManScreen> {
  final int numberInRow = 11;
  final int numberOfSquares = 11 * 17;
  final List<int> barriers = PacManMap().barriers;

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
                    if (barriers.contains(index)) {
                      return BarrierSquare(
                        color: Colors.indigoAccent,
                        innerColor: Colors.blueAccent,
//                        child: Text('$index'),
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

              ///              child:   這邊可以放 分數 或 開始遊戲 按鈕
            ),
          ),
        ],
      ),
    );
  }
}
