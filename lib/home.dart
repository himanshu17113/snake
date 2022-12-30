import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake/blank_space.dart';
import 'package:snake/food.dart';
import 'package:snake/head.dart';
import 'package:snake/snake.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum snakedirection { left, right, up, down }

var currentdirection = snakedirection.right;

int totalitem = 100;
int rowsize = 10;
List<int> snakepos = [0, 1, 2];
int currentscore = 0;
List<int> highestscore = [];

int foodpos = 51;

bool hasgamestarted = false;

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {});
  // }

  void startGame() {
    hasgamestarted = true;

    Timer.periodic(const Duration(milliseconds: 300), ((timer) {
      setState(() {
        movesanke();
      });
    }));
  }

  void movesanke() {
    switch (currentdirection) {
      case snakedirection.down:
        if (snakepos.last + rowsize > totalitem) {
          snakepos.add(snakepos.last - totalitem + rowsize);
        } else {
          snakepos.add(snakepos.last + rowsize);
        }
        break;
      case snakedirection.up:
        if (snakepos.last < rowsize) {
          snakepos.add(snakepos.last + totalitem - rowsize);
        } else {
          snakepos.add(snakepos.last - rowsize);
        }
        break;

      case snakedirection.left:
        if (snakepos.last % rowsize == 0) {
          snakepos.add(snakepos.last - 1 + rowsize);
        } else {
          snakepos.add(snakepos.last - 1);
        }
        break;

      case snakedirection.right:
        if (snakepos.last % rowsize == 9) {
          snakepos.add(snakepos.last + 1 - rowsize);
        } else {
          snakepos.add(snakepos.last + 1);
        }
        break;
    }
    eatfod();
  }

  void eatfod() {
    if (snakepos.contains(foodpos)) {
      currentscore++;
      foodpos = Random().nextInt(totalitem);
      // snakepos.removeAt(0);
    } else {
      snakepos.removeAt(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    //foodpos = Random().nextInt(totalitem);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Text('current status   '),
                  Text(
                    currentscore.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                  const Text('highest score   '),
                  Text(
                    highestscore.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                ])),
            Expanded(
                flex: 5,
                child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy > 0 &&
                              currentdirection != snakedirection.up
                          //  && currentdirection != snakedirection.up
                          ) {
                        currentdirection = snakedirection.down;
                      }
                      if (details.delta.dy < 0 &&
                              currentdirection != snakedirection.down
                          //  &&  currentdirection != snakedirection.up

                          ) {
                        currentdirection = snakedirection.up;
                      }
                    },
                    onHorizontalDragUpdate: (details) {
                      if (details.delta.dx > 0 &&
                              currentdirection != snakedirection.right
                          //&&  currentdirection != snakedirection.left
                          ) {
                        currentdirection = snakedirection.right;
                      }
                      if (details.delta.dx < 0 &&
                              currentdirection != snakedirection.right
                          //   && currentdirection != snakedirection.left
                          ) {
                        currentdirection = snakedirection.left;
                      }
                    },
                    child: GridView.builder(
                        itemCount: totalitem,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: rowsize),
                        itemBuilder: ((context, index) {
                          // switch (index) {
                          //   case snakepos:
                          //    return snake();
                          //    // break;
                          //   case foodpos:
                          //    return food();
                          //    // break;
                          //   default:
                          //    return blankspace();
                          // }

                          if (snakepos.contains(index) &&
                              snakepos.last != index) {
                            return const snake();
                          } else if (foodpos == index) {
                            return const food();
                          } else if (snakepos.last == index) {
                            return const head();
                          } else {
                            return const blankspace();
                          }
                        })))),
            Expanded(
                child: Container(
              child: Center(
                child: MaterialButton(
                    // onPressed: (() => startGame()),
                    onPressed: (hasgamestarted
                        ? () {}
                        : () {
                            startGame();
                          }),
                    color: hasgamestarted ? Colors.blue : Colors.grey,
                    child: const Text('Start Game')),
              ),
            ))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
