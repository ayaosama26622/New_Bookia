import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_from_field.dart';
import 'package:bookia/feature/update_password/presentation/cubit/updada_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UpdataPassword extends StatefulWidget {
  const UpdataPassword({super.key});

  @override
  State<UpdataPassword> createState() => _UpdataPasswordState();
}

class _UpdataPasswordState extends State<UpdataPassword> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Password Updated Successfully ✅"),
                backgroundColor: Colors.green,
              ),
            );
            pop(context);
          } else if (state is ChangePasswordErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ChangePasswordCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () => pop(context),
                child: CustomSvgPicture(path: AppImage.back),
              ),
            ),

            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("New Password", style: TextStyles.headline),
                    const Gap(80),

                    PasswordFromField(
                      controller: currentPasswordController,
                      hintText: "Current Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your current password";
                        }
                        return null;
                      },
                    ),
                    const Gap(16),

                    PasswordFromField(
                      controller: newPasswordController,
                      hintText: "New Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your new password";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                    ),
                    const Gap(16),

                    PasswordFromField(
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        } else if (value != newPasswordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: state is ChangePasswordLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : MainButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.changePassword(
                            currentPassword: currentPasswordController.text,
                            newPassword: newPasswordController.text,
                          );
                        }
                      },
                      text: 'Update Password',
                      bgColor: AppColor.primrycolor,
                      minHeight: 50,
                    ),
            ),
          );
        },
      ),
    );
  }
}
