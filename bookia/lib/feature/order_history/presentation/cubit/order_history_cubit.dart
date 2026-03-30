import 'package:bookia/feature/order_history/data/models/order_history_response/order.dart';
import 'package:bookia/feature/order_history/data/repo/order_history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());

  Future<void> getOrderHistory() async {
    emit(OrderHistoryLoadingState());

    try {
      var data = await OrderHistoryRepo.getOrderHistory();

      if (data != null && data.status == 200) {
        emit(OrderHistorySuccessState(orders: data.data?.orders ?? []));
      } else {
        emit(OrderHistoryErrorState(
          message: data?.message ?? "Something went wrong",
        ));
      }
    } catch (e) {
      emit(OrderHistoryErrorState(message: e.toString()));
    }
  }
}