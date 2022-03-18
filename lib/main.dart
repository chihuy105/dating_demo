import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/core/languages/app_translation.dart';
import 'package:dating_demo/dependencies.dart';
import 'package:flutter/services.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppDependencies();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = Get.find<AppAutoRoute>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.grey,
      ),
      child: OverlaySupport.global(
          child: GetMaterialApp.router(
            translations: AppTranslation(),
            locale: const Locale('vi', 'VN'),
            fallbackLocale: const Locale('en', 'US'),
            title: AppConfig.APP_NAME,
            builder: (context, child) {
              child = ScrollConfiguration(
                behavior: const ScrollBehaviorDefault(),
                child: child!,
              );
              return child;
            },
            themeMode: ThemeMode.light,
            darkTheme: AppTheme.getTheme(isDarkMode: true),
            theme: AppTheme.getTheme(isDarkMode: false),
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          )),
    );
  }
}
