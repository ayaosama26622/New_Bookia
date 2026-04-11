import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/data.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/product.dart';
import 'package:bookia/feature/home/data/models/slider_response/data.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider.dart';
import 'package:bookia/feature/home/domain/usecases/get_best_sellers_usecase.dart';
import 'package:bookia/feature/home/domain/usecases/get_sliders_usecase.dart';
import 'package:bookia/feature/home/presentation/cubit/hone_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];

  int yourActiveIndex = 0;

  Future<void> initLoadData() async {
    emit(HomeLoadingState());

    var responses = await Future.wait([
      getIt<GetSlidersUseCase>().call(),
      getIt<GetBestSellersUseCase>().call(),
    ]);

    final slidersResult = responses[0] as Either<Failure, SliderResponse>;
    final bestSellerResult =
        responses[1] as Either<Failure, BestSellerBooksResponse>;

    slidersResult.fold((l) => emit(HomeErrorState()), (r) {
      sliders = r.sliders ?? [];
    });

    bestSellerResult.fold((l) => emit(HomeErrorState()), (r) {
      products = r.products ?? [];
    });

    if (state is! HomeErrorState) {
      emit(HomeSuccessState());
    }
  }

  void onChangeSlider(int index) {
    yourActiveIndex = index;
    emit(HomeSuccessState());
  }
}