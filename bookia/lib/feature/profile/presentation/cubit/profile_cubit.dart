import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/feature/profile/data/models/profile_response/data.dart';
import 'package:bookia/feature/profile/domain/usecase/get_profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    var response = await getIt<GetProfileUseCase>().call();
    response.fold(
      (l) => emit(ProfileErrorState()),
      (r) {
        if (r.data != null) {
          emit(ProfileSuccessState(profile: r.data!));
        } else {
          emit(ProfileErrorState());
        }
      },
    );
  }
}