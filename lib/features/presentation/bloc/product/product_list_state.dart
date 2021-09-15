import 'package:equatable/equatable.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';

abstract class ProductListState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductListEmptyState extends ProductListState {}

class ProductListLoadingState extends ProductListState {
  @override
  // TODO: implement props
  List<Object?> get props => ["product_list_loading"];
}

class ProductListLoadedState extends ProductListState {
  final List<ProductEntity> productList;

  ProductListLoadedState({required this.productList});
  @override
  // TODO: implement props
  List<Object?> get props => [productList];
}

class ProductListErrorState extends ProductListState {
  final String message;

  ProductListErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
