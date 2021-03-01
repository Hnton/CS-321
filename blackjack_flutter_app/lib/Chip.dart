import 'package:flutter/material.dart';

class Chips extends StatelessWidget {
  final int amount;

  Chips({this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'lib/images/chip.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
