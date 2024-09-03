class AllAzkarModel {
  final String text;
  final int count;
   bool? isFav=true;

  AllAzkarModel( {required this.text, required this.count,this.isFav,});
  factory AllAzkarModel.fromJson(json) {
    return AllAzkarModel(text: json['text'], count: json['count']);
  }
}
