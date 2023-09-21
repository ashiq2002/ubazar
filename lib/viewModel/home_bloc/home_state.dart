import 'package:ubazar/model/category_item_model.dart';

abstract class HomeState{}

class CategoryLoadingState extends HomeState{}

class CategoryLoadedState extends HomeState{
  final List<CategoryItemModel> categories;

  CategoryLoadedState({required this.categories});
}

class BaseCategoryItemState extends HomeState{
  int index;
  BaseCategoryItemState({this.index = 0});
}