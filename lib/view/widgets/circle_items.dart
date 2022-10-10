import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/controllers/choose_interest_controller.dart';
import 'package:test_hello_world/resources/app_colors.dart';

class CircleItems extends StatelessWidget {
  final int index;

  const CircleItems({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChooseInterestController controller = Get.find();
    return GestureDetector(
      onTap: ()=> controller.onSelect(index),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://www.rd.com/wp-content/uploads/2021/01/GettyImages-1175550351.jpg?resize=2048,1339'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  width: controller.selection[index] ? 3 : 0,
                  color: AppColors.blueNavy,
                ),
              ),
            ),
            if(controller.selection[index])Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.blueNavy,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.done, color: AppColors.white, size: 15,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
