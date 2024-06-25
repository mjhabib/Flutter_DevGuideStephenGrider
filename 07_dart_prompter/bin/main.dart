import 'package:dart_prompter_mj/src/option.dart';
import 'package:dart_prompter_mj/src/prompter.dart';

void main() {
  final prompter = Prompter();

  // terminal.clearScreen();
  // even that we did not define a new Terminal instance in this file, we still have access to it because by importing the Prompter here, we have access to everything in that file, including the Terminal instance. To prevent this, we did mark that Terminal as private by adding '_' before that variable name.

  final options = [Option('I want red', '#f00'), Option('I want blue', '#00f')];
  final prompt = 'This is my question?';

  final usersPick = prompter.askMultiple(prompt, options);
  print(usersPick);

  final pickBinary = prompter.askBinary('Do you wanna build a snowman');
  print(pickBinary);
}


// var: we can reassign it in the future
// final: the variable can't be re-assigned BUT we can still modify its values
// const: a compile time constant which can't be re-assigned, or changing values in the future. 
