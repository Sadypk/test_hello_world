import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Key? buttonKey;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: buttonKey,
      onTap: onTap,
      child: Container(
        height: 70,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.blueNavy,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.buttonText,
          ),
        ),
      ),
    );
  }
}
