import 'package:get/get.dart';

import '../controllers/second_look_controller.dart';

class SecondLookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondLookController>(
      () => SecondLookController(),
    );
  }
}
