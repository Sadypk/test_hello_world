import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/controllers/sign_up_controller.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';
import 'package:test_hello_world/resources/string_resources.dart';
import 'package:test_hello_world/utils/validators.dart';
import 'package:test_hello_world/view/widgets/custom_drop_down.dart';
import 'package:test_hello_world/view/widgets/default_button.dart';
import 'package:test_hello_world/view/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();
    return Obx(() => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      StringResources.signUp,
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: <Widget>[
                          TextInputField(
                            hint: StringResources.emailAddress,
                            iconData: Icons.email_outlined,
                            validator: Validators.validateEmail,
                            textKey: const Key('email'),
                          ),
                          CustomDropDown(
                            options: controller.genderOptions,
                            selected: controller.selectedGender.value,
                            onChangeValue: controller.onChangeGender,
                            iconData: Icons.people,
                            validator: Validators.validateGender,
                            key: const Key('gender'),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: controller.passwordKey,
                      child: TextInputField(
                        hint: StringResources.password,
                        iconData: Icons.lock_outline_rounded,
                        validator: Validators.validatePassword,
                        isPassword: true,
                        onChanged: controller.onChangePassword,
                        textKey: const Key('password'),
                      ),
                    ),
                    Form(
                      key: controller.confirmPasswordKey,
                      child: TextInputField(
                        hint: StringResources.confirmPassword,
                        iconData: Icons.lock_outline_rounded,
                        validator: Validators.validateConfirmPassword,
                        isPassword: true,
                        onChanged: controller.onChangeConfirmPassword,
                        textKey: const Key('confirmPassword'),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DefaultButton(
                      text: StringResources.signUp,
                      onTap: controller.onTapSignUp,
                      key: const Key('button'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
