class RadioModel {
  final int id;
   String name;
   String url;

  RadioModel({required this.id, required this.name, required this.url});
  factory RadioModel.fromJson(json) {
    return RadioModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
