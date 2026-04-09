class PlaceOrderState {}

class PlaceOrderInitial extends PlaceOrderState {}

class GovernoratesLoadingState extends PlaceOrderState {}

class GovernoratesSuccessState extends PlaceOrderState {}

class GovernoratesErrorState extends PlaceOrderState {}

class PlaceOrderLoadingState extends PlaceOrderState {}

class PlaceOrderSuccessState extends PlaceOrderState {}

class PlaceOrderErrorState extends PlaceOrderState {
  final String message;
  PlaceOrderErrorState({required this.message});
}
