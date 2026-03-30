import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum DialogType { error, success }

void showMyDialog(
  BuildContext context,
  String errorMsg, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 300),
      margin: const EdgeInsets.all(10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: type == DialogType.error
          ? AppColor.redColor.withValues(alpha: 0.8)
          : Colors.green,
      content: Row(
        children: [
          const Icon(Icons.error, color: AppColor.backgroundColor, size: 20),
          const Gap(10),
          Text(errorMsg),
        ],
      ),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColor.blackColor.withValues(alpha: 0.7),
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(color: AppColor.primrycolor),
      );
    },
  );
}
