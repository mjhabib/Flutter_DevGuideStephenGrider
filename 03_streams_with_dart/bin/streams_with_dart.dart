import 'dart:async';

void main() {
  final order = Order('banana');
  final controller = StreamController();

  final baker = StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'chocolate') {
      sink.add(Cake());
    } else {
      sink.addError('We can\'t bake that type!');
    }
  });

  controller.sink.add(order);
  controller.stream.map((order) => order.type).transform(baker).listen(
      (cake) => print('Here\'s your cake $cake'),
      onError: (err) => print(err));
}

class Order {
  late String type;
  Order(this.type);
}

class Cake {}
