part of 'updada_password_cubit.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {
  final String message;
  ChangePasswordErrorState({required this.message});
}
