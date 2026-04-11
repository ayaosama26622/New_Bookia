import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/feature/order_history/domain/usecase/get_order_history_usecase.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());

  Future<void> getOrderHistory() async {
    emit(OrderHistoryLoadingState());
    var response = await getIt<GetOrderHistoryUseCase>().call();
    response.fold(
      (l) => emit(OrderHistoryErrorState(message: l.message)),
      (r) => emit(OrderHistorySuccessState(orders: r.data?.orders ?? [])),
    );
  }
}