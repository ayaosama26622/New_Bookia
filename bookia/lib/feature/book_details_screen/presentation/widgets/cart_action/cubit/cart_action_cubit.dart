import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/book_details_screen/presentation/widgets/cart_action/cubit/cart_action_state.dart';
import 'package:bookia/feature/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionsInitial());

  Future<void> addToCart(int productId) async {
    emit(CartActionsLoadingState());
    var response = await getIt<AddToCartUseCase>().call(productId);
    response.fold(
      (l) {
        emit(CartActionsErrorState());
      },
      (r) {
        var products = r.data?.cartItems ?? [];
        SharedPref.cacheCartIds(products);
        emit(CartActionsSuccessState(msg: 'Added To Cart'));
      },
    );
  }

  Future<void> removeFromCart(int productId) async {
    emit(CartActionsLoadingState());
    var response = await getIt<RemoveFromCartUseCase>().call(productId);
    response.fold(
      (l) {
        emit(CartActionsErrorState());
      },
      (r) {
        var products = r.data?.cartItems ?? [];
        SharedPref.cacheCartIds(products);
        emit(CartActionsSuccessState(msg: 'Removed From Cart'));
      },
    );
  }

  bool isProductInCart(int productId) {
    var cartIds = SharedPref.getCartIds();
    return cartIds.contains(productId);
  }
}