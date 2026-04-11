import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/product.dart';
import 'package:bookia/feature/search/domain/usecase/search_books_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoadingState());
    var response = await getIt<SearchBooksUseCase>().call(query);
    response.fold(
      (l) => emit(SearchErrorState()),
      (r) => emit(SearchSuccessState(products: r.data?.products ?? <Product>[])),
    );
  }
}