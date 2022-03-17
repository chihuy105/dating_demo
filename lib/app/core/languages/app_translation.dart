
import 'package:get/get.dart';
import 'package:dating_demo/app/core/languages/en_us_translations.dart';
import 'package:dating_demo/app/core/languages/vi_vn_translations.dart';

class AppTranslation extends Translations{
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': enUs, 'vi_VN': viVn};
}