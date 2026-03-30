import 'dart:developer';

import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/place_order/data/models/governorate_response.dart';

class PlaceOrderRepo {
  static Future<GovernoratesResponse?> getGovernorates() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.governorates);
      if (response.statusCode == 200) {
        return GovernoratesResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> placeOrder({
    required int governorateId,
    required String name,
    required String phone,
    required String address,
    required String email,
  }) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.placeOrder,
        data: {
          "governorate_id": governorateId,
          "name": name,
          "phone": phone,
          "address": address,
          "email": email,
        },
        headers: {
          "Authorization": "Bearer ${SharedPref.getToken()}",
        },
      );
      return response.statusCode == 201;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}