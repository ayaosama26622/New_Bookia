import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/order_history_response.dart';

class OrderHistoryRepo {
  static Future<OrderHistoryResponse?> getOrderHistory() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.orderHistory,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      print("Order History Response: ${response.data}");
      print("Status Code: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        return OrderHistoryResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Order History Error: $e");
      return null;
    }
  }
}