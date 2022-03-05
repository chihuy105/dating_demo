import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/services/user/user_service.dart';

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
