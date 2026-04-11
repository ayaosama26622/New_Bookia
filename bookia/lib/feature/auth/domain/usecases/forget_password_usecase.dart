import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/feature/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase {
  final AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);

  Future<Either<Failure, AuthResponse>> call(String email) {
    return authRepository.forgetPassword(email);
  }
}