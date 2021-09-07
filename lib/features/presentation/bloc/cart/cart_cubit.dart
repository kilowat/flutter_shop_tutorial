import 'package:flippy/core/mixins/map_failure_massage.dart';
import 'package:flippy/core/usecases/usecase.dart';
import 'package:flippy/features/domain/entities/cart_entity.dart';
import 'package:flippy/features/domain/usecases/add_to_cart.dart';
import 'package:flippy/features/domain/usecases/get_cart.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> with MapFailureToMassage {
  final GetCart _getCart;
  final AddToCart _addToCart;
  CartEntity _cartEntity = CartEntity(sum: 0.0, count: 0, products: []);

  CartCubit({required getCart, required addToCart})
      : this._getCart = getCart,
        this._addToCart = addToCart,
        super(
          CartEmptyState(),
        );

  CartEntity get cartEntity => _cartEntity;

  void load() async {
    if (state is CartLoadingState) {
      return;
    }

    emit(CartLoadingState());

    final resultOrFail = await _getCart(EmptyParams());
    resultOrFail.fold(
      (error) {
        emit(CartErrorState(
          message: mapFailureToMassage(error),
        ));
      },
      (cartEntity) {
        _cartEntity = cartEntity;
        emit(CartLoadedState(cartEntity: cartEntity));
      },
    );
  }

  void add(int id) async {
    if (state is CartLoadingState) {
      return;
    }

    emit(CartLoadingState());

    final resultOrFail = await _addToCart(id);
    resultOrFail.fold(
      (error) {
        emit(
          CartErrorState(message: mapFailureToMassage(error)),
        );
      },
      (cartEntity) {
        _cartEntity = cartEntity;
        emit(CartLoadedState(cartEntity: cartEntity, isAdded: true));
      },
    );
  }
}
