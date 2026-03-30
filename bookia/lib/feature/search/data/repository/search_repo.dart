import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/feature/search/data/models/serch_response/serch_response.dart';

class SearchRepo {
  static Future<SerchResponse?> searchBooks(String query) async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.search,
        queryParameters: {"name": query},
      );

      if (response.statusCode == 200) {
        return SerchResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(">>> Error: $e");
      return null;
    }
  }
}
