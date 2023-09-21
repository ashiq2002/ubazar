import 'package:equatable/equatable.dart';
import 'package:ubazar/model/product_model.dart';

abstract class ProductSate extends Equatable{
  const ProductSate();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductSate{}

class ProductLoadedState extends ProductSate{
  final ProductModel productModel;

  const ProductLoadedState({ required this.productModel});

  @override
  // TODO: implement props
  List<Object?> get props => [productModel];
}

class ProductErrorState extends ProductSate{
  final String message;

  const ProductErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}