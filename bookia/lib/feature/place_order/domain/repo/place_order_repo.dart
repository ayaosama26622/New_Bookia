import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/place_order/data/models/governorate_response.dart';
import 'package:dartz/dartz.dart';

abstract class PlaceOrderRepository {
  Future<Either<Failure, GovernoratesResponse>> getGovernorates();
  Future<Either<Failure, bool>> placeOrder({
    required int governorateId,
    required String name,
    required String phone,
    required String address,
    required String email,
  });
}