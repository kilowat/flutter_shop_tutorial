import 'package:either_dart/src/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';
import 'package:flippy/features/domain/repositories/product_repository.dart';

class ProductGetRandom implements UseCase<List<ProductEntity>, int> {
  final ProductRepository repository;

  ProductGetRandom(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call([int count = 5]) async {
    return await this.repository.getRandom(count);
  }
}
