import 'dart:io';
import 'package:dart_converter/src/converter.dart';
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
    final newPath = convertImage(file, format);

    prompter.askBinary('Is this your file: $newPath');
  }
}

List<Option> buildFormatOptions() {
  return [Option('Convert to jpg', 'jpg'), Option('Convert to png', 'png')];
}

List<Option> buildFileOptions() {
  // get a reference to the current working directory
  // final currentDirectory = Directory.current;

  // find all the files/folders in this directory
  // final entities = currentDirectory.listSync();

  // look through that list and find only the 'images'
  // entities.where((entity){
  //   return FileSystemEntity.isFileSync(entity.path);
  // });

  // Combine all the codes above to one single line of code!
  // take all the images and create an option list out of each
  return Directory.current.listSync().where((entity) {
    return FileSystemEntity.isFileSync(entity.path) &&
        entity.path.contains(RegExp(r'\.(png|jpg|jpeg)'));
    // look only for files not folders (if true), find the images by their extensions
  }).map((entity) {
    final fileName = entity.path.split(Platform.pathSeparator).last;
    // in windows we can't simply split the path by passing '/' because windows uses '\' to separate the path name
    return Option(fileName, entity);
  }).toList();
}
