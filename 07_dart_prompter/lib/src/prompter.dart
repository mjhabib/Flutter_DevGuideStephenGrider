import 'terminal.dart';
import 'option.dart';

final Terminal _terminal = const Terminal();
// the final keyword won't allow anyone to misuse this instance by re-assigning a new value to it.
// const won't allow to create more than one instance of Terminal

class Prompter {
  // Terminal terminal = Terminal();

  bool askBinary(String prompt) {
    final input = _ask('$prompt (y/n)? ', []);
    return input!.contains('y');
  }

  askMultiple(String prompt, List<Option> options) {
    // Terminal terminal = Terminal();

    // if I define my Terminal here, every time I call the ask method it's gonna create an instance of that and later on throw it away, which means the waste of resources, that's why we define the Terminal instance outside of our class or method. If we define it inside our class, by calling the class each time, we're gonna create multiple instance of that Terminal which we don't need.

    final input = _ask(prompt, options);

    try {
      return options[int.parse(input!)].value;
    } catch (e) {
      _terminal.printPrompt('You entered an invalid input. Try again! \n');
      return askMultiple(prompt, options);
    }
  }

  _ask(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);
    return _terminal.collectInput();
  }
}
