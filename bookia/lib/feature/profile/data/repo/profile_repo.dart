import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/profile/data/models/profile_response/profile_response.dart';

class ProfileRepo {
  static Future<ProfileResponse?> getProfile() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.getUserProfile,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
