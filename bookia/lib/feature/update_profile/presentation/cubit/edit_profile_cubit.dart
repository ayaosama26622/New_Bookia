import 'package:bookia/feature/update_profile/data/repo/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String address,
  }) async {
    emit(UpdateProfileLoadingState());

    var data = await UpdateProfileRepo.updateProfile(
      name: name,
      phone: phone,
      address: address,
    );

    if (data != null && data.status == 200) {
      emit(UpdateProfileSuccessState());
    } else {
      emit(
        UpdateProfileErrorState(
          message: data?.message ?? "Something went wrong",
        ),
      );
    }
  }
}
