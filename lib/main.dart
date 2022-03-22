import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/core/languages/app_translation.dart';
import 'package:dating_demo/dependencies.dart';
import 'package:flutter/services.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppDependencies();
  BlocOverrides.runZoned(
        () {
      runZonedGuarded(
            () async {
          runApp(MyApp(appRouter: Get.find<AppAutoRoute>(),));
        },
        _onError,
      );
    },
    // blocObserver: MyBlocObserver(),
  );
}

Future<void> _onError(Object error, StackTrace stack) async {
  logger.e('Application', error, stack);
}

class MyApp extends StatelessWidget {
  final AppAutoRoute appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

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
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
          )),
    );
  }
}
