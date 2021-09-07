import 'package:either_dart/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> addToCart(int id);
}
