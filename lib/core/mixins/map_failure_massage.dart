import 'package:flippy/core/errors/failure.dart';

mixin MapFailureToMassage {
  String mapFailureToMassage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server failure';
      default:
        return 'Unexpected error';
    }
  }
}
