
import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/modules/swipe/views/swipe_view.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page|Dialog|View,Route',
    routes: <AutoRoute>[
      AutoRoute(
          path: Routes.HOME, page: HomeView,
          initial: true,
        children: [
          AutoRoute(path: RouterPaths.SWIPE, page: SwipeView),
          AutoRoute(path: RouterPaths.LIKED_LIST, page: LikedListView),
          AutoRoute(path: RouterPaths.SECOND_LOOK, page: SecondLookView),
        ]
      ),
      // AutoRoute(
      //     path: Routes.LIKED_LIST, page: LikedListView),
      // AutoRoute(
      //     path: Routes.SECOND_LOOK, page: SecondLookView)
    ])
class $AppAutoRoute {}