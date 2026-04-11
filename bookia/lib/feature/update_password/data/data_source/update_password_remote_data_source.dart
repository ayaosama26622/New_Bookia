import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/update_password/data/models/updata_password_response/updata_password_response.dart';
import 'package:dartz/dartz.dart';

abstract class UpdatePasswordRemoteDataSource {
  Future<Either<Failure, UpdataPasswordResponse>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}