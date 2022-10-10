import 'package:get/get.dart';
import 'package:test_hello_world/controllers/choose_interest_controller.dart';
import 'package:test_hello_world/controllers/movie_controller.dart';
import 'package:test_hello_world/controllers/sign_up_controller.dart';
import 'package:test_hello_world/repositories/movie_repository.dart';

class RootBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());

    Get.put(MovieRepository());
    Get.put(MovieController());
    Get.put(ChooseInterestController());
  }

}