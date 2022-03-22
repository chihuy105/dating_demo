
import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/modules/swipe/views/swipe_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page|Dialog|View,Route',
    routes: <AutoRoute>[
      AutoRoute(
          path: '/home', page: HomePage,
          initial: true,
        children: [
          AutoRoute(path: 'swipe', page: SwipePage),
          AutoRoute(path: 'liked-list', page: LikedListPage),
          AutoRoute(path: 'second-look', page: SecondLookPage),
        ]
      ),
      // AutoRoute(
      //     path: Routes.LIKED_LIST, page: LikedListView),
      // AutoRoute(
      //     path: Routes.SECOND_LOOK, page: SecondLookView)
    ])
class $AppAutoRoute {}