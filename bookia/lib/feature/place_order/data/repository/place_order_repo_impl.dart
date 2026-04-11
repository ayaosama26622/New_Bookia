import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/feature/place_order/data/models/governorate_response.dart';
import 'package:bookia/feature/place_order/domain/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRepositoryImpl implements PlaceOrderRepository {
  final PlaceOrderRemoteDataSource placeOrderRemoteDataSource;

  PlaceOrderRepositoryImpl(this.placeOrderRemoteDataSource);

  @override
  Future<Either<Failure, GovernoratesResponse>> getGovernorates() {
    return placeOrderRemoteDataSource.getGovernorates();
  }

  @override
  Future<Either<Failure, bool>> placeOrder({
    required int governorateId,
    required String name,
    required String phone,
    required String address,
    required String email,
  }) {
    return placeOrderRemoteDataSource.placeOrder(
      governorateId: governorateId,
      name: name,
      phone: phone,
      address: address,
      email: email,
    );
  }
}