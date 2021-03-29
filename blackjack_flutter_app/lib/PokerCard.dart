import 'package:flutter/material.dart';

import 'Suit.dart';

// ignore: must_be_immutable
class PokerCard extends StatelessWidget {
  final Suit suit;
  final int value;
  var hidden;

  PokerCard(this.suit, this.value, this.hidden);

  void setHidden() {
    hidden = true;
  }

  void setShow() {
    hidden = false;
  }

  @override
  Widget build(BuildContext context) {
    String _path;

    void _setPath() {
      if (hidden == true) {
        _path = 'images/1B.png';
      } else {
        _path = 'images/';
        if (value >= 10 || value == 1) {
          if (value == 10) {
            _path += 'T';
          }
          if (value == 11) {
            _path += 'J';
          }
          if (value == 12) {
            _path += 'Q';
          }
          if (value == 13) {
            _path += 'K';
          }
          if (value == 1) {
            _path += 'A';
          }
        } else {
          _path += value.toString();
        }
        _path += suitToString(suit)[0] + '.png';
      }
    }

    _setPath();

    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.white,
          height: 100,
          width: 75,
          child: Image.asset(
            _path,
          ),
        ));
  }
}
