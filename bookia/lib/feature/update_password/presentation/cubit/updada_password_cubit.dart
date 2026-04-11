import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/feature/update_password/domain/usecase/change_password_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'updada_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoadingState());
    var response = await getIt<ChangePasswordUseCase>().call(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    response.fold(
      (l) => emit(ChangePasswordErrorState(message: l.message)),
      (r) => emit(ChangePasswordSuccessState()),
    );
  }
}