import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/extension.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/widgets/bestseller.dart';
import 'package:bookia/feature/home/presentation/widgets/home_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..initLoadData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: CustomSvgPicture(path: AppImage.logo, height: 30),
          actions: [
            IconButton(
              onPressed: () {
                pushTo(context, Routes.search);
              },
              icon: CustomSvgPicture(path: AppImage.search),
            ),
            IconButton(
              onPressed: () {
                bool isArabic = context.isArabic;
                context.setLocale(Locale(isArabic ? 'en' : 'ar'));
              },
              icon: Icon(Icons.language),
            ),
          ],
          
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                HomeSlider(),
                Gap(30),
                BestSellerBooks(),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
