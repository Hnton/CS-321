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

  void getHand(bool c) {
    print(this.name + "s Hand");
    for (int i = 0; i < numCards; i++) {
      if (i == 0 && !c) {
        print("Hidden");
      } else {
        print(hand.elementAt(i).toString());
      }
    }
  }
}
