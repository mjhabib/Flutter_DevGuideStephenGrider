void main() {
  var deck = Deck();
  deck.shuffle();

  print('All the Spades: ');
  print(deck.cardWithSuit('Spades'));
  // anytime we want to print out an instance of a class, if we call the toString function, we can print out any custom message we want

  print('\n Deal hand: ');
  print(deck.deal(5));

  print('\n Remaining cards: ');
  print(deck.cards);
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

  shuffle() {
    cards.shuffle();
  }

  cardWithSuit(String suit) {
    // return cards.where((card) {
    //   return card.suit == suit;
    // });
    return cards.where((card) => card.suit == suit);
  }

  deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    // when we 'deal' a new 'hand of cards', the sublist is not gonna remove the 'hand' from our original list
    cards = cards.sublist(handSize);
    // that's why we need to call the sublist again, from handSize to 'end', so we can remove our 'hand' from the original list
    return hand;
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
