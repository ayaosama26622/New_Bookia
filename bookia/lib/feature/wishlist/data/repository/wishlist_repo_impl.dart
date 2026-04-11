import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:bookia/feature/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:bookia/feature/wishlist/domain/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistRepositoryImpl(this.wishlistRemoteDataSource);

  @override
  Future<Either<Failure, WishlistResponse>> getWishlist() {
    return wishlistRemoteDataSource.getWishlist();
  }

  @override
  Future<Either<Failure, WishlistResponse>> addToWishlist(int productId) {
    return wishlistRemoteDataSource.addToWishlist(productId);
  }

  @override
  Future<Either<Failure, WishlistResponse>> removeFromWishlist(int productId) {
    return wishlistRemoteDataSource.removeFromWishlist(productId);
  }
}