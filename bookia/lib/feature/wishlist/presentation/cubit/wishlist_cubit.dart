import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/product.dart';
import 'package:bookia/feature/wishlist/data/repository/wishlist_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  List<Product> products = [];

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var response = await WishlistRepo.getWishlist();
    response.fold((l) => emit(WishlistErrorState()), (r) {
      products = r.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistSuccessState());
    });
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistLoadingState());
    var response = await WishlistRepo.removeFromWishlist(productId);
    response.fold((l) => emit(WishlistErrorState()), (r) {
      products = r.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistSuccessState());
    });
  }
}
