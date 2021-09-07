import 'dart:convert';

import 'package:flippy/features/data/models/category_model.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAll();
}

class FileCategoryRemoteDataSource implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getAll() async {
    final jsonString =
        await rootBundle.loadString('assets/data/categories.json');
    final categories = json.decode(jsonString) as List;
    return categories
        .map(
          (jsonCategory) => CategoryModel(
            id: jsonCategory['id'],
            name: jsonCategory['name'],
            image: jsonCategory['image'],
            child: jsonCategory['child'],
          ),
        )
        .toList();
  }
}
