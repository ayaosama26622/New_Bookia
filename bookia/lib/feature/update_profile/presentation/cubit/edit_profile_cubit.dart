import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/feature/update_profile/domain/usecase/update_profile_usecase.dart';
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
    var response = await getIt<UpdateProfileUseCase>().call(
      name: name,
      phone: phone,
      address: address,
    );
    response.fold(
      (l) => emit(UpdateProfileErrorState(message: l.message)),
      (r) => emit(UpdateProfileSuccessState()),
    );
  }
}