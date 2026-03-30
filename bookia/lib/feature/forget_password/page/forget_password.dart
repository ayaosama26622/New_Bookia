import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/custom_text_from_field.dart';
import 'package:bookia/core/widgets/dialoge.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                      Text("Forgot Password?", style: TextStyles.headline),

                      const Gap(10),

                      Text(
                        "Don't worry! It occurs. Please enter the email address linked with your account.",
                        style: TextStyles.body.copyWith(
                          color: AppColor.grayColor,
                        ),
                      ),

                      const Gap(40),

                      CustomTextFromField(
                        controller: cubit.emailController,
                        hintText: "Enter your email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }

                          if (!isEmailValid(value)) {
                            return "Please enter valid email";
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
                        text: "Send Code",
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
              Text("Remember password?", style: TextStyles.body),

              const Gap(4),

              GestureDetector(
                onTap: () {
                  pop(context);
                },
                child: Text(
                  "Login",
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
