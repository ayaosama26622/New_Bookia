
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/data.dart';
import 'package:bookia/feature/home/data/models/slider_response/data.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, SliderResponse>> getSliders();
  Future<Either<Failure, BestSellerBooksResponse>> getBestSellers();
}