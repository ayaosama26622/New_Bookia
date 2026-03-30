import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/dialoge.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/otp_field.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
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
            if (state is OtpSuccessState) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Success"),
                  content: Text("OTP Verified Successfully"),
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
                      Text("OTP Verification", style: TextStyles.headline),

                      const Gap(10),

                      Text(
                        "Enter the verification code we just sent on your email address.",
                        style: TextStyles.body.copyWith(
                          color: AppColor.grayColor,
                        ),
                      ),

                      const Gap(40),

                      OtpField(controller: cubit.otpController),

                      const Gap(32),

                      state is AuthLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : MainButton(
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.verifyOtp();
                                }
                              },
                              text: "Verify",
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

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn’t receive code?", style: TextStyles.body),

              const Gap(4),

              GestureDetector(
                onTap: () {},

                child: Text(
                  "Resend",
                  style: TextStyles.body.copyWith(color: AppColor.primrycolor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
