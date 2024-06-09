import 'dart:html';

void main() {
  final Element? button = querySelector('button');
  final Element? input = querySelector('input');

  button?.onClick.take(4).where((e) => input?.nodeValue == 'banana').listen(
      (e) => print('You got it!'),
      onDone: () => print('Sorry, maybe next time!'));
}
