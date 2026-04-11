import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/cart/data/data_source/cart_remote_data_source.dart';
import 'package:bookia/feature/cart/data/models/cart_resonse/cart_resonse.dart';
import 'package:bookia/feature/cart/data/models/cart_resonse/data.dart';
import 'package:dartz/dartz.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  @override
  Future<Either<Failure, CartResponse>> getCart() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.cart,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        CartResponse(data: Data.fromJson(right as Map<String, dynamic>)),
      ),
    );
  }

  @override
  Future<Either<Failure, CartResponse>> addToCart(int productId) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.addToCart,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        CartResponse(data: Data.fromJson(right as Map<String, dynamic>)),
      ),
    );
  }

  @override
  Future<Either<Failure, CartResponse>> removeFromCart(int cartItemId) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.removeFromCart,
      data: {"cart_item_id": cartItemId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        CartResponse(data: Data.fromJson(right as Map<String, dynamic>)),
      ),
    );
  }

  @override
  Future<Either<Failure, CartResponse>> updateCart(int cartItemId, int quantity) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.updateCart,
      data: {"cart_item_id": cartItemId, "quantity": quantity},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        CartResponse(data: Data.fromJson(right as Map<String, dynamic>)),
      ),
    );
  }

  @override
  Future<Either<Failure, bool>> checkout() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.checkout,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => const Right(true),
    );
  }
}