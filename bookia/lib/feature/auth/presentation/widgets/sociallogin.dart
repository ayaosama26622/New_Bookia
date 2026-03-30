import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart' show TextStyles;
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class sociallogin extends StatelessWidget {
  const sociallogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(40),
            Text("or", style: TextStyles.body),
            Gap(40),
            Expanded(child: Divider()),
          ],
        ),
        Gap(24),
        socialButton(
          path: AppImage.google,
          text: "Sign in with Google",
          onTap: () {},
        ),
        Gap(16),
        socialButton(
          path: AppImage.cib_apple,
          text: "Sign in with Apple",
          onTap: () {},
        ),
      ],
    );
  }
}

class socialButton extends StatelessWidget {
  const socialButton({
    super.key,
    required this.path,
    required this.text,
    required this.onTap,
  });
  final String path;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: path),
            Gap(10),
            Text(
              text,
              style: TextStyle(fontSize: 16, color: AppColor.darkgrayColor),
            ),
          ],
        ),
      ),
    );
  }
}
