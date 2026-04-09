import 'package:bookia/feature/place_order/data/models/governorate.dart';
import 'package:bookia/feature/place_order/data/repository/place_order_repo.dart';
import 'package:bookia/feature/place_order/presentation/cubit/place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var response = await PlaceOrderRepo.getGovernorates();
    response.fold(
      (l) {
        emit(GovernoratesErrorState());
      },
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
    var response = await PlaceOrderRepo.placeOrder(
      governorateId: governorateId,
      name: name,
      phone: phone,
      address: address,
      email: email,
    );
    response.fold(
      (l) {
        emit(PlaceOrderErrorState(message: l.message));
      },
      (r) {
        emit(PlaceOrderSuccessState());
      },
    );
  }
}
