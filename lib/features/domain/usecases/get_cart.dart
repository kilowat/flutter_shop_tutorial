import 'package:either_dart/src/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';
import 'package:flippy/features/domain/repositories/cart_repository.dart';

class GetCart implements UseCase<CartEntity, EmptyParams> {
  final CartRepository repository;

  GetCart(this.repository);
  @override
  Future<Either<Failure, CartEntity>> call(EmptyParams params) {
    return repository.getCart();
  }
}
