import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/update_profile/data/models/updataprofile_reposen/updataprofile_reposen.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateProfileRepository {
  Future<Either<Failure, UpdataprofileReposen>> updateProfile({
    required String name,
    required String phone,
    required String address,
  });
}