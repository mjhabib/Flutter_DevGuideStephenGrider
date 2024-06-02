void main() {
  var deck = Deck();
  print(deck);
  // anytime we want to print out an instance of a class, if we call the toString function, we can print out any custom message we want
}

class Deck {
  List<Card> cards = [];

  Deck() {
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    var ranks = ['Ace', 'One', 'Two', 'Three', 'Four', 'Five'];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = Card(suit, rank);
        cards.add(card);
      }
    }
  }
  @override
  String toString() {
    return cards.toString();
  }
}

class Card {
  late String suit;
  late String rank;

  Card(this.suit, this.rank);

  @override
  toString() {
    return '$rank of $suit';
  }
}
