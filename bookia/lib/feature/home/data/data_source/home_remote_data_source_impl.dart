import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/data.dart';
import 'package:bookia/feature/home/data/models/slider_response/data.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override

  Future<Either<Failure, SliderResponse>> getSliders() async {
    var response = await DioProvider.getApi(endpoint: Apis.sliders);

    return response.fold((l) => Left(l), (right) {
      return Right(SliderResponse.fromJson(right));
    });
  }

  @override

  Future<Either<Failure, BestSellerBooksResponse>> getBestSellers() async {
    var response = await DioProvider.getApi(endpoint: Apis.productsBestseller);

    return response.fold((l) => Left(l), (right) {
      return Right(BestSellerBooksResponse.fromJson(right));
    });
  }
}