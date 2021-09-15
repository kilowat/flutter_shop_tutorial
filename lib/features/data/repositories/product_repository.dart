import 'package:either_dart/either.dart';
import 'package:flippy/core/errors/exception.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/features/data/datasources/product_remote_data_source.dart';
import 'package:flippy/features/domain/entities/product_entity.dart';
import 'package:flippy/features/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSourceImpl dataSource;

  ProductRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    try {
      final productList = await dataSource.getAll();
      return Right(productList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getRandom(
      [int count = 5]) async {
    try {
      final productList = await dataSource.getRandom(count);
      return Right(productList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
