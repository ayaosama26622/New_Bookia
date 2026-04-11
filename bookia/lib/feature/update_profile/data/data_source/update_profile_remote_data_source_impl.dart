import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/update_profile/data/data_source/update_profile_remote_data_source.dart';
import 'package:bookia/feature/update_profile/data/models/updataprofile_reposen/data.dart';
import 'package:bookia/feature/update_profile/data/models/updataprofile_reposen/updataprofile_reposen.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileRemoteDataSourceImpl implements UpdateProfileRemoteDataSource {
  @override
  Future<Either<Failure, UpdataprofileReposen>> updateProfile({
    required String name,
    required String phone,
    required String address,
  }) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.updateProfile,
      data: {"name": name, "phone": phone, "address": address},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        UpdataprofileReposen(
          data: Data.fromJson(right as Map<String, dynamic>),
        ),
      ),
    );
  }
}