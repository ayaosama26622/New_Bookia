part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final Data profile;
  ProfileSuccessState({required this.profile});
}

class ProfileErrorState extends ProfileState {}
