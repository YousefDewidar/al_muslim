class TafserModel {
  final String ayahNum;
  final String ayanTitle;
  final String ayahTafser;

  TafserModel({
    required this.ayahNum,
    required this.ayanTitle,
    required this.ayahTafser,
  });
  factory TafserModel.fromJson(json) {
    return TafserModel(
      ayahNum: json['aya'],
      ayanTitle: json['arabic_text'],
      ayahTafser: json['translation'],
    );
  }
}
