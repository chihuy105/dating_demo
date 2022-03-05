import 'dart:math';

import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/repository/user/user_api.dart';

class UserService extends GetxService {

  final userApi = Get.find<UserApi>();

  static const KEY_USER_AGE = 'KEY_USER_AGE';

  @override
  void onReady() async {
    super.onReady();
  }

  Future<List<UserEntity>> fetchUserList({int? page = 0}) {
    return userApi.getUsers(page: page.toString()).then((value) {
      return Future.value(value?.data);
    });
  }

  Future<int> getUserAge(String userId) {
    var age = LocalDataService.appHiveBox?.get(KEY_USER_AGE + userId);
    if (age == null){
      age = Random().nextInt(100);
      LocalDataService.appHiveBox?.put(KEY_USER_AGE + userId, age);
    }
    return Future.delayed(const Duration(seconds: 2)).then((value) => Future.value(age));
  }


  @override
  void onClose() {
    super.onClose();
  }

}
