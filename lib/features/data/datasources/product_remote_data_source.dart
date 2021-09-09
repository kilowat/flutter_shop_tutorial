import 'dart:convert';

import 'package:flippy/features/data/models/product_model.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAll();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getAll() async {
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    final jsonObject = json.decode(jsonString) as List;
    final productList =
        jsonObject.map((json) => ProductModel.fromJson(json)).toList();

    return productList;
  }
}
