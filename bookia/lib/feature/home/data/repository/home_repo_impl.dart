import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/data.dart';
import 'package:bookia/feature/home/data/models/slider_response/data.dart';
import 'package:bookia/feature/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, SliderResponse>> getSliders() {
    return homeRemoteDataSource.getSliders();
  }

  @override
  Future<Either<Failure, BestSellerBooksResponse>> getBestSellers() {
    return homeRemoteDataSource.getBestSellers();
  }
}