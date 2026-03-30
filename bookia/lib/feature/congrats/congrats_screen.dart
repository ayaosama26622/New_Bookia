import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppImage.Sticker,
                width: 145,
                height: 145,
                fit: BoxFit.contain,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
              ),

              const SizedBox(height: 30),

              const Text(
                "SUCCESS!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your order will be delivered soon./nThank you for choosing our app!",
                style: TextStyle(color: Color(0xFF8B96A5), fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),
              MainButton(
                onPressed: () {
                  pushTo(context, Routes.home);
                },
                text: "Back To Home",
                bgColor: AppColor.primrycolor,
                minHeight: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
