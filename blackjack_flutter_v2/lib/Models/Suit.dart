enum Suit {
  Diamonds,
  Hearts,
  Spades,
  Clubs,
}

/// Convert a suit to a string
String suitToString(Suit suit) {
  return suit.toString().split('.').elementAt(1);
}

/// Convert a string to a suit, or null
Suit toSuit(String suit) {
  return Suit.values.firstWhere(
      (e) => e.toString().split('.').elementAt(1) == suit,
      orElse: () => null);
}
