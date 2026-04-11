import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/profile/data/models/profile_response/profile_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponse>> getProfile();
}