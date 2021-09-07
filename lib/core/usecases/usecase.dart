import 'package:either_dart/either.dart';
import 'package:flippy/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class EmptyParams {}
