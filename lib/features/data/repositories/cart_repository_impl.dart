import 'package:either_dart/src/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/features/data/datasources/cart_local_data_source.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';
import 'package:flippy/features/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    final cart = await localDataSource.getCart();

    return Right(cart);
  }

  @override
  Future<Either<Failure, CartEntity>> addToCart(int id) async {
    final cart = await localDataSource.addToCart(id);
    return Right(cart);
  }
}
