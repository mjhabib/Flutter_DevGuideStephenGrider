import 'dart:async';

class Bloc {
  // Private names (_) which is useful to have access to these variables only inside this file
  final _mailController = StreamController<String>();
  final _passController = StreamController<String>();

  // Add data to stream using a getter
  Stream<String> get email => _mailController.stream;
  Stream<String> get password => _passController.stream;

  // Change data from stream using a getter
  Function(String) get changeMail => _mailController.sink.add;
  Function(String) get changePass => _passController.sink.add;
}
