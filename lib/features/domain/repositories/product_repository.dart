import 'package:either_dart/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAll();
  Future<Either<Failure, List<ProductEntity>>> getRandom([int count = 5]);
}
