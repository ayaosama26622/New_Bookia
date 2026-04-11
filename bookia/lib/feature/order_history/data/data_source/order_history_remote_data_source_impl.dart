import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/order_history/data/data_source/order_history_remote_data_source.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/data.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/order_history_response.dart';
import 'package:dartz/dartz.dart';

class OrderHistoryRemoteDataSourceImpl implements OrderHistoryRemoteDataSource {
  @override
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.orderHistory,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        OrderHistoryResponse(
          data: Data.fromJson(right as Map<String, dynamic>),
        ),
      ),
    );
  }
}