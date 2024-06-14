import 'dart:async';

mixin ValidationMixin {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePass =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.length >= 6) {
      sink.add(pass);
    } else {
      sink.addError('Password must be at least 6 characters');
    }
  });
}
