import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/controllers/choose_interest_controller.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';
import 'package:test_hello_world/resources/string_resources.dart';
import 'package:test_hello_world/view/widgets/circle_items.dart';
import 'package:test_hello_world/view/widgets/default_button.dart';

class ChooseYourInterest extends StatelessWidget {
  const ChooseYourInterest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChooseInterestController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.grey,
        ),
        title: Text(
          StringResources.chooseInterests,
          style: AppTextStyles.hintText,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(()=>
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: List.generate(
                      controller.selection.length,
                          (index) {
                        return CircleItems(index: index,);
                      },
                    ),
                  )
              ),
            ),
            const SizedBox(height: 10,),
            DefaultButton(text: StringResources.next, onTap: (){},),
          ],
        ),
      ),
    );
  }
}
