import 'dart:math';

import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/repository/user/user_api.dart';

class UserService extends GetxService {

  final userApi = Get.find<UserApi>();
  Box? userBox;

  @override
  void onReady() async {
    userBox = await Hive.openBox(AppConstant.KEY_USER_BOX);
    super.onReady();
  }

  Future<List<UserEntity>> fetchUserList({int? page = 0}) {
    return userApi.getUsers(page: page.toString()).then((value) {
      return Future.value(value?.data);
    });
  }

  /**
   * Get User age, if the user age not exist then random it
   */
  Future<int> getUserAge(String userId) {
    var age = userBox?.get(AppConstant.KEY_USER_AGE + userId);
    if (age == null){
      age = Random().nextInt(100);
      userBox?.put(AppConstant.KEY_USER_AGE + userId, age);
    }
    return Future.delayed(const Duration(seconds: 2)).then((value) => Future.value(age));
  }

  /**
   * Get User liked stored list
   */
  List<UserEntity> getLikedUserList() {
    var boxValue = userBox?.get(AppConstant.KEY_USER_LIKED_LIST);
    if (boxValue != null){
      return (boxValue as List).mapAsList((e) {
        return e as UserEntity;
      });
    }
    return [];
  }

  /**
   * Store User liked
   */
  void addLikedUserData(UserEntity userEntity) {
    List? list = userBox?.get(AppConstant.KEY_USER_LIKED_LIST);
    if (list.isNullOrEmpty()){
      list = [];
    }
    if (list.filter((element) => element.id == userEntity.id).isNullOrEmpty()){
      list?.add(userEntity);
    }
    userBox?.put(AppConstant.KEY_USER_LIKED_LIST, list);
  }

  /**
   * Get User second look stored list
   */
  List<UserEntity> getSecondLookUserList() {
    var boxValue = userBox?.get(AppConstant.KEY_USER_SECOND_LOOK_LIST);
    if (boxValue != null){
      return (boxValue as List).mapAsList((e) {
        return e as UserEntity;
      });
    }
    return [];
  }

  /**
   * Store User second look
   */
  void addSecondLookUserData(UserEntity userEntity) {
    List? list = userBox?.get(AppConstant.KEY_USER_SECOND_LOOK_LIST);
    if (list.isNullOrEmpty()){
      list = [];
    }
    if (list.filter((element) => element.id == userEntity.id).isNullOrEmpty()){
      list?.add(userEntity);
    }
    userBox?.put(AppConstant.KEY_USER_SECOND_LOOK_LIST, list);
  }


  @override
  void onClose() {
    super.onClose();
  }

}
