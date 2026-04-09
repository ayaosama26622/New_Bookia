import 'package:bookia/feature/home/data/models/best_seller_books_respons/product.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider.dart';
import 'package:bookia/feature/home/data/repository/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/hone_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];
  int yourActiveIndex = 0;

  Future<void> initLoadData() async {
    emit(HomeLoadingState());

    var slidersResult = await HomeRepo.getSliders();
    var bestSellerResult = await HomeRepo.getBestSellers();

    slidersResult.fold((l) => null, (r) => sliders = r.data?.sliders ?? []);

    bestSellerResult.fold(
      (l) => null,
      (r) => products = r.data?.products ?? [],
    );

    if (sliders.isEmpty && products.isEmpty) {
      emit(HomeErrorState());
    } else {
      emit(HomeSuccessState());
    }
  }

  void onChangeSlider(int index) {
    yourActiveIndex = index;
    emit(HomeSuccessState());
  }
}
