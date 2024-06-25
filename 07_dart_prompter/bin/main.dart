import 'package:dart_prompter_mj/src/option.dart';
import 'package:dart_prompter_mj/src/prompter.dart';
import 'package:dart_prompter_mj/src/terminal.dart';

void main() {
  var terminal = Terminal();
  var prompter = Prompter();

  terminal.clearScreen();

  var options = [Option('I want red', '#f00'), Option('I want blue', '#00f')];
  String prompt = 'This is my question?';

  prompter.ask(prompt, options);

  var response = terminal.collectInput();
  terminal.printPrompt('You choose: $response');
}
