import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/auth/data/models/register_paremeter.dart';
import 'package:bookia/feature/auth/data/models/auth_response/auth_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  static Future<Either<Failure, AuthResponse>> register(
    AuthParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.register,
      data: params.toJson(),
    );
    return response.fold((l) => Left(l), (right) {
      var data = AuthResponse.fromJson(right);
      SharedPref.setToken(data.token ?? '');
      SharedPref.setUserInfo(data.user);
      return Right(data);
    });
  }

  static Future<Either<Failure, AuthResponse>> login(AuthParams params) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.login,
      data: params.toJson(),
    );
    return response.fold((l) => Left(l), (right) {
      var data = AuthResponse.fromJson(right);
      SharedPref.setToken(data.token ?? '');
      SharedPref.setUserInfo(data.user);
      return Right(data);
    });
  }

  static Future<Either<Failure, AuthResponse>> forget(AuthParams params) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.forget,
      data: params.toJson(),
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(AuthResponse.fromJson(right)),
    );
  }

  static Future<Either<Failure, AuthResponse>> verifyOtp(
    AuthParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.verifyOtp,
      data: params.toJson(),
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(AuthResponse.fromJson(right)),
    );
  }

  static Future<Either<Failure, AuthResponse>> resetPassword(
    AuthParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.resetPassword,
      data: params.toJson(),
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(AuthResponse.fromJson(right)),
    );
  }
}
