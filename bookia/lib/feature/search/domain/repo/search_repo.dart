import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/search/data/models/serch_response/serch_response.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, SerchResponse>> searchBooks(String query);
}