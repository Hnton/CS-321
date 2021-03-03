import 'dart:math';

import 'package:blackjack_flutter_app/CardBack.dart';
import 'package:blackjack_flutter_app/CardFront.dart';
import 'package:flutter/material.dart';

import 'Chip.dart';
import 'Suits.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("BlackJack Game"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[700],
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardFront(
                    color: Colors.black,
                    number: '10',
                    suit: club(),
                  ),
                  CardFront(
                    color: Colors.black,
                    number: '10',
                    suit: club(),
                  )
                ],
              ),
              Transform.rotate(angle: pi / 2, child: CardBack()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(amount.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        amount += 10;
                      });
                    },
                    child: Chips(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardFront(
                    color: Colors.black,
                    number: '10',
                    suit: club(),
                  ),
                  CardFront(
                    color: Colors.black,
                    number: '10',
                    suit: club(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
