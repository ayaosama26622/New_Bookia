import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/feature/auth/data/models/register_paremeter.dart';
import 'package:bookia/feature/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);
  Future<Either<Failure, AuthResponse>> call(AuthParams params) {
    return authRepository.login(params);
  }
}