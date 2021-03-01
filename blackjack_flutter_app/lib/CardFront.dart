import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  final suit;
  final color;
  final number;

  CardFront({this.suit, this.color, this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.all(5),
          height: 150,
          width: 100,
          color: Colors.white,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(number,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: color)),
                ],
              ),
              suit,
              Transform.rotate(
                angle: pi,
                child: Row(
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
