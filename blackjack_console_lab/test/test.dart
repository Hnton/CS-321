import 'package:flutter_test/flutter_test.dart';

import '../Classes/Card.dart';
import '../Classes/Deck.dart';
import '../Classes/Player.dart';

void main() {
  // Card Class
  group("Card Class", () {
    test("Testing Card initializing", () {
      Card c = new Card(1, 1);
      expect(c.toString(), "Ace of Clubs");
    });
    test("Testing Card Value", () {
      Card c = new Card(1, 1);
      expect(c.getValue(), 1);
    });
  });
  //Deck Class
  group("Deck Class", () {
    test("Testing Deck initializing", () {
      Deck deck = new Deck();
      expect(deck.deckSize(), equals(52));
    });
    test("Testing addCard for adding card to hand", () {
      Deck deck = new Deck();
      Player player = new Player("Test");
      player.addCard(deck.addCard());
      expect(player.count(), equals(1));
    });
    test("Testing shuffle for deck", () {
      Deck deck = new Deck();
      Deck notDeck = new Deck();
      // notDeck.shuffle();
      deck.shuffle();
      expect(deck.getCardAt(5), isNot(equals(notDeck.getCardAt(5))));
    });
  });

  //Player Class
  group("Player Class", () {
    test("Testing Player initializing Name/Stash", () {
      Player p = new Player("Charles");
      expect(p.getName(), equals("Charles"));
      expect(p.getStash(), equals(2000));
    });
    test("Testing addStash/removeStash to Player", () {
      Player p = new Player("Charles");
      expect(p.addStash(1000), equals(3000));
      expect(p.removeStash(1000), equals(2000));
    });
    test("Testing addCard to Player Hand", () {
      Deck deck = new Deck();
      Player p = Player("Charles");
      p.addCard(deck.addCard());
      expect(p.count(), (equals(1)));
    });
    test("Testing clearHand", () {
      Deck deck = new Deck();
      Player p = Player("Charles");
      p.addCard(deck.addCard());
      p.clearHand();
      expect(p.count(), (equals(0)));
    });

    test("Testing handSum", () {
      Card c1 = new Card(1, 1);
      Card c2 = new Card(10, 1);
      Player p = Player("Charles");
      p.addCard(c1);
      p.addCard(c2);
      expect(p.handSum(), (equals(11)));
    });
  });
}
