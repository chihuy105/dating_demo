import 'package:get/get.dart';

import '../controllers/liked_list_controller.dart';

class LikedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LikedListController>(
      () => LikedListController(),
    );
  }
}
