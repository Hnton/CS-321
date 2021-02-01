import 'dart:math';

import 'Card.dart';

class Deck {
  Random shuffles = new Random();

  List<Card> deck = new List<Card>();

  Random rand = new Random();

  Deck() {
    for (int ranks = 1; ranks <= 13; ranks++) {
      for (int suits = 1; suits <= 4; suits++) {
        deck.add(new Card(ranks, suits));
      }
    }
  }

  int deckSize() {
    return deck.length;
  }

  void showDeck() {
    for (int i = 1; i < deck.length; i++) {
      print(deck.elementAt(i));
    }
  }

  void shuffle() {
    deck.shuffle();
  }

  int cardsLeft() {
    return deck.length;
  }

  Card getCardAt(int i) {
    Card card = deck.elementAt(i);
    return card;
  }

  Card addCard() {
    Card topCard = deck.elementAt(0);
    deck.removeAt(0);
    return topCard;
  }
}
