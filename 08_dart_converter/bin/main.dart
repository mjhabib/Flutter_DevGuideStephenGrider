import 'dart:io';
import 'package:dart_prompter_mj/dart_prompter_mj.dart';

void main() {
  final prompter = Prompter();

  final choice = prompter.askBinary('Are you ready to convert an image?');

  if (!choice) {
    exit(0);
  } else {
    final format =
        prompter.askMultiple('Select a format: ', buildFormatOptions());
    final file = prompter.askMultiple('Select a file: ', buildFileOptions());
  }
}

List<Option> buildFormatOptions() {
  return [Option('Convert to jpg', 'jpg'), Option('Convert to png', 'png')];
}

List<Option> buildFileOptions() {
  return [];
}
