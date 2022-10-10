import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController {
  final RxBool onFlight = true.obs;

  List<GlobalKey> keys = <GlobalKey>[
    GlobalKey(debugLabel: 'key1'),
    GlobalKey(debugLabel: 'key2'),
    GlobalKey(debugLabel: 'key3'),
    GlobalKey(debugLabel: 'key4'),
    GlobalKey(debugLabel: 'key5'),
  ];

  RxList<double> linePositions = <double>[].obs;

  RxList<bool> activeLine = <bool>[
    true,
    false,
    false,
    false,
    false,
  ].obs;

  @override
  void onInit() {
    fakeLoader();
    super.onInit();
  }

  void fakeLoader() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      getPosition();
    });
  }

  void getPosition() {
    for (GlobalKey key in keys) {
      final RenderBox renderBox =
          key.currentContext?.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      linePositions.add(position.dy);
    }
    onFlight.value = false;
  }
}
