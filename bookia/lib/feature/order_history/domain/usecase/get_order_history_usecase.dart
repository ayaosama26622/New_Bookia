import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/order_history_response.dart';
import 'package:bookia/feature/order_history/domain/repo/order_history_repo.dart';
import 'package:dartz/dartz.dart';

class GetOrderHistoryUseCase {
  final OrderHistoryRepository orderHistoryRepository;

  GetOrderHistoryUseCase(this.orderHistoryRepository);

  Future<Either<Failure, OrderHistoryResponse>> call() {
    return orderHistoryRepository.getOrderHistory();
  }
}