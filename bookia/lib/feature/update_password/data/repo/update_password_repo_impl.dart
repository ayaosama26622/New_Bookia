import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/update_password/data/data_source/update_password_remote_data_source.dart';
import 'package:bookia/feature/update_password/data/models/updata_password_response/updata_password_response.dart';
import 'package:bookia/feature/update_password/domain/repo/update_password_repo.dart';
import 'package:dartz/dartz.dart';

class UpdatePasswordRepositoryImpl implements UpdatePasswordRepository {
  final UpdatePasswordRemoteDataSource updatePasswordRemoteDataSource;

  UpdatePasswordRepositoryImpl(this.updatePasswordRemoteDataSource);

  @override
  Future<Either<Failure, UpdataPasswordResponse>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    return updatePasswordRemoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}