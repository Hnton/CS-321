enum Suit {
  Clubs,
  Diamonds,
  Hearts,
  Spades,
}

String suitToString(Suit suit) {
  return suit.toString().split('.').elementAt(1);
}
