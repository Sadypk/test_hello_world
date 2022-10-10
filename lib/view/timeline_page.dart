import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/controllers/timeline_controller.dart';
import 'package:test_hello_world/resources/app_colors.dart';

const double containerSize = 45;
const double appbarHeight = 50;

class TimelinePage extends StatelessWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimelineController timelineController = Get.put(TimelineController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => SizedBox(
              height: timelineController.onFlight.value
                  ? Get.height
                  : timelineController.linePositions[4] + 190,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    if (!timelineController.onFlight.value)
                      Positioned(
                        left: 20,
                        top: timelineController.linePositions[0] -
                            (containerSize - 5) -
                            appbarHeight,
                        child: Container(
                          height: timelineController.linePositions[4] -
                              (containerSize - 5) -
                              appbarHeight,
                          width: 2,
                          color: AppColors.grey,
                        ),
                      ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: timelineController.keys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index != 0) {
                              if (timelineController.activeLine[index - 1] ==
                                  true) {
                                timelineController.activeLine[index] = true;
                              }
                            }
                          },
                          child: Obx(
                            () => _TimelineTile(
                              containerKey: timelineController.keys[index],
                              timelineNumber: (index + 1).toString(),
                              subtitle: index == 1 || index == 4
                                  ? '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                            '''
                                  : null,
                              isActive: timelineController.activeLine[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final String timelineNumber;
  final String? subtitle;
  final GlobalKey? containerKey;
  final bool isActive;

  const _TimelineTile({
    required this.containerKey,
    required this.timelineNumber,
    this.isActive = false,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: containerSize,
            width: containerSize,
            decoration: BoxDecoration(
              color: isActive ? AppColors.black : AppColors.grey,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 2.0,
                color: isActive ? AppColors.blueLight : AppColors.darkGrey,
              ),
            ),
            child: Center(
              key: containerKey,
              child: isActive
                  ? Text(
                      timelineNumber,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Icon(
                      Icons.lock,
                      color: AppColors.darkGrey,
                    ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rango',
                      style: TextStyle(
                        color: isActive ? AppColors.blueLight : AppColors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(
                          color: isActive ? AppColors.blueLight : AppColors.black,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
