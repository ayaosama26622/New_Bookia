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

    var response = await ChangePasswordRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    response.fold(
      (l) => emit(ChangePasswordErrorState(message: l.message)),
      (r) => emit(ChangePasswordSuccessState()),
    );
  }
}
