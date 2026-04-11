import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/search/data/data_source/search_remote_data_source.dart';
import 'package:bookia/feature/search/data/models/serch_response/serch_response.dart';
import 'package:bookia/feature/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, SerchResponse>> searchBooks(String query) {
    return searchRemoteDataSource.searchBooks(query);
  }
}