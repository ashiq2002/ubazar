import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ubazar/repository/ubazar_base_repository.dart';
import 'package:ubazar/repository/ubazar_repository.dart';
import 'package:ubazar/viewModel/product_bloc/product_even.dart';
import 'package:ubazar/viewModel/product_bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductSate> {
  final UbazarBaseRepository _repository;

  ProductBloc({required UbazarRepository repository})
      : _repository = repository,
        super(ProductLoadingState()) {
    on<ProductLoadedEvent>(_productLoadedEvent);
  }

  //product loaded event
  void _productLoadedEvent(
      ProductLoadedEvent event, Emitter<ProductSate> emit) async {
    emit(ProductLoadingState());

    //get product by category
    try {
      final product = await _repository.getProductByCategory(event.query);
      emit(ProductLoadedState(productModel: product));
    } catch (e) {
      debugPrint("failed to retrieve product data-> $e");
    }
  }
}
