
import 'package:dating_demo/all_file/all_file.dart';

class LikedListController extends GetxController {
  final userService = Get.find<UserService>();
  final userList = <UserEntity>[].obs;

  @override
  void onInit() {
    var secondLookUserList = userService.getLikedUserList();
    userList.addAll(secondLookUserList);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    userList.value = userList;
  }

  @override
  void onClose() {}
}
