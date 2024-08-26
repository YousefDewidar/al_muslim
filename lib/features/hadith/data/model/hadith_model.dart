class HadithModel {
  String hadith;
  bool isFav;

  HadithModel({required this.hadith, required this.isFav});

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      hadith: json['arab'],
      isFav: false,
    );
  }
}
