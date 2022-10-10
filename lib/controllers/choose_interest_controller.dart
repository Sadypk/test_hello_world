import 'package:get/get.dart';

class ChooseInterestController{
  RxList<bool> selection = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  void onSelect(int index){
    selection[index] = !selection[index];
  }
}
