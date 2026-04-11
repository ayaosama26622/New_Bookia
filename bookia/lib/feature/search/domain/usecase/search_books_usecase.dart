import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/search/data/models/serch_response/serch_response.dart';
import 'package:bookia/feature/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase {
  final SearchRepository searchRepository;

  SearchBooksUseCase(this.searchRepository);

  Future<Either<Failure, SerchResponse>> call(String query) {
    return searchRepository.searchBooks(query);
  }
}