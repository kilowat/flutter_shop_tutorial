import 'package:either_dart/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/features/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAll();
}
