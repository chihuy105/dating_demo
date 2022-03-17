
import 'package:dating_demo/all_file/all_file.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page|Dialog|View,Route',
    routes: <AutoRoute>[
      AutoRoute(
          path: Routes.HOME, page: HomeView,
          initial: true
      ),
      AutoRoute(
          path: Routes.LIKED_LIST, page: LikedListView),
      AutoRoute(
          path: Routes.SECOND_LOOK, page: SecondLookView)
    ])
class $AppAutoRoute {}