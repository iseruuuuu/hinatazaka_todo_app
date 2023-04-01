// Package imports:
import 'package:get/get.dart';

// Project imports:

class TabScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final data = <DateTime>[];

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
