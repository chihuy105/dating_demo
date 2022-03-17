
import 'package:dating_demo/all_file/all_file.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page|Dialog|View,Route',
    routes: <AutoRoute>[
      AutoRoute(
          path: '/home', page: HomeView,
          initial: true,
          children: <AutoRoute>[
            AutoRoute(
              path: 'liked',
              page: LikedListView,
            ),
            AutoRoute(
              path: 'second-look',
              page: SecondLookView,
            ),
          ]),
    ])
class $AppRoute {}