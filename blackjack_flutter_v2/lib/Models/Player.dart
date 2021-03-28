import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../StateStuff/AppData.dart';

class Player extends StatelessWidget {
  final bool dealer;

  Player({this.dealer: false});

  @override
  Widget build(BuildContext context) {
    final appData = context.watch<AppData>();

    if (dealer) {
      return Stack(
        clipBehavior: Clip.none,
        children: appData.displayDealHand,
      );
    } else {
      return Stack(
        clipBehavior: Clip.none,
        children: appData.displayPlayerHand,
      );
    }
  }
}
