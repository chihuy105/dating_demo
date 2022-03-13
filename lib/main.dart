import 'package:dating_demo/all_file/all_file.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Initialize service ,...
  await AppServices.initServices();

  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.grey,
      ),
      child: OverlaySupport.global(
          child: GetMaterialApp(
            translations: Languages(),
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
            darkTheme: ThemeProvider.getTheme(isDarkMode: true),
            theme: ThemeProvider.getTheme(isDarkMode: false),
            debugShowCheckedModeBanner: false,
            initialBinding: AppBindings.bindings,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          )),
    );
  }
}
