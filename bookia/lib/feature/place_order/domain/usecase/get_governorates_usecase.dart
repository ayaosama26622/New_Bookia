import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/place_order/data/models/governorate_response.dart';
import 'package:bookia/feature/place_order/domain/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class GetGovernoratesUseCase {
  final PlaceOrderRepository placeOrderRepository;

  GetGovernoratesUseCase(this.placeOrderRepository);

  Future<Either<Failure, GovernoratesResponse>> call() {
    return placeOrderRepository.getGovernorates();
  }
}