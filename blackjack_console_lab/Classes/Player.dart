import 'Card.dart';

class Player {
  String name;
  int numCards = 0;
  List<Card> hand = new List<Card>();
  int stash;

  Player(String name) {
    this.name = name;
    this.stash = 2000;
  }

  getStash() {
    return stash;
  }

  int addStash(int a) {
    stash = stash + a;
    return stash;
  }

  int removeStash(int r) {
    if (stash <= 0) {
      print("You are out of funds");
    }
    stash = stash - r;
    return stash;
  }

  getName() {
    return name;
  }

  void addCard(Card c) {
    hand.add(c);
    this.numCards++;
  }

  bool isBlackJack(List<Card> h) {
    Card c = new Card(1, 1);
    Card c1 = new Card(1, 2);
    Card c2 = new Card(1, 3);
    Card c3 = new Card(1, 4);

    if (h.elementAt(0).toString() == c.toString() ||
        h.elementAt(0).toString() == c1.toString() ||
        h.elementAt(0).toString() == c2.toString() ||
        h.elementAt(0).toString() == c3.toString() ||
        h.elementAt(1).toString() == c.toString() ||
        h.elementAt(1).toString() == c1.toString() ||
        h.elementAt(1).toString() == c2.toString() ||
        h.elementAt(1).toString() == c3.toString()) {
      return true;
    } else {
      return false;
    }
  }

  void clearHand() {
    hand.clear();
    numCards = 0;
  }

  int count() {
    return numCards;
  }

  int handSum() {
    int total = 0;
    for (Card countSum in hand) {
      total = total + countSum.getValue();
    }
    return total;
  }

  List<Card> getHand(bool c) {
    print(this.name + "s Hand");
    for (int i = 0; i < numCards; i++) {
      if (i == 0 && !c) {
        print("Hidden");
      } else {
        print(hand.elementAt(i).toString());
      }
    }
    return hand;
  }

  List<Card> getCards() {
    for (int i = 0; i < numCards; i++) {
      hand.elementAt(i).toString();
    }
    return hand;
  }
}
