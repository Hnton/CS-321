import 'PokerCard.dart';
import 'Suit.dart';

class CardDeck {
  List<PokerCard> deck = [];
  List<Suit> suits = Suit.values;

  /// Representation of a deck of a
  /// standard deck of playing cards.
  // ignore: non_constant_identifier_names
  CardDeck() {
    for (var i = 0; i < suits.length; i++) {
      for (var j = 1; j < 14; j++) {
        deck.add(PokerCard(Suit.values[i], j, false));
      }
    }
  }

  /// Shuffle the deck of cards.
  void shuffle() {
    // One shuffle of a new deck
    // is never enough
    deck.shuffle();
    deck.shuffle();
    deck.shuffle();
  }

  /// How many cards are in the deck.
  int size() {
    return deck.length;
  }

  /// Remove a card from the deck.
  PokerCard removeCard() {
    return deck.removeAt(0);
  }

  /// Add a card to the deck.
  void addCard(PokerCard card) {
    deck.add(card);
  }
}