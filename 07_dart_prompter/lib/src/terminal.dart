import 'dart:io';
import 'option.dart';

class Terminal {
  void printPrompt(String prompt) {
    stdout.writeln(prompt);
  }

  void printOptions(List<Option> options) {
    // for (var i = 0; i < options.length; i++) {
    //   stdout.writeln('[$i] - ${options[i].label}');
    // }

    // Alternative way to deal with our list of options
    // we turn/convert our list to a map then iterate through it
    // the sole reason we used asMap is because we care about the index of that option, otherwise we could just iterate through our list without any indexes
    options.asMap().forEach((index, value) {
      stdout.writeln('[$index] - ${value.label}');
    });

    stdout.writeln('Enter a choice: \n');
    stdout.write('> ');
  }

  String? collectInput() {
    return stdin.readLineSync();
  }

  void clearScreen() {
    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }
}
