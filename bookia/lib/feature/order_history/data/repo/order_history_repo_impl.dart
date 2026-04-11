import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/order_history/data/data_source/order_history_remote_data_source.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/order_history_response.dart';
import 'package:bookia/feature/order_history/domain/repo/order_history_repo.dart';
import 'package:dartz/dartz.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;

  OrderHistoryRepositoryImpl(this.orderHistoryRemoteDataSource);

  @override
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory() {
    return orderHistoryRemoteDataSource.getOrderHistory();
  }
}