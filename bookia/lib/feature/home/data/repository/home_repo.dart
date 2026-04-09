import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/best_seller_books_respons.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider_response.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  static Future<Either<Failure, SliderResponse>> getSliders() async {
    var response = await DioProvider.getApi(endpoint: Apis.sliders);
    return response.fold(
      (l) => Left(l),
      (right) => Right(SliderResponse.fromJson(right)),
    );
  }

  static Future<Either<Failure, BestSellerBooksResponse>>
  getBestSellers() async {
    var response = await DioProvider.getApi(endpoint: Apis.productsBestseller);
    return response.fold(
      (l) => Left(l),
      (right) => Right(BestSellerBooksResponse.fromJson(right)),
    );
  }
}
