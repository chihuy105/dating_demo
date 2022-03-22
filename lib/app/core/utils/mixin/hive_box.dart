import 'package:dating_demo/all_file/all_file.dart';

mixin FMHiveBox {
  Box? pBox;

  fInitHiveBox() async {
    pBox = await Hive.openBox(AppConstant.KEY_BOX);
  }
}
