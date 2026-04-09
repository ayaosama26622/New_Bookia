part of 'order_history_cubit.dart';

abstract class OrderHistoryState {}

class OrderHistoryInitial extends OrderHistoryState {}

class OrderHistoryLoadingState extends OrderHistoryState {}

class OrderHistorySuccessState extends OrderHistoryState {
  final List<Order> orders;
  OrderHistorySuccessState({required this.orders});
}

class OrderHistoryErrorState extends OrderHistoryState {
  final String message;
  OrderHistoryErrorState({required this.message});
}
