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

  void showDeck() {
    for (int i = 1; i < deck.length; i++) {
      print(deck.elementAt(i));
    }
  }

  void shuffle() {
    deck.shuffle();
  }

  Card drawCard() {
    int count = 0;
    return deck.removeAt(0);
  }

  int cardsLeft() {
    return deck.length;
  }

  Card addCard() {
    Card topCard = deck.elementAt(0);
    deck.removeAt(0);
    return topCard;
  }
}

void main() {
  Deck deck = new Deck();
  deck.shuffle();
  print("Card drawn");
  print(deck.drawCard());
  print(deck.drawCard());
  print(deck.drawCard());
  print(deck.cardsLeft());
}
