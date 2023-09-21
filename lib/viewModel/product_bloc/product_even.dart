import 'package:equatable/equatable.dart';
import 'package:ubazar/model/product_model.dart';

abstract class ProductEvent extends Equatable{
  const ProductEvent();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadingEvent extends ProductEvent{}

class ProductLoadedEvent extends ProductEvent{
  final String query;

  const ProductLoadedEvent({this.query = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}

class ProductErrorEvent extends ProductEvent{
  final String message;

  const ProductErrorEvent(this.message);
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
  
}