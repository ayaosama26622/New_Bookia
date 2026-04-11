import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/update_profile/data/data_source/update_profile_remote_data_source.dart';
import 'package:bookia/feature/update_profile/data/models/updataprofile_reposen/updataprofile_reposen.dart';
import 'package:bookia/feature/update_profile/domain/repo/update_profile_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileRemoteDataSource updateProfileRemoteDataSource;

  UpdateProfileRepositoryImpl(this.updateProfileRemoteDataSource);

  @override
  Future<Either<Failure, UpdataprofileReposen>> updateProfile({
    required String name,
    required String phone,
    required String address,
  }) {
    return updateProfileRemoteDataSource.updateProfile(
      name: name,
      phone: phone,
      address: address,
    );
  }
}