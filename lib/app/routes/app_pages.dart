import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/liked_list/bindings/liked_list_binding.dart';
import '../modules/liked_list/views/liked_list_view.dart';
import '../modules/second_look/bindings/second_look_binding.dart';
import '../modules/second_look/views/second_look_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIKED_LIST,
      page: () => LikedListView(),
      binding: LikedListBinding(),
    ),
    GetPage(
      name: _Paths.SECOND_LOOK,
      page: () => SecondLookView(),
      binding: SecondLookBinding(),
    ),
  ];
}
