import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookia/feature/profile/data/models/profile_response/data.dart';
import 'package:bookia/feature/profile/data/models/profile_response/profile_response.dart';
import 'package:dartz/dartz.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.getUserProfile,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        ProfileResponse(data: Data.fromJson(right as Map<String, dynamic>)),
      ),
    );
  }
}