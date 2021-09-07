import 'package:either_dart/src/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/features/data/datasources/category_remote_data_source.dart';
import 'package:flippy/features/domain/entities/category_entity.dart';
import 'package:flippy/features/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource dataSource;

  CategoryRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAll() async {
    final remotePerson = await dataSource.getAll();
    return Right(remotePerson);
  }
}
