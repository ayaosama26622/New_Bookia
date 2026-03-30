part of 'edit_profile_cubit.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileState {}

class UpdateProfileSuccessState extends UpdateProfileState {}

class UpdateProfileErrorState extends UpdateProfileState {
  final String message;
  UpdateProfileErrorState({required this.message});
}
