import 'dart:developer';

import 'package:blackjack_flutter_app/CardDeck.dart';
import 'package:blackjack_flutter_app/PokerCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class CardData extends ChangeNotifier {
  CardDeck deck;
  List<PokerCard> playerHand = [];
  List<PokerCard> dealerHand = [];
  List<Positioned> displayPlayerHand = [];
  List<Positioned> displayDealHand = [];
  BuildContext context;
  int purse = 100;
  int pot = 0;
  String name = "Mikael";
  int bet = 0;
  int playerWin = 0;
  int dealerWin = 0;
  int tie = 0;

  CardData(this.context) {
    deck = CardDeck();
    deck.shuffle();
    deal();
  }

  void deal() {
    if (deck.size() < 10) {
      deck = CardDeck();
      log("NEW DECK");
    }
    playerHand = [];
    dealerHand = [];
    deck.shuffle();
    dealerHand.add(deck.removeCard());
    playerHand.add(deck.removeCard());
    dealerHand.add(deck.removeCard());
    playerHand.add(deck.removeCard());
    dealerHand.elementAt(0).setHidden();
    dealerHand.elementAt(1).setHidden();
    playerHand.elementAt(0).setHidden();
    playerHand.elementAt(1).setHidden();
  }

  void play() {
    // dealerHand.elementAt(0).setShow();
    dealerHand.elementAt(1).setShow();
    playerHand.elementAt(0).setShow();
    playerHand.elementAt(1).setShow();
  }

  void playerAddCard() {
    int total = playerCount();

    if (total > 21) {
      log("YOU LOST");
    } else {
      playerHand.add(deck.removeCard());
    }
    notifyListeners();
  }

  int dealerCount() {
    var total = 0;
    var ace = 0;

    dealerHand.forEach((element) {
      if (element.value == 1) {
        ace++;
      } else if (element.value > 10) {
        total += 10;
      } else {
        total += element.value;
      }
    });

    for (var a = 0; a < ace; a++) {
      if (total < 11) {
        total += 11;
      } else {
        total += 1;
      }
    }
    return total;
  }

  int playerCount() {
    var total = 0;
    var ace = 0;

    playerHand.forEach((element) {
      if (element.value == 1) {
        ace++;
      } else if (element.value > 10) {
        total += 10;
      } else {
        total += element.value;
      }
    });

    for (var a = 0; a < ace; a++) {
      if (total < 11) {
        total += 11;
      } else {
        total += 1;
      }
    }
    return total;
  }

  void stay() {
    PokerCard c = dealerHand.elementAt(0);
    c.setShow();
    dealerHand.removeAt(0);
    dealerHand.add(c);

    while (dealerCount() < 17) {
      dealerHand.add(deck.removeCard());
    }

    whoWon();
    log(dealerCount().toString());
    log(playerCount().toString());

    notifyListeners();
  }

  String whoWon() {
    String who = "BlackJack";
    if (playerCount() == 21 ||
        dealerCount() > 21 ||
        dealerCount() < playerCount() && playerCount() < 22) {
      purse = pot + purse;
      pot = 0;
      playerWin += 1;
      who = "Player Won";
      log("Player WON");
      return who;
    } else if (dealerCount() == playerCount()) {
      tie += 1;
      log("TIE");
      who = "TIE";
      return who;
    } else {
      log("DEALER WON");
      who = "Dealer Won";
      dealerWin += 1;
      purse = purse - bet;
      pot = 0;

      return who;
    }
  }

  void newGame() {
    playerHand.clear();
    dealerHand.clear();
    deal();
    log("NEW GAME");
    notifyListeners();
  }

  void startGame() {
    for (int i = 0; i < dealerHand.length; i++) {
      PokerCard c = dealerHand.elementAt(i);
      c.setShow();
      dealerHand.removeAt(i);
      dealerHand.add(c);
    }
    for (int i = 0; i < playerHand.length; i++) {
      PokerCard c = playerHand.elementAt(i);
      c.setShow();
      playerHand.removeAt(i);
      playerHand.add(c);
    }

    play();
    notifyListeners();
  }

  int getPot() {
    pot = bet * 2;
    return pot;
  }

  int getPurse() {
    if (purse < 0) {
      purse = 1000;
    }
    return purse - bet;
  }

  int incrementBet() {
    return bet += 10;
  }
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    CardData _cardData = Provider.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          _cardData.playerAddCard();
        });
      },
      onPanEnd: (details) {
        setState(() {
          _cardData.stay();
        });
      },
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(_cardData.name),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < _cardData.dealerHand.length; i++)
                    _cardData.dealerHand.elementAt(i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      onPressed: _cardData.newGame,
                      child: Text("New Game")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      onPressed: _cardData.startGame,
                      child: Text("Deal")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Purse: " + _cardData.getPurse().toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pot: " + _cardData.getPot().toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _cardData.incrementBet();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'images/chip.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  Text(_cardData.bet.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < _cardData.playerHand.length; i++)
                    _cardData.playerHand.elementAt(i),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
