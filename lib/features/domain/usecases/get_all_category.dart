import 'package:either_dart/src/either.dart';
import 'package:flippy/core/errors/failure.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/entities/category_entity.dart';
import 'package:flippy/features/domain/repositories/category_repository.dart';

class GetAllCategory implements UseCase<List<CategoryEntity>, EmptyParams> {
  final CategoryRepository repository;

  GetAllCategory(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(EmptyParams params) async {
    return await repository.getAll();
  }
}
