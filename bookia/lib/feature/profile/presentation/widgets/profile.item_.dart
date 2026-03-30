import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/feature/profile/data/models/profile_response/data.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_field.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileErrorState) {
            return const Center(child: Text("Something went wrong"));
          }
          if (state is ProfileSuccessState) {
            return _buildBody(context, state.profile);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, UserProfile profile) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: profile.image != null
                      ? DecorationImage(
                          image: NetworkImage(profile.image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profile.email ?? '',
                    style: const TextStyle(color: AppColor.darkgrayColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          ProfileField(
            title: 'My Orders',
            onTap: () => pushTo(context, Routes.orderHistory),
          ),
          ProfileField(
            title: 'Edit Profile',
            onTap: () => pushTo(context, Routes.editProfile),
          ),
          ProfileField(
            title: 'Reset Password',
            onTap: () => pushTo(context, Routes.updatePassword),
          ),
          ProfileField(title: 'FAQ', onTap: () => pushTo(context, '/faq')),
          ProfileField(
            title: 'Contact Us',
            onTap: () => pushTo(context, '/contact-us'),
          ),
          ProfileField(
            title: 'Privacy & Terms',
            onTap: () => pushTo(context, '/privacy'),
          ),
        ],
      ),
    );
  }
}
