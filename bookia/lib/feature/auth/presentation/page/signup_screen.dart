import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart' show TextStyles;
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/custom_text_from_field.dart';
import 'package:bookia/core/widgets/dialoge.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_from_field.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
        body: _registerBoby(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account? ", style: TextStyles.body),
              const Gap(4),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Login Now",
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

class _registerBoby extends StatelessWidget {
  const _registerBoby();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pushToBase(context, Routes.main);
        } else if (state is AuthErrorState) {
          pop(context);
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
                  const Text(
                    "Hello! Register to get started",
                    style: TextStyles.headline,
                  ),
                  const Gap(40),

                  CustomTextFromField(
                    controller: cubit.nameController,
                    hintText: "Username",
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),

                  CustomTextFromField(
                    controller: cubit.emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isEmailValid(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const Gap(16),

                  PasswordFromField(
                    controller: cubit.passwordController,
                    hintText: "Password",
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
                  const Gap(40),

                  MainButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.register();
                      }
                    },
                    text: "Register",
                    bgColor: AppColor.primrycolor,
                    minHeight: 56,
                  ),

                  const Gap(32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
