import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/update_password/data/models/updata_password_response/updata_password_response.dart';

class ChangePasswordRepo {
  static Future<UpdataPasswordResponse?> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updatePassword,
        data: {
          "current_password": currentPassword,
          "new_password": newPassword,
          "new_password_confirmation": newPassword,
        },
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode == 200) {
        return UpdataPasswordResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
