import 'package:dart_prompter_mj/src/option.dart';
import 'package:dart_prompter_mj/src/terminal.dart';

void main() {
  var terminal = Terminal();

  terminal.clearScreen();

  var optionsList = [
    Option('I want red', '#f00'),
    Option('I want blue', '#00f')
  ];

  terminal.printOptions(optionsList);
  var response = terminal.collectInput();
  terminal.printPrompt('You choose: $response');
}
