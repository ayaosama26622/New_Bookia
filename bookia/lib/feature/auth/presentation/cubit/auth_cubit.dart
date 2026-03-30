import 'package:bookia/feature/auth/data/models/register_paremeter.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(AuthLoadingState());

    var response = await AuthRepo.login(
      RegisterParemeter(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to login"));
    }
  }

  Future<void> register() async {
    emit(AuthLoadingState());

    var response = await AuthRepo.register(
      RegisterParemeter(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to register"));
    }
  }

  Future<void> forget() async {
    emit(AuthLoadingState());

    var response = await AuthRepo.forget(
      RegisterParemeter(email: emailController.text),
    );

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to register"));
    }
  }

  Future<void> verifyOtp() async {
    emit(AuthLoadingState());

    var response = await AuthRepo.verifyOtp(
      RegisterParemeter(otp: otpController.text),
    );

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Invalid OTP"));
    }
  }

  Future<void> resetPassword() async {
    emit(AuthLoadingState());

    var response = await AuthRepo.resetPassword(
      RegisterParemeter(
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to reset password"));
    }
  }
}
