import 'package:flippy/features/data/models/product_model.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({required sum, required count, required products})
      : super(
          sum: sum,
          count: count,
          products: products,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      sum: json['sum'],
      count: json['count'],
      products: (json['products'] as List)
          .map(
            (e) => CartItemEntity(
              cartId: e['cartId'],
              product: ProductModel.fromJson(e['product']),
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sum": sum,
      "count": count,
      "products": products
          .map((e) => {
                "cartId": e.cartId,
                "quantity": e.quantity,
                "product": ProductModel(
                  id: e.product.id,
                  name: e.product.name,
                  image: e.product.image,
                  price: e.product.price,
                ).toJson(),
              })
          .toList(),
    };
  }
}
