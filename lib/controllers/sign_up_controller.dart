import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/resources/string_resources.dart';
import 'package:test_hello_world/view/home_screen.dart';

class SignUpController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();

  // Email
  RxString email = ''.obs;

  void onChangeEmail(String? value){
    email.value = value!;
  }

  // Email
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;

  void onChangePassword(String? value){
    password.value = value!;
    if(confirmPassword.value != ''){
      confirmPasswordKey.currentState!.validate();
    }
  }

  void onChangeConfirmPassword(String? value){
    confirmPassword.value = value!;
    confirmPasswordKey.currentState!.validate();
  }

  // Gender
  List<String> genderOptions = <String>[
    StringResources.selectGender,
    StringResources.male,
    StringResources.female,
  ];
  RxString selectedGender = StringResources.selectGender.obs;

  void onChangeGender(String? value){
    selectedGender.value = value!;
  }

  void onTapSignUp(){
    if(formKey.currentState!.validate() && passwordKey.currentState!.validate()  && confirmPasswordKey.currentState!.validate()){
      Get.to(const HomeScreen());
    }
  }
}