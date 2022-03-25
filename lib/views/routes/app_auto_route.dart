import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/views/screens/swipe/views/swipe_page.dart';

import '../screens/auth/views/login_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page|Dialog|View,Route',
    routes: <AutoRoute>[
      AutoRoute(path: '/home', page: HomePage, children: [
        AutoRoute(path: 'swipe', page: SwipePage),
        AutoRoute(path: 'liked-list', page: LikedListPage),
        AutoRoute(path: 'second-look', page: SecondLookPage),
      ]),
      AutoRoute(
        path: '/login',
        page: LoginPage,
        initial: true,
      ),
      // AutoRoute(
      //     path: Routes.SECOND_LOOK, page: SecondLookView)
    ])
class $AppAutoRoute {}
