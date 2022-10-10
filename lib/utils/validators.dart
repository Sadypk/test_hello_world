import 'package:get/get.dart';
import 'package:test_hello_world/controllers/sign_up_controller.dart';
import 'package:test_hello_world/resources/string_resources.dart';

class Validators{
  static String? validatePassword(String? value) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    if (value == null || value == '') {
      return StringResources.thisFieldIsRequired;
    } else if (!passwordRegExp.hasMatch(value)) {
      return StringResources.passwordMustBeEight;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value){
    SignUpController signUpController = Get.find();
    if(value == signUpController.password.value){
      return null;
    }else {
      return StringResources.passwordNotMatch;
    }
  }


  static String? validateEmail(String? value) {
    RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (value == null || value == '') {
      return StringResources.pleaseEnterEmailText;
    }else if (!regex.hasMatch(value)) {
      return StringResources.pleaseEnterAValidEmailText;
    } else {
      return null;
    }
  }

  static String? validateGender(String? value){
    if(value != null && value != StringResources.selectGender){
      return null;
    }else{
      return StringResources.thisFieldIsRequired;
    }
  }

}