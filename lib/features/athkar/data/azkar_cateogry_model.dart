class AzkarCategoryModel {
  final String category;

  AzkarCategoryModel({required this.category});
  factory AzkarCategoryModel.fromJson(json) {
    return AzkarCategoryModel(category: json['category']);
  }
}
