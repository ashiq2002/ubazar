import 'package:bloc/bloc.dart';
import 'package:ubazar/model/cart_model.dart';

class ProductCubit extends Cubit<CartState>{
  ProductCubit(): super(CartState());

  void upadateProducttemState(){
    emit(CartState());
  }

}

class CartState{}

List<CartModel> productList = [];
