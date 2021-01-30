class Card {
  int rank;
  int suit;
  int value;

  int getValue() {
    if (rank == 1) {
      value = 1;
    }
    if (rank == 2) {
      value = 2;
    }
    if (rank == 3) {
      value = 3;
    }
    if (rank == 4) {
      value = 4;
    }
    if (rank == 5) {
      value = 5;
    }
    if (rank == 6) {
      value = 6;
    }
    if (rank == 7) {
      value = 7;
    }
    if (rank == 8) {
      value = 8;
    }
    if (rank == 9) {
      value = 9;
    }
    if (rank == 10) {
      value = 10;
    }
    if (rank == 11) {
      value = 10;
    }
    if (rank == 12) {
      value = 10;
    }
    if (rank == 13) {
      value = 10;
    }
    return value;
  }

  String toString() {
    String result = "";

    if (rank == 1) {
      result = "Ace";
      value = 1;
    }
    if (rank == 2) {
      result = "Two";
      value = 2;
    }
    if (rank == 3) {
      result = "Three";
      value = 3;
    }
    if (rank == 4) {
      result = "Four";
      value = 4;
    }
    if (rank == 5) {
      result = "Five";
      value = 5;
    }
    if (rank == 6) {
      result = "Six";
      value = 6;
    }
    if (rank == 7) {
      result = "Seven";
      value = 7;
    }
    if (rank == 8) {
      result = "Eight";
      value = 8;
    }
    if (rank == 9) {
      result = "Nine";
      value = 9;
    }
    if (rank == 10) {
      result = "Ten";
      value = 10;
    }
    if (rank == 11) {
      result = "Jack";
      value = 10;
    }
    if (rank == 12) {
      result = "Queen";
      value = 10;
    }
    if (rank == 13) {
      result = "King";
      value = 10;
    }

    if (suit == 1) {
      result = result + " of Clubs";
    }
    if (suit == 2) {
      result = result + " of Diamonds";
    }
    if (suit == 3) {
      result = result + " of Hearts";
    }
    if (suit == 4) {
      result = result + " of Spades";
    }

    return result;
  }

  Card(int rank, int suit) {
    this.rank = rank;
    this.suit = suit;
  }
}
