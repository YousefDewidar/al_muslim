class HadithModel {
  String hadith;

  HadithModel({required this.hadith});

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      hadith: json['arab'],
    );
  }
}
