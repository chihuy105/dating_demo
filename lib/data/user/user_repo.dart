import 'dart:math';

import 'package:dating_demo/all_file/all_file.dart';

const _randomImage = [
  'https://kenh14cdn.com/thumb_w/660/203336854389633024/2022/3/4/-1646365743095601765066.jpg',
  'https://img-cdn.xemgame.com/2020/04/20/Dopa-duoc-moi-thi-dau-chuyen-nghiep-2.jpg',
  'https://i.pinimg.com/736x/36/92/ee/3692ee76bbc1dfd4b545c09d8a03288b.jpg',
  'https://cdn.pixabay.com/photo/2020/07/21/16/10/pokemon-5426712__480.png',
  'https://i.pinimg.com/originals/d6/f8/d7/d6f8d7b5cc1fca0665359e2b99458d41.jpg',
  'https://image.thanhnien.vn/w1024/Uploaded/2022/abfluao/2021_08_12/h4_vxrj.jpg',
  'https://9xwallpapers.com/wp-content/uploads/2021/07/Batman-Wallpaper-scaled.jpg',
];

var _count = _randomImage.length -1;

class UserRepo extends GetxService {

  late final UserApi _userApi;
  Box? userBox;

  UserRepo({UserApi? userApi}){
    _userApi = userApi ?? Get.find<UserApi>();
  }

  @override
  void onInit() async {
    userBox = await Hive.openBox(AppConstant.KEY_USER_BOX);
    super.onInit();
  }

  Future<List<UserEntity>> fetchUserList({int? page = 1}) {
    return _userApi.getUsers(page: page.toString()).then((value) {
      var list = value?.data;
      list?.forEach((user) {
        user.picture = _randomImage.getOrNull(_count);
        --_count;
        if(_count < 0 ) {
          _count = _randomImage.length - 1;
        }
      });

      return Future.value(list);
    });
  }

  /// Get User age, if the user age not exist then random it
  Future<int> getUserAge(String userId) {
    var age = userBox?.get(AppConstant.KEY_USER_AGE + userId);
    if (age == null){
      age = Random().nextInt(100);
      userBox?.put(AppConstant.KEY_USER_AGE + userId, age);
    }
    return Future.delayed(const Duration(seconds: 2)).then((value) => Future.value(age));
  }

  /// Get User liked stored list
  List<UserEntity> getLikedUserList() {
    var boxValue = userBox?.get(AppConstant.KEY_USER_LIKED_LIST);
    if (boxValue != null){
      return (boxValue as List).mapAsList((e) {
        return e as UserEntity;
      });
    }
    return [];
  }

  /// Store User liked
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

  /// Get User second look stored list
  List<UserEntity> getSecondLookUserList() {
    var boxValue = userBox?.get(AppConstant.KEY_USER_SECOND_LOOK_LIST);
    if (boxValue != null){
      return (boxValue as List).mapAsList((e) {
        return e as UserEntity;
      });
    }
    return [];
  }

  /// Store User second look
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

}
