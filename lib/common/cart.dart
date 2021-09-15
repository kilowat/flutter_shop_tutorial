import 'package:flippy/features/domain/entities/cart_entity.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';

class Cart {
  CartEntity _cartEntity;

  Cart(this._cartEntity);

  double get sum {
    return _cartEntity.products
        .fold(0.0, (previousValue, element) => element.product.price);
  }

  int get count {
    return _cartEntity.count;
  }

  List<CartItemEntity> get items => _cartEntity.products;

  void addToCart({
    required ProductEntity productEntity,
    int quantity = 1,
  }) {
    if (_cartEntity.products.length > 0) {
      final index = _cartEntity.products
          .indexWhere((element) => element.product.id == productEntity.id);

      if (index == -1) {
        var cloneItems = <CartItemEntity>[]..addAll(_cartEntity.products);
        cloneItems.sort((a, b) => a.cartId.compareTo(b.cartId));
        var biggestId = cloneItems.last.cartId;
        _cartEntity.products.add(CartItemEntity(
          cartId: biggestId++,
          product: productEntity,
          quantity: quantity,
        ));
      } else {
        _cartEntity.products[index].quantity += quantity;
      }
    } else {
      _cartEntity.products.add(CartItemEntity(
        cartId: 0,
        product: productEntity,
        quantity: quantity,
      ));
    }
  }
}
