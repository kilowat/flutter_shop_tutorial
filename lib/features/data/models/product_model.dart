import 'package:flippy/features/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required id,
    required name,
    required image,
    required price,
    required category,
  }) : super(
          id: id,
          name: name,
          image: image,
          price: price,
          category: category,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'category': category,
    };
  }
}
