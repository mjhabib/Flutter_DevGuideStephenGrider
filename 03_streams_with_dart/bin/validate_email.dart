import 'dart:async';
import 'dart:html';

void main() {
  final Element? input = querySelector('input');
  final Element? div = querySelector('div');

  final validateEmail = StreamTransformer.fromHandlers(
    handleData: (String inputValue, sink) {
      if (inputValue.contains('@')) {
        sink.add(inputValue);
      } else {
        sink.addError('Enter a valid email!');
      }
    },
  );

  input?.onInput
      .map((dynamic e) => print(e.target?.value))
      .transform(validateEmail)
      .listen((e) => div?.innerHtml = '',
          onError: (err) => div?.innerHtml = err);
}
