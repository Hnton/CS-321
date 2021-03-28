import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_screen.dart';

class PlayerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardData _cardData = Provider.of(context);
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Blackjack Game"),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            Text("Player Wins: " + _cardData.playerWin.toString()),
            Text("Dealer Wins: " + _cardData.dealerWin.toString()),
            Text("Ties: " + _cardData.tie.toString()),
          ],
        ),
      ),
    );
  }
}
