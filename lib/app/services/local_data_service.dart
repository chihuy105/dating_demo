import 'package:dating_demo/all_file/all_file.dart';

class LocalDataService {
  static Box? appHiveBox;

  static Future<void> createBox() async {
    appHiveBox = await Hive.openBox(AppConstant.KEY_BOX);
  }

  static deleteFromLocal(String key) async {
    appHiveBox?.delete(key);
  }
}
