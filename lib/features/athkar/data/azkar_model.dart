class AzkarModel {
  final String category;
  final String text; 
  final int count;
  final int id;
  // final String rferec;
  // final String conten;
  AzkarModel( {
    required this.category,
    required this.count,
    required this.text,
    required this.id,
    // required this.rferec,
    // required this.conten,
  });
  factory AzkarModel.fromJson(json) {
    return AzkarModel(
      category:json['category'],
      text:json['array'][0]['text'] ,
      count: json['array'][0]['count'],
      id: json['array'][0]['id'],
    );
  }
}
