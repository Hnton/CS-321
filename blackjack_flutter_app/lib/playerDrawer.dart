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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Blackjack Game"),
                  Text("Player Wins: " + _cardData.playerWin.toString()),
                  Text("Dealer Wins: " + _cardData.dealerWin.toString()),
                  Text("Ties: " + _cardData.tie.toString()),
                  Text("Games Played: " + _cardData.anotherGame.toString()),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "How To Play!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("   Swipe on Cards to stay"),
                Text("   Swipe on Chip to decrease bet"),
                Text("   Tap on Card to hit"),
                Text("   Tap on Chip to increase bet"),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text("MY FAVORITE TEACHER, P.S Don't tell Gary"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'images/charles.png',
                      scale: 5.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
