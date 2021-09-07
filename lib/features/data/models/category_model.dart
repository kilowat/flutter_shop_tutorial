import 'package:flippy/features/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required id,
    required name,
    required image,
    child = const [],
  }) : super(
          id: id,
          name: name,
          image: image,
          child: child,
        );
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      child:
          (json['child'] as List).map((child) => CategoryModel.fromJson(child)),
      image: [json['image']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'child': child,
    };
  }
}
