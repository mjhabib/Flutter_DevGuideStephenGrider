import 'package:dart_prompter_mj/src/terminal.dart';

void main() {
  var terminal = Terminal();
  terminal.clearScreen();
  terminal.printPrompt('print this on console');
  var input = terminal.collectInput();
  terminal.printPrompt('You typed: $input');
}
