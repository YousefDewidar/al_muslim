class AllAzkarModel {
  final String text;
  final int count;

  AllAzkarModel({
    required this.text,
    required this.count,
  });
  factory AllAzkarModel.fromJson(json) {
    return AllAzkarModel(text: json['text'], count: json['count']);
  }

  toJson(AllAzkarModel zkr) {
    return {
      'text': zkr.text,
      'count': zkr.count,
    };
  }
}
