void main() {
  Deck();
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
}

class Card {
  late String suit;
  late String rank;

  Card(this.suit, this.rank);
}
