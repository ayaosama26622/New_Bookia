import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/update_profile/data/models/updataprofile_reposen/updataprofile_reposen.dart';
import 'package:bookia/feature/update_profile/domain/repo/update_profile_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase {
  final UpdateProfileRepository updateProfileRepository;

  UpdateProfileUseCase(this.updateProfileRepository);

  Future<Either<Failure, UpdataprofileReposen>> call({
    required String name,
    required String phone,
    required String address,
  }) {
    return updateProfileRepository.updateProfile(
      name: name,
      phone: phone,
      address: address,
    );
  }
}