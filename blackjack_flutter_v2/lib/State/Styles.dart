import 'package:flutter/material.dart';

void main() {
  runApp(BlackJack());
}

class BlackJack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Styles _s = Styles();
    return MaterialApp(
      title: 'BlackJack',
      home: Container(
        child: ChangeNotifierProvider(
          create: (context) => AppData(context),
          child: Scaffold(
              backgroundColor: _s.green(),
              drawer: Hamburger(),
              appBar: AppBar(
                backgroundColor: _s.grey(),
                title: Text('BlackJack'),
              ),
              body: Center(
                child: BlackJackTable(),
              )),
        ),
      ),
    );
  }
}
