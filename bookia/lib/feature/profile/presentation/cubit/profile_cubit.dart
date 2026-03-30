import 'package:bookia/feature/profile/data/models/profile_response/data.dart';
import 'package:bookia/feature/profile/data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());

    var data = await ProfileRepo.getProfile();

    if (data != null && data.data != null) {
      emit(ProfileSuccessState(profile: data.data!));
    } else {
      emit(ProfileErrorState());
    }
  }
}
