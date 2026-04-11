import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/place_order/domain/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderUseCase {
  final PlaceOrderRepository placeOrderRepository;

  PlaceOrderUseCase(this.placeOrderRepository);

  Future<Either<Failure, bool>> call({
    required int governorateId,
    required String name,
    required String phone,
    required String address,
    required String email,
  }) {
    return placeOrderRepository.placeOrder(
      governorateId: governorateId,
      name: name,
      phone: phone,
      address: address,
      email: email,
    );
  }
}