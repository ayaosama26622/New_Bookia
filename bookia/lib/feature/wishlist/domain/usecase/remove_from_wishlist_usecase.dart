import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:bookia/feature/wishlist/domain/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class RemoveFromWishlistUseCase {
  final WishlistRepository wishlistRepository;

  RemoveFromWishlistUseCase(this.wishlistRepository);

  Future<Either<Failure, WishlistResponse>> call(int productId) {
    return wishlistRepository.removeFromWishlist(productId);
  }
}