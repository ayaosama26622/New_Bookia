import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/cart/data/models/cart_resonse/cart_resonse.dart';
import 'package:dartz/dartz.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, CartResponse>> getCart();
  Future<Either<Failure, CartResponse>> addToCart(int productId);
  Future<Either<Failure, CartResponse>> removeFromCart(int cartItemId);
  Future<Either<Failure, CartResponse>> updateCart(int cartItemId, int quantity);
  Future<Either<Failure, bool>> checkout();
}