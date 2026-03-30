import 'dart:developer';

import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/auth/data/models/register_paremeter.dart';
import 'package:bookia/feature/auth/data/models/register_response/auth_response.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Future<AuthResponse?> register(RegisterParemeter params) async {
    try {
      log(params.toString().toString());
      var response = await DioProvider.post(
        endpoint: Apis.register,
        data: params.toJson(),
      );

      if (response.statusCode == 201) {
        var data = AuthResponse.fromJson(response.data);
          SharedPref.setToken(data.data?.token ?? '');
          SharedPref.setUserInfo(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(RegisterParemeter params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.login,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        var data = AuthResponse.fromJson(response.data);
          SharedPref.setToken(data.data?.token ?? '');
          SharedPref.setUserInfo(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forget(RegisterParemeter params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.forget,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> verifyOtp(RegisterParemeter params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.verifyOtp,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }

  // 🔵 Reset Password
  static Future<AuthResponse?> resetPassword(RegisterParemeter params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.resetPassword,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
