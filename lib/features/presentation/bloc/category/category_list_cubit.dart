import 'package:flippy/core/mixins/map_failure_massage.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/usecases/category/get_all_category.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListCubit extends Cubit<CategoryState> with MapFailureToMassage {
  final GetAllCategory getAllCategory;
  CategoryListCubit({required this.getAllCategory})
      : super(CategoryEmptyState());

  void load() async {
    if (state is CategoryLoadingState) {
      return;
    }

    emit(CategoryLoadingState());
    final categoriesOrFail = await getAllCategory(EmptyParams());
    categoriesOrFail.fold(
        (error) => CategoryErrorState(message: mapFailureToMassage(error)),
        _categoriesMap);
  }

  void _categoriesMap(categories) {
    emit(CategoryLoadedState(categories));
  }
}
