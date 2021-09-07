import 'package:equatable/equatable.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';

abstract class CartState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartEmptyState extends CartState {}

class CartLoadingState extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => ["cart_loading"];
}

class CartLoadedState extends CartState {
  final CartEntity cartEntity;
  final isAdded;
  CartLoadedState({required this.cartEntity, this.isAdded = false});
  @override
  // TODO: implement props
  List<Object?> get props => [cartEntity];
}

class CartErrorState extends CartState {
  final String message;

  CartErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
