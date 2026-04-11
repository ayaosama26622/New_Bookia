import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/cart/data/data_source/cart_remote_data_source.dart';
import 'package:bookia/feature/cart/data/models/cart_resonse/cart_resonse.dart';
import 'package:bookia/feature/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl(this.cartRemoteDataSource);

  @override
  Future<Either<Failure, CartResponse>> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failure, CartResponse>> addToCart(int productId) {
    return cartRemoteDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failure, CartResponse>> removeFromCart(int cartItemId) {
    return cartRemoteDataSource.removeFromCart(cartItemId);
  }

  @override
  Future<Either<Failure, CartResponse>> updateCart(int cartItemId, int quantity) {
    return cartRemoteDataSource.updateCart(cartItemId, quantity);
  }

  @override
  Future<Either<Failure, bool>> checkout() {
    return cartRemoteDataSource.checkout();
  }
}