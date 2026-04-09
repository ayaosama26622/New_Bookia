import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/widgets/profile_item_.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..getProfile(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('profile'.tr()),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButton(
                icon: CustomSvgPicture(path: AppImage.shar),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: const ProfileItem(),
      ),
    );
  }
}
