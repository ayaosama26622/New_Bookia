import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/update_password/data/models/updata_password_response/updata_password_response.dart';
import 'package:bookia/feature/update_password/domain/repo/update_password_repo.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final UpdatePasswordRepository updatePasswordRepository;

  ChangePasswordUseCase(this.updatePasswordRepository);

  Future<Either<Failure, UpdataPasswordResponse>> call({
    required String currentPassword,
    required String newPassword,
  }) {
    return updatePasswordRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}