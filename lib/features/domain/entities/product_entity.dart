import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;
  final int category;

  ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
  });
  @override
  List<Object?> get props => [];
}
