import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/cart/data/models/cart_resonse/cart_item.dart';
import 'package:bookia/feature/cart/domain/usecases/checkout_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/get_cart_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/update_cart_usecase.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItem> products = [];
  String total = '';

  Future<void> getCart() async {
    emit(CartLoadingState());
    var response = await getIt<GetCartUseCase>().call();
    response.fold(
      (l) => emit(CartErrorState()),
      (r) {
        products = r.data?.cartItems ?? [];
        total = r.data?.total ?? '';
        SharedPref.cacheCartIds(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    var response = await getIt<RemoveFromCartUseCase>().call(cartItemId);
    response.fold(
      (l) => emit(CartErrorState()),
      (r) {
        products = r.data?.cartItems ?? [];
        total = r.data?.total ?? '';
        SharedPref.cacheCartIds(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    var response = await getIt<UpdateCartUseCase>().call(cartItemId, quantity);
    response.fold(
      (l) => emit(CartErrorState()),
      (r) {
        products = r.data?.cartItems ?? [];
        total = r.data?.total ?? '';
        SharedPref.cacheCartIds(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var response = await getIt<CheckoutUseCase>().call();
    response.fold(
      (l) => emit(CheckoutErrorState()),
      (r) => emit(CheckoutSuccessState()),
    );
  }
}