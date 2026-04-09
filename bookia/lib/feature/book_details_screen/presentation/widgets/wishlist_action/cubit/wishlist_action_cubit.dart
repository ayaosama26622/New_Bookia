import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/book_details_screen/presentation/widgets/wishlist_action/cubit/wishlist_action_state.dart';
import 'package:bookia/feature/wishlist/data/repository/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionsInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await WishlistRepo.addToWishlist(productId);
    response.fold((l) => emit(WishlistActionsErrorState()), (r) {
      var products = r.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistActionsSuccessState(msg: 'Added To Wishlist'));
    });
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await WishlistRepo.removeFromWishlist(productId);
    response.fold((l) => emit(WishlistActionsErrorState()), (r) {
      var products = r.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistActionsSuccessState(msg: 'Removed From Wishlist'));
    });
  }

  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}
