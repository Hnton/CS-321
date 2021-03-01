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

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

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
                  getFlippingCard("10", club(), Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFlippingCard(var number, var suit, var color) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(pi * _animation.value),
      child: GestureDetector(
        onTap: () {
          if (_animationStatus == AnimationStatus.dismissed) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        child: _animation.value >= 0.5
            ? CardBack()
            : CardFront(
                color: color,
                number: number,
                suit: suit,
              ),
      ),
    );
  }
}
