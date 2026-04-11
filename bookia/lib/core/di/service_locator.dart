import 'package:bookia/feature/auth/data/data_source/auth_remote_data_sorce.dart';
import 'package:bookia/feature/auth/data/data_source/remote_data_source.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:bookia/feature/auth/domain/repository/auth_repo.dart';
import 'package:bookia/feature/auth/domain/usecases/forget_password_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/register_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/resete_password_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/cart/data/data_source/cart_remote_data_source.dart';
import 'package:bookia/feature/cart/data/data_source/cart_remote_data_source_impl.dart';
import 'package:bookia/feature/cart/data/repository/cart_repo_impl.dart';
import 'package:bookia/feature/cart/domain/repository/cart_repo.dart';
import 'package:bookia/feature/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/checkout_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/get_cart_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:bookia/feature/cart/domain/usecases/update_cart_usecase.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/feature/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:bookia/feature/home/data/repository/home_repo_impl.dart';
import 'package:bookia/feature/home/domain/repository/home_repo.dart';
import 'package:bookia/feature/home/domain/usecases/get_best_sellers_usecase.dart';
import 'package:bookia/feature/home/domain/usecases/get_sliders_usecase.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/order_history/data/data_source/order_history_remote_data_source.dart';
import 'package:bookia/feature/order_history/data/data_source/order_history_remote_data_source_impl.dart';
import 'package:bookia/feature/order_history/data/repo/order_history_repo_impl.dart';
import 'package:bookia/feature/order_history/domain/repo/order_history_repo.dart';
import 'package:bookia/feature/order_history/domain/usecase/get_order_history_usecase.dart';
import 'package:bookia/feature/order_history/presentation/cubit/order_history_cubit.dart';
import 'package:bookia/feature/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/feature/place_order/data/data_source/place_order_remote_data_source_impl.dart';
import 'package:bookia/feature/place_order/data/repository/place_order_repo_impl.dart';
import 'package:bookia/feature/place_order/domain/repo/place_order_repo.dart';
import 'package:bookia/feature/place_order/domain/usecase/get_governorates_usecase.dart';
import 'package:bookia/feature/place_order/domain/usecase/place_order_usecase.dart';
import 'package:bookia/feature/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:bookia/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookia/feature/profile/data/data_source/profile_remote_data_source_impl.dart';
import 'package:bookia/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:bookia/feature/profile/domain/repo/profile_repo.dart';
import 'package:bookia/feature/profile/domain/usecase/get_profile_usecase.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/search/data/data_source/search_remote_data_source.dart';
import 'package:bookia/feature/search/data/data_source/search_remote_data_source_impl.dart';
import 'package:bookia/feature/search/data/repository/search_repo_impl.dart';
import 'package:bookia/feature/search/domain/repo/search_repo.dart';
import 'package:bookia/feature/search/domain/usecase/search_books_usecase.dart';
import 'package:bookia/feature/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/feature/update_password/data/data_source/update_password_remote_data_source.dart';
import 'package:bookia/feature/update_password/data/data_source/update_password_remote_data_source_impl.dart';
import 'package:bookia/feature/update_password/data/repo/update_password_repo_impl.dart';
import 'package:bookia/feature/update_password/domain/repo/update_password_repo.dart';
import 'package:bookia/feature/update_password/domain/usecase/change_password_usecase.dart';
import 'package:bookia/feature/update_password/presentation/cubit/updada_password_cubit.dart';
import 'package:bookia/feature/update_profile/data/data_source/update_profile_remote_data_source.dart';
import 'package:bookia/feature/update_profile/data/data_source/update_profile_remote_data_source_impl.dart';
import 'package:bookia/feature/update_profile/data/repo/update_profile_repo_impl.dart';
import 'package:bookia/feature/update_profile/domain/repo/update_profile_repo.dart';
import 'package:bookia/feature/update_profile/domain/usecase/update_profile_usecase.dart';
import 'package:bookia/feature/update_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:bookia/feature/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:bookia/feature/wishlist/data/data_source/wishlist_remote_data_source_impl.dart';
import 'package:bookia/feature/wishlist/data/repository/wishlist_repo_impl.dart';
import 'package:bookia/feature/wishlist/domain/repo/wishlist_repo.dart';
import 'package:bookia/feature/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import 'package:bookia/feature/wishlist/domain/usecase/get_wishlist_usecase.dart';
import 'package:bookia/feature/wishlist/domain/usecase/remove_from_wishlist_usecase.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton<ForgetPasswordUseCase>(
    () => ForgetPasswordUseCase(getIt()),
  );
  getIt.registerLazySingleton<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(getIt()),
  );
  getIt.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(getIt()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: getIt(),
      registerUseCase: getIt(),
      forgetPasswordUseCase: getIt(),
      verifyOtpUseCase: getIt(),
      resetPasswordUseCase: getIt(),
    ),
  );

  // Home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<GetSlidersUseCase>(
    () => GetSlidersUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetBestSellersUseCase>(
    () => GetBestSellersUseCase(getIt()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  // Cart
  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<GetCartUseCase>(() => GetCartUseCase(getIt()));
  getIt.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateCartUseCase>(
    () => UpdateCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<CheckoutUseCase>(
    () => CheckoutUseCase(getIt()),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit());

  // Order History
  getIt.registerLazySingleton<OrderHistoryRemoteDataSource>(
    () => OrderHistoryRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<OrderHistoryRepository>(
    () => OrderHistoryRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<GetOrderHistoryUseCase>(
    () => GetOrderHistoryUseCase(getIt()),
  );
  getIt.registerFactory<OrderHistoryCubit>(() => OrderHistoryCubit());

  // Place Order
  getIt.registerLazySingleton<PlaceOrderRemoteDataSource>(
    () => PlaceOrderRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<PlaceOrderRepository>(
    () => PlaceOrderRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<GetGovernoratesUseCase>(
    () => GetGovernoratesUseCase(getIt()),
  );
  getIt.registerLazySingleton<PlaceOrderUseCase>(
    () => PlaceOrderUseCase(getIt()),
  );
  getIt.registerFactory<PlaceOrderCubit>(() => PlaceOrderCubit());

  // Profile
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<GetProfileUseCase>(
    () => GetProfileUseCase(getIt()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  // Search
getIt.registerLazySingleton<SearchRemoteDataSource>(
  () => SearchRemoteDataSourceImpl(),
);
getIt.registerLazySingleton<SearchRepository>(
  () => SearchRepositoryImpl(getIt()),
);
getIt.registerLazySingleton<SearchBooksUseCase>(
  () => SearchBooksUseCase(getIt()),
);
getIt.registerFactory<SearchCubit>(() => SearchCubit());


// Wishlist
getIt.registerLazySingleton<WishlistRemoteDataSource>(
  () => WishlistRemoteDataSourceImpl(),
);
getIt.registerLazySingleton<WishlistRepository>(
  () => WishlistRepositoryImpl(getIt()),
);
getIt.registerLazySingleton<GetWishlistUseCase>(
  () => GetWishlistUseCase(getIt()),
);
getIt.registerLazySingleton<AddToWishlistUseCase>(
  () => AddToWishlistUseCase(getIt()),
);
getIt.registerLazySingleton<RemoveFromWishlistUseCase>(
  () => RemoveFromWishlistUseCase(getIt()),
);
getIt.registerFactory<WishlistCubit>(() => WishlistCubit());


// Update Password
getIt.registerLazySingleton<UpdatePasswordRemoteDataSource>(
  () => UpdatePasswordRemoteDataSourceImpl(),
);
getIt.registerLazySingleton<UpdatePasswordRepository>(
  () => UpdatePasswordRepositoryImpl(getIt()),
);
getIt.registerLazySingleton<ChangePasswordUseCase>(
  () => ChangePasswordUseCase(getIt()),
);
getIt.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit());


// Update Profile
getIt.registerLazySingleton<UpdateProfileRemoteDataSource>(
  () => UpdateProfileRemoteDataSourceImpl(),
);
getIt.registerLazySingleton<UpdateProfileRepository>(
  () => UpdateProfileRepositoryImpl(getIt()),
);
getIt.registerLazySingleton<UpdateProfileUseCase>(
  () => UpdateProfileUseCase(getIt()),
);
getIt.registerFactory<UpdateProfileCubit>(() => UpdateProfileCubit());
}