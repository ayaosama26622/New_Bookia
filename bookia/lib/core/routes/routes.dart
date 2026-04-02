import 'package:flutter/widgets.dart';

var globalContext = GlobalKey<NavigatorState>();

class Routes {
  static const String splash = "/";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String forget = "/forget-password";
  static const String check = "/check-forget-password";
  static const String resetPassword = "/reset-password";
  static const String main = "/main";
  static const String home = "/home";
  static const String detail = "/detail";
  static const String wishlist = "/wishlist";
  static const String cart = "/cart";
  static const String placeOrder = "/placeOrder";
  static const String congrats = "/congrats";
  static const String search = "/search";
  static const String profile = "/profile";
  static const String editProfile = "/edit-profile";
  static const String updatePassword = "/update-password";
  static const String orderHistory = "/order-history";
  static const String PasswordChanged = "/Password_Changed";
}
