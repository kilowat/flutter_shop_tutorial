import 'package:either_dart/either.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAll();
}