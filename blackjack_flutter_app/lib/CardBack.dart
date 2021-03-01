import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 150,
          width: 100,
          color: Colors.white,
          child: Image.asset('lib/images/cardback.png'),
        ),
      ),
    );
  }
}
