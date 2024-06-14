import 'validation_mixin.dart';
import 'package:rxdart/rxdart.dart';

// possible work-around if the mixin clause without an extends class throws an error
// class Bloc extends ValidationMixin {
// class Bloc extends Object with ValidationMixin {
class Bloc with ValidationMixin {
  // Private names (_) which is useful to have access to these variables only inside this file
  // final _mailController = StreamController.broadcast();
  // final _passController = StreamController.broadcast();
  final _mailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();

  // Add data to stream using a getter
  Stream<String> get email => _mailController.stream.transform(validateEmail);
  Stream<String> get password => _passController.stream.transform(validatePass);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // Change data from stream using a getter
  Function(String) get changeMail => _mailController.sink.add;
  Function(String) get changePass => _passController.sink.add;

  submit() {
    print('Mail: ${_mailController.value} Pass: ${_passController.value}');
  }

  // Closes the stream (might not be necessary!)
  dispose() {
    _mailController.close();
    _passController.close();
  }
}

// Apply BLoC to our project using "Single Global Instance" method (might be better for small apps)
// final bloc = Bloc();
