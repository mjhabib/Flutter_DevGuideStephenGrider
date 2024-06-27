import 'dart:io';
import 'package:image/image.dart';

String convertImage(FileSystemEntity file, String format) {
  // we are sure about the type of property which is a File not an entity, so treat it as a File
  final rawImage = (file as File).readAsBytesSync();

  final image = decodeImage(rawImage);

  List<int> newImage = [];
  if (format == 'jpg') {
    newImage = encodeJpg(image!);
  } else if (format == 'png') {
    newImage = encodePng(image!);
  } else {
    print('Unsupported file type');
  }

  final newPath = replaceExtension(file.path, format);
  File(newPath).writeAsBytesSync(newImage);

  return newPath;
}

String replaceExtension(String path, String newExtension) {
  return path.replaceAll(RegExp(r'(png|jpg|jpeg)'), newExtension);
}
