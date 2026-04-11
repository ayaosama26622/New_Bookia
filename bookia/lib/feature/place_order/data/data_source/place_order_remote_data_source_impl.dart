import 'package:bookia/core/service/dio/apis.dart';
import 'package:bookia/core/service/dio/dio_provider.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/feature/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/feature/place_order/data/models/governorate.dart';
import 'package:bookia/feature/place_order/data/models/governorate_response.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRemoteDataSourceImpl implements PlaceOrderRemoteDataSource {
  @override
  Future<Either<Failure, GovernoratesResponse>> getGovernorates() async {
    var response = await DioProvider.getApi(endpoint: Apis.governorates);
    return response.fold(
      (l) => Left(l),
      (right) => Right(
        GovernoratesResponse(
          data: (right as List<dynamic>)
              .map((e) => Governorate.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, bool>> placeOrder({
    required int governorateId,
    required String name,
    required String phone,
    required String address,
    required String email,
  }) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.placeOrder,
      data: {
        "governorate_id": governorateId,
        "name": name,
        "phone": phone,
        "address": address,
        "email": email,
      },
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (right) => const Right(true),
    );
  }
}