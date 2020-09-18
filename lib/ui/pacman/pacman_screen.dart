import 'package:flutter/material.dart';

class PacManScreen extends StatefulWidget {
  @override
  _PacManScreenState createState() => _PacManScreenState();
}

class _PacManScreenState extends State<PacManScreen> {
  final int numberInRow = 11;
  final int numberOfSquares = 11 * 17;
  final List<int> barriers = [
     0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,
     11,                                               21,
     22,       24,       26,       28,       30,       32,
     33,       35,       37,  38,  39,       41,       43,
     44,       46,                           52,       54,
     55,       57,       59,       61,       63,       65,
     66,                 70,       72,                 76,
     77,  78,  79,  80,  81,       83,  84,  85,  86,  87,

     99, 100, 101, 102, 103,      105, 106, 107, 108, 109,
     110,                114,      116,                120,
     121,      123,      125,      127,      129,      131,
     132,      134,                          140,      142,
     143,      145,      147, 148, 149,      151,      153,
     154,      156,      158,      160,      162,      164,
     165,                                              175,
     176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186,
   ];

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
                      return Container(
                        color: Colors.orange,
                        margin: EdgeInsets.all(1),
                        child: Text('$index'),
                      );
                    }
                    return Container(
                      color: Colors.grey,
                      margin: EdgeInsets.all(1),
                      child: Text('$index'),
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
