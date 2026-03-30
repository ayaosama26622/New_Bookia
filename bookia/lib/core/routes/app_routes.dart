import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:bookia/feature/auth/presentation/page/signup_screen.dart';
import 'package:bookia/feature/book_details_screen/presentation/page/book_details.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/page/cart_screen.dart';
import 'package:bookia/feature/congrats/congrats_screen.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/product.dart';
import 'package:bookia/feature/home/presentation/page/home_screen.dart';
import 'package:bookia/feature/intro/splash/splash_screen.dart';
import 'package:bookia/feature/intro/welcome/welcome_screen.dart';
import 'package:bookia/feature/main/main_app_screen.dart';
import 'package:bookia/feature/order_history/presentation/page/order_history_screen.dart';
import 'package:bookia/feature/place_order/presentation/page/place_order.dart';
import 'package:bookia/feature/profile/presentation/page/profile_screen.dart';
import 'package:bookia/feature/search/presentation/page/search_screen.dart';
import 'package:bookia/feature/update_password/presentation/page/updata_password.dart';
import 'package:bookia/feature/update_profile/presentation/page/edit_profile.dart';
import 'package:bookia/feature/wishlist/presentation/page/wishlist_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    navigatorKey: globalContext,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: Routes.main,
        builder: (context, state) => const MainAppScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.wishlist,
        builder: (context, state) => const WishlistScreen(),
      ),
      GoRoute(
        path: Routes.detail,
        builder: (context, state) {
          return DetailsScreen(model: state.extra as Product);
        },
      ),
      GoRoute(
        path: Routes.placeOrder,
        builder: (context, state) {
          return PlaceOrderScreen(total: state.extra as String);
        },
      ),
      GoRoute(
        path: Routes.cart,
        builder: (context, state) => BlocProvider(
          create: (context) => CartCubit(),
          child: const CartScreen(),
        ),
      ),
      GoRoute(
        path: Routes.congrats,
        builder: (context, state) => const CongratsScreen(),
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: Routes.updatePassword,
        builder: (context, state) => const UpdataPassword(),
      ),
      GoRoute(
        path: Routes.orderHistory,
        builder: (context, state) => const OrderHistoryScreen(),
      ),
    ],
  );
}
