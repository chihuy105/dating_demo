import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/model/user/user_resp.dart';

extension UserEntityExtend on UserEntity? {

  String? getFullName() {
    if(this == null)
      return null;
    return '${this!.firstName} ${this!.lastName}';
  }

}