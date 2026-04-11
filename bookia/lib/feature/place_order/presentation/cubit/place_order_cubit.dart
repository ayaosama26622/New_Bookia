import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/feature/place_order/data/models/governorate.dart';
import 'package:bookia/feature/place_order/domain/usecase/get_governorates_usecase.dart';
import 'package:bookia/feature/place_order/domain/usecase/place_order_usecase.dart';
import 'package:bookia/feature/place_order/presentation/cubit/place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var response = await getIt<GetGovernoratesUseCase>().call();
    response.fold(
      (l) => emit(GovernoratesErrorState()),
      (r) {
        governorates = r.data ?? [];
        emit(GovernoratesSuccessState());
      },
    );
  }

  Future<void> placeOrder({
    required int governorateId,
    required String name,
    required String phone,
    required String address,
    required String email,
  }) async {
    emit(PlaceOrderLoadingState());
    var response = await getIt<PlaceOrderUseCase>().call(
      governorateId: governorateId,
      name: name,
      phone: phone,
      address: address,
      email: email,
    );
    response.fold(
      (l) => emit(PlaceOrderErrorState(message: l.message)),
      (r) => emit(PlaceOrderSuccessState()),
    );
  }
}