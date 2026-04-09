import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/cart/data/models/cart_resonse/cart_item.dart';
import 'package:bookia/feature/cart/data/repository/cart_repo.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItem> products = [];
  String total = '';

  Future<void> getCart() async {
    emit(CartLoadingState());
    var response = await CartRepo.getCart();
    response.fold(
      (l) {
        emit(CartErrorState());
      },
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
    var response = await CartRepo.removeFromCart(cartItemId);
    response.fold(
      (l) {
        emit(CartErrorState());
      },
      (r) {
        products = r.data?.cartItems ?? [];
        total = r.data?.total ?? '';
        SharedPref.cacheCartIds(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    var response = await CartRepo.updateCart(cartItemId, quantity);
    response.fold(
      (l) {
        emit(CartErrorState());
      },
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
    var response = await CartRepo.checkout();
    response.fold(
      (l) {
        emit(CheckoutErrorState());
      },
      (r) {
        emit(CheckoutSuccessState());
      },
    );
  }
}
