import 'dart:developer';

import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/service/local/shared_pref.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String? token = SharedPref.getToken();
    log(token.toString());
    Future.delayed(const Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        pushReplacement(context, Routes.main);
      } else {
        pushReplacement(context, Routes.welcome);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: AppImage.logo, width: 250),
            Gap(10),
            Text("Order Your Book Now!", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
