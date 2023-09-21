import 'package:ubazar/model/product_model.dart';

class CartModel {
  int quantity;
  bool isAddToFavorite;
  ProductList? product;

  CartModel(
      {this.quantity = 0,
      this.isAddToFavorite = false,
      this.product,});
}
