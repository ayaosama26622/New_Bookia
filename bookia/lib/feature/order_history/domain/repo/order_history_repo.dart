import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/order_history_response.dart';
import 'package:dartz/dartz.dart';

abstract class OrderHistoryRepository {
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory();
}