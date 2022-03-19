import 'package:dating_demo/all_file/all_file.dart';

mixin AutoRouteTabResume<T extends StatefulWidget> on State<T> {
  late final String _routeName;

  @override
  void initState() {
    _routeName = context.routeData.name;
    super.initState();
  }

  @override
  void dispose() {
    context.tabsRouter.removeListener(_didChangeTabRoute);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.tabsRouter.removeListener(_didChangeTabRoute);
    context.tabsRouter.addListener(_didChangeTabRoute);
  }

  void _didChangeTabRoute() {
    if (context.tabsRouter.current.name == _routeName) {
      onResume();
    }
  }

  void onResume();
}