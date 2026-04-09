import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/search/data/models/serch_response/serch_response.dart';
import 'package:dartz/dartz.dart';

class SearchRepo {
  static Future<Either<Failure, SerchResponse>> searchBooks(
    String query,
  ) async {
    var response = await DioProvider.getApi(
      endpoint: Apis.search,
      queryParameters: {"name": query},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(SerchResponse.fromJson(right)),
    );
  }
}
