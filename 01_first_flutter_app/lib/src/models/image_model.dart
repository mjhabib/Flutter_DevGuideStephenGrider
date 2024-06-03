class ImageModel {
  late int id;
  late String title;
  late String url;

  ImageModel(this.id, this.title, this.url);

  // Named constructor, in case we need to pass the entire json file to the class
  // our json type is 'Map' with a key of String and value of dynamic
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    url = parsedJson['url'];
  }
}
