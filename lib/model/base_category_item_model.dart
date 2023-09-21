class BaseCategoryItemModel{
  final String iconPath;
  final String category;
  final String description;

  BaseCategoryItemModel({required this.iconPath, required this.category, this.description = ""});
}

//category list
List<BaseCategoryItemModel> categoryItem = [
  BaseCategoryItemModel(iconPath: 'assets/ic_market.png', category: "Market"),
  BaseCategoryItemModel(iconPath: 'assets/ic_fruits.png', category: "Fruits"),
  BaseCategoryItemModel(iconPath: 'assets/ic_vegetables.png', category: "Vegetables"),
  BaseCategoryItemModel(iconPath: 'assets/ic_fish.png', category: "Fish"),
];