import 'dart:convert';
import 'dart:math';

import 'package:flippy/features/data/models/product_model.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAll();
  Future<List<ProductModel>> getRandom();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final _random = new Random();
  @override
  Future<List<ProductModel>> getAll() async {
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    final jsonObject = json.decode(jsonString) as List;
    final productList =
        jsonObject.map((json) => ProductModel.fromJson(json)).toList();

    return productList;
  }

  @override
  Future<List<ProductModel>> getRandom([int count = 5]) async {
    final products = await this.getAll();
    if (count > products.length) count = products.length;

    return new List.generate(
        count, (_) => products[_random.nextInt(products.length)]);
  }
}
