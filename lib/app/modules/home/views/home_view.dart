import 'package:dating_demo/all_file/all_file.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          SwipeRoute(),
          LikedListRoute(),
          SecondLookRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                  label: 'swipe'.tr, icon: const Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'likedList'.tr, icon: const Icon(Icons.star)),
              BottomNavigationBarItem(
                  label: 'secondLook'.tr, icon: const Icon(Icons.remove_red_eye)),
            ],
          );
        });
  }
}
