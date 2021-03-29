import 'PokerCard.dart';
import 'Suit.dart';

class CardDeck {
  List<PokerCard> deck = [];
  List<Suit> suits = Suit.values;

  CardDeck() {
    for (var i = 0; i < suits.length; i++) {
      for (var j = 1; j < 14; j++) {
        deck.add(PokerCard(Suit.values[i], j, false));
      }
    }
  }

  void shuffle() {
    deck.shuffle();
    deck.shuffle();
    deck.shuffle();
    deck.shuffle();
    deck.shuffle();
    deck.shuffle();
    deck.shuffle();
    deck.shuffle();
  }

  PokerCard removeCard() {
    return deck.removeAt(0);
  }

  void addCard(PokerCard card) {
    deck.add(card);
  }

  int size() {
    return deck.length;
  }
}
