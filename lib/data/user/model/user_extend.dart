import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/data/user/model/user_resp.dart';

extension UserEntityExtend on UserEntity? {

  String? getFullName() {
    if(this == null) {
      return null;
    }
    return '${this!.firstName} ${this!.lastName}';
  }

}