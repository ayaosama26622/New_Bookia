import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/feature/auth/data/models/register_paremeter.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register(AuthParams params);
  Future<Either<Failure, AuthResponse>> login(AuthParams params);
  Future<Either<Failure, AuthResponse>> forgetPassword(String email);
  Future<Either<Failure, AuthResponse>> verifyOtp(String otp);
  Future<Either<Failure, AuthResponse>> resetPassword(AuthParams params);
}