import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/profile/data/models/profile_response/profile_response.dart';
import 'package:bookia/feature/profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase {
  final ProfileRepository profileRepository;

  GetProfileUseCase(this.profileRepository);

  Future<Either<Failure, ProfileResponse>> call() {
    return profileRepository.getProfile();
  }
}