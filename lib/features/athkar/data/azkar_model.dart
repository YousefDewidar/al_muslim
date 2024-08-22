class AzkarModel {
  final String count;
  final String description;
  final String rferec;
  final String conten;
  AzkarModel({
    required this.count,
    required this.description,
    required this.rferec,
    required this.conten,
  });
  factory AzkarModel.fromJson(json) {
    return AzkarModel(
      count: json['count'],
      description: json['description'],
      rferec: json['reference'],
      conten: json['content'], 
    );
  }
}
