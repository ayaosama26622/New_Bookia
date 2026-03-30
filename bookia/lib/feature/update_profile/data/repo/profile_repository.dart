import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/update_profile/data/models/updataprofile_reposen/updataprofile_reposen.dart';

class UpdateProfileRepo {
  static Future<UpdataprofileReposen?> updateProfile({
    required String name,
    required String phone,
    required String address,
  }) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updateProfile,
        data: {"name": name, "phone": phone, "address": address},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode == 200) {
        return UpdataprofileReposen.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
