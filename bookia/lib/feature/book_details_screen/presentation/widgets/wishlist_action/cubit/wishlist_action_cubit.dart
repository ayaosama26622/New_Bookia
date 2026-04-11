import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/book_details_screen/presentation/widgets/wishlist_action/cubit/wishlist_action_state.dart';
import 'package:bookia/feature/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import 'package:bookia/feature/wishlist/domain/usecase/remove_from_wishlist_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionsInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await getIt<AddToWishlistUseCase>().call(productId);
    response.fold(
      (l) => emit(WishlistActionsErrorState()),
      (r) {
        var products = r.data?.products ?? [];
        SharedPref.cacheWishlistIds(products);
        emit(WishlistActionsSuccessState(msg: 'Added To Wishlist'));
      },
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await getIt<RemoveFromWishlistUseCase>().call(productId);
    response.fold(
      (l) => emit(WishlistActionsErrorState()),
      (r) {
        var products = r.data?.products ?? [];
        SharedPref.cacheWishlistIds(products);
        emit(WishlistActionsSuccessState(msg: 'Removed From Wishlist'));
      },
    );
  }

  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}