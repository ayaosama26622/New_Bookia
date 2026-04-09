import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/update_password/data/models/updata_password_response/updata_password_response.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordRepo {
  static Future<Either<Failure, UpdataPasswordResponse>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.updatePassword,
      data: {
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password_confirmation": newPassword,
      },
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(UpdataPasswordResponse.fromJson(right)),
    );
  }
}
