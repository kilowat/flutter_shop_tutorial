import 'package:equatable/equatable.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';

class CartEntity extends Equatable {
  final double sum;
  final int count;
  final List<CartItemEntity> products;

  CartEntity({
    required this.sum,
    required this.count,
    required this.products,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [sum, count, products];
}

class CartItemEntity {
  final int cartId;
  final ProductEntity product;
  int quantity;

  CartItemEntity({
    required this.cartId,
    required this.product,
    this.quantity = 0,
  });
}
