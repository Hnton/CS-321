import 'dart:io';

import 'Deck.dart';
import 'Player.dart';

void main() {
  Deck d = new Deck();

  print("Players Name:");
  String ans = stdin.readLineSync();
  String name = ans;
  print("Welcome to Simple Blackjack $name");
  print("");
  Player player = new Player(name);
  Player dealer = new Player("Dealer");
  d.shuffle();
  int blackJackCount = 0;
  bool keepPlaying = true;
  do {
    do {
      int playerStash = player.getStash();
      int dealerStash = dealer.getStash();

      print("$name has $playerStash Dollars");
      print("");
      print("Dealer has $dealerStash Dollars");
      print("");

      print("How much would you like to bet $name?");
      String playerBetString = stdin.readLineSync();
      var playerBet = int.parse(playerBetString);

      player.addCard(d.addCard());
      dealer.addCard(d.addCard());
      player.addCard(d.addCard());
      dealer.addCard(d.addCard());

      player.getHand(true);
      print(player.handSum());
      print("");
      dealer.getHand(false);
      String decision = "";
      bool bust = false;
      bool blackJack = false;
      // Player
      do {
        if (player.isBlackJack(player.getCards()) == true &&
            player.handSum() == 11) {
          blackJack = true;
          print("*****$name has a BLACKJACK!*****");
        }
        blackJackCount++;

        print("Would $name like to stay or hit? 's/h'");
        decision = stdin.readLineSync();

        if (decision.toLowerCase() == "h" && blackJack == false) {
          player.addCard(d.addCard());
          print("Your total is:");
          print(player.handSum());
          if (player.handSum() > 21) {
            print("You have busted");
            player.removeStash(playerBet);
            dealer.addStash(playerBet);
            bust = true;
          }
        }
        if (ans.toLowerCase() == "s" && bust == false && blackJack == false) {
          print("You have chosen to stay");
        }
      } while (
          decision.toLowerCase() == "h" && bust == false && blackJack == false);

      print("");
      print("---Dealers turn---");
// Dealer
      if (bust == false) {
        if (blackJack == false) {
          do {
            if (dealer.handSum() <= 16) {
              print("");
              print("Dealer has to hit");
              print("");
              dealer.addCard(d.addCard());
              dealer.getHand(true);
            }
            if (dealer.handSum() > 21) {
              print("");
              print("Dealer busted");
            }
            if (dealer.handSum() > 16 && dealer.handSum() < 22) {
              print("");
              print("Dealer Stays");
            }
          } while (dealer.handSum() <= 16);
        }
      }
      print("");

      int totalDealer = dealer.handSum();
      int totalPlayer = player.handSum();

      player.getHand(true);
      print(player.handSum());
      print("");
      dealer.getHand(true);
      print(dealer.handSum());
      print("");
      if (totalPlayer > totalDealer && totalPlayer <= 21) {
        var name = player.getName();
        player.addStash(playerBet);
        dealer.removeStash(playerBet);
        print("*****$name has won!*****");
      } else if (totalDealer > 21) {
        var name = player.getName();
        player.addStash(playerBet);
        dealer.removeStash(playerBet);
        print("*****$name has won!*****");
      } else if (totalDealer > totalPlayer && totalDealer <= 21) {
        print("*****Dealer Won!******");
        dealer.addStash(playerBet);
        player.removeStash(playerBet);
      } else if (totalPlayer > 21) {
        print("*****Dealer Won!******");
        dealer.addStash(playerBet);
        player.removeStash(playerBet);
      } else if (totalPlayer == totalDealer) {
        print("*****Push*****");
      }

      var p = player.getStash();
      print("$name has $p Dollars");
      print("");
      var de = dealer.getStash();

      print("Dealer has $de Dollars");
      print("");

      print("Keep Playing? y/n");
      String play = stdin.readLineSync();

      if (play == "y") {
        player.clearHand();
        dealer.clearHand();

        if (player.getStash() == 0) {
          print("You are out of money, here is a complementary 1000 dollars");
          player.addStash(1000);
        }

        if (dealer.getStash() == 0) {
          print("You have beaten the dealer!");
          dealer.addStash(1000000);
        }

        if (d.cardsLeft() < 10) {
          d = new Deck();
          d.shuffle();
          print("Shuffling Deck");
        }
      } else {
        keepPlaying = false;
      }
    } while (blackJackCount == 0);
  } while (keepPlaying == true);

  print("Thank you for playing Simple Blackjack");
}
