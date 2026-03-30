import 'package:bookia/feature/update_password/data/repo/updada_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'updada_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoadingState());

    var data = await ChangePasswordRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    if (data != null && data.status == 200) {
      emit(ChangePasswordSuccessState());
    } else {
      emit(
        ChangePasswordErrorState(
          message: data?.message ?? "Something went wrong",
        ),
      );
    }
  }
}
