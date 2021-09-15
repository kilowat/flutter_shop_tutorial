import 'package:flippy/core/mixins/map_failure_massage.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/usecases/product/product_get_all.dart';
import 'package:flippy/features/presentation/bloc/product/product_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListCubit extends Cubit<ProductListState>
    with MapFailureToMassage {
  final ProductGetAll _getAll;

  ProductListCubit({
    required getAll,
  })  : this._getAll = getAll,
        super(ProductListEmptyState());

  void load() async {
    if (state is ProductListLoadingState) return;

    emit(ProductListLoadingState());

    final productListOrFailure = await this._getAll(EmptyParams());
    productListOrFailure.fold(
      (failure) => emit(ProductListErrorState(mapFailureToMassage(failure))),
      (productList) => emit(ProductListLoadedState(productList: productList)),
    );
  }
}
