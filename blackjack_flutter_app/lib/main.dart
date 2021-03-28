import 'package:blackjack_flutter_app/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'playerDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlackJack Game',
      home: Container(
        child: ChangeNotifierProvider(
          create: (context) => CardData(context),
          child: Scaffold(
              backgroundColor: Colors.green[800],
              drawer: PlayerDrawer(),
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text('Blackjack Game'),
              ),
              body: Center(
                child: GameScreen(),
              )),
        ),
      ),
    );
  }
}
