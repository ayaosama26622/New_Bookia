part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<Product> products;
  SearchSuccessState({required this.products});
}

class SearchErrorState extends SearchState {}
