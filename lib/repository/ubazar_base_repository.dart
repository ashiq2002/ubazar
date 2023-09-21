import 'package:ubazar/model/category_item_model.dart';
import 'package:ubazar/model/product_model.dart';

abstract class UbazarBaseRepository{
  Future<List<CategoryItemModel>> getCategories();
  Future<ProductModel> getProductByCategory(String query);
}