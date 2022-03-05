
import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/model/user/user_resp.dart';
import 'package:dating_demo/app/data/repository/user/user_api.dart';

class UserService extends GetxService {

  final userApi = Get.find<UserApi>();

  @override
  void onReady() async {
    super.onReady();
  }

  Future<List<UserEntity>> fetchUserList({int? page = 0}){
    return userApi.getUsers(page: page.toString()).then((value) {
      return Future.value(value?.data);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

}
