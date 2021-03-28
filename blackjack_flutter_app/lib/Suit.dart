/// Represents the suits found in a
/// deck of standard playing cards
enum Suit {
  Clubs,
  Diamonds,
  Hearts,
  Spades,
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
