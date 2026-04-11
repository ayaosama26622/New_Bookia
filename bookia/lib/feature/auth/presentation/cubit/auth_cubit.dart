import 'package:bookia/feature/auth/data/models/register_paremeter.dart';
import 'package:bookia/feature/auth/domain/usecases/forget_password_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/register_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/resete_password_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgetPasswordUseCase,
    required this.verifyOtpUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitialState());

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(AuthLoadingState());
    var response = await loginUseCase.call(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await registerUseCase.call(
      AuthParams(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> forget() async {
    emit(AuthLoadingState());
    var response = await forgetPasswordUseCase.call(emailController.text);
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> verifyOtp() async {
    emit(AuthLoadingState());
    var response = await verifyOtpUseCase.call(otpController.text);
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> resetPassword() async {
    emit(AuthLoadingState());
    var response = await resetPasswordUseCase.call(
      AuthParams(
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }
}