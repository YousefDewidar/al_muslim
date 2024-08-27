class AzkarModel {
  final String category;
  final String text;
  final int count;
  final int id;
  late bool isFav;
  AzkarModel({
    required this.category,
    this.isFav = false,
    required this.count,
    required this.text,
    required this.id,
  });
  factory AzkarModel.fromJson(json) {
    return AzkarModel(
      category: json['category'],
      text: json['array'][0]['text'],
      count: json['array'][0]['count'],
      id: json['array'][0]['id'],
    );
  }
  factory AzkarModel.fromJsonToFav(json) {
    return AzkarModel(
      category: json['category'],
      text: json['text'],
      count: json['count'],
      id: json['id'],
      isFav: json['isFav'],
    );
  }

  Map<String, dynamic> toJson() => {
        'category': category,
        'text': text,
        'count': count,
        'id': id,
        'isFav': isFav,
      };
}
