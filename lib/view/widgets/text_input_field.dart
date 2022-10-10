import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';

class TextInputField extends StatelessWidget {
  final String? hint;
  final IconData? iconData;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Key? textKey;

  const TextInputField({
    Key? key,
    this.iconData,
    this.isPassword = false,
    this.hint,
    this.validator,
    this.onChanged,
    this.textKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool passwordVisible = isPassword.obs;
    return Obx(()=>
        SizedBox(
          width: Get.width,
          child: TextFormField(
            key: textKey,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.hintText,
              icon: Icon(iconData, size: 18, color: AppColors.grey,),
              suffixIcon: isPassword? IconButton(
                icon: Icon(
                  passwordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.grey,
                  size: 18,
                ),
                onPressed: () {
                  passwordVisible.value = !passwordVisible.value;
                },
              ): null,
            ),
            validator: validator,
            obscureText: passwordVisible.value,
          ),
        )
    );
  }
}
