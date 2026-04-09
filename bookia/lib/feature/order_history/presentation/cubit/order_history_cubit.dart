import 'package:bookia/feature/order_history/data/models/order_history_response/order.dart';
import 'package:bookia/feature/order_history/data/repo/order_history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());

  Future<void> getOrderHistory() async {
    emit(OrderHistoryLoadingState());
    var response = await OrderHistoryRepo.getOrderHistory();
    response.fold(
      (l) {
        emit(OrderHistoryErrorState(message: l.message));
      },
      (r) {
        emit(OrderHistorySuccessState(orders: r.data?.orders ?? []));
      },
    );
  }
}
