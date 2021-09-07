import 'package:either_dart/src/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';
import 'package:flippy/features/domain/repositories/cart_repository.dart';

class AddToCart extends UseCase<CartEntity, int> {
  final CartRepository repository;

  AddToCart(this.repository);
  @override
  Future<Either<Failure, CartEntity>> call(int id) async {
    return await repository.addToCart(id);
  }
}
