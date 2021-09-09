import 'dart:convert';

import 'package:flippy/common/cart.dart';
import 'package:flippy/features/data/models/cart_model.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartLocalDataSource {
  Future<CartModel> getCart();
  Future<CartModel> addToCart(int id);
}

class PreferencesCartDataSource implements CartLocalDataSource {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static const CART_KEY = "cart_key";

  @override
  Future<CartModel> addToCart(int id) async {
    final Cart cart = await _restoreCart();
    cart.addToCart(
      productEntity: ProductEntity(
        id: id,
        name: "test",
        image: "test",
        price: 0.0,
        category: 1,
      ),
    );

    final cartModel = CartModel(
      sum: cart.sum,
      count: cart.count,
      products: cart.items,
    );
    _saveCart(cartModel);

    return Future<CartModel>.value(cartModel);
  }

  void _saveCart(CartModel cartModel) async {
    final prefs = await _prefs;

    final jsonString = json.encode(cartModel.toJson());
    final resAdd = await prefs.setString(CART_KEY, jsonString);
    final restore = await _restoreCart();
  }

  @override
  Future<CartModel> getCart() async {
    final cart = await _restoreCart();
    return Future<CartModel>.value(
      CartModel(
        sum: cart.sum,
        count: cart.count,
        products: cart.items,
      ),
    );
  }

  Future<Cart> _restoreCart() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(CART_KEY);
    if (jsonString != null) {
      return Cart(CartModel.fromJson(json.decode(jsonString)));
    } else {
      return Cart(CartEntity(count: 0, sum: 0.0, products: []));
    }
  }
}
