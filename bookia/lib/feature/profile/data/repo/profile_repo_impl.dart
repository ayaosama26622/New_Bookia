import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookia/feature/profile/data/models/profile_response/profile_response.dart';
import 'package:bookia/feature/profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() {
    return profileRemoteDataSource.getProfile();
  }
}