import 'package:either_dart/src/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';
import 'package:flippy/features/domain/repositories/product_repository.dart';

class ProductGetAll implements UseCase<List<ProductEntity>, EmptyParams> {
  final ProductRepository repository;

  ProductGetAll(this.repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(EmptyParams params) async {
    return await repository.getAll();
  }
}
