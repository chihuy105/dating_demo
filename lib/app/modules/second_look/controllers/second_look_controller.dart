import 'package:dating_demo/all_file/all_file.dart';

class SecondLookController extends GetxController {
  final userService = Get.find<UserService>();
  final userList = <UserEntity>[].obs;

  @override
  void onInit() {
    var secondLookUserList = userService.getSecondLookUserList();
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
