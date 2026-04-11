import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/home/data/models/slider_response/data.dart';
import 'package:bookia/feature/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetSlidersUseCase {
  final HomeRepository homeRepository;

  GetSlidersUseCase(this.homeRepository);

  Future<Either<Failure, SliderResponse>> call() {
    return homeRepository.getSliders();
  }
}