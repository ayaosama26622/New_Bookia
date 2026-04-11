import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/dialoge.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_from_field.dart';
import 'package:bookia/feature/auth/domain/usecases/forget_password_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/register_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/resete_password_usecase.dart';
import 'package:bookia/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  AuthCubit(
            loginUseCase: getIt<LoginUseCase>(),
            registerUseCase: getIt<RegisterUseCase>(),
            forgetPasswordUseCase: getIt<ForgetPasswordUseCase>(),
            verifyOtpUseCase: getIt<VerifyOtpUseCase>(),
            resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
          ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () => pop(context),
            child: CustomSvgPicture(path: AppImage.back),
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccessState) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Success"),
                  content: Text("Reset link sent to your email"),
                ),
              );
            } else if (state is AuthErrorState) {
              showMyDialog(context, state.message);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create new password", style: TextStyles.headline),

                      const Gap(10),

                      Text(
                        "Your new password must be unique from those previously used.",
                        style: TextStyles.body.copyWith(
                          color: AppColor.grayColor,
                        ),
                      ),

                      const Gap(40),

                      PasswordFromField(
                        controller: cubit.passwordController,
                        hintText: "New Password",
                      ),
                      const Gap(16),

                      PasswordFromField(
                        controller: cubit.confirmPasswordController,
                        hintText: "Confirm password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          } else if (value != cubit.passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),

                      const Gap(32),

                      MainButton(
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.forget();
                          }
                        },
                        text: "Reset Password",
                        bgColor: AppColor.primrycolor,
                        minHeight: 56,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
