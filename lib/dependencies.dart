import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/services/firebase_push_notify.dart';
import 'package:dating_demo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> setupAppDependencies() async {
  logger.i('SERVICE starting ...');

  await _appService();
  await _appDataProvider();

  logger.i('SERVICE all started...');
}



Future<void> _appService() async {
  // Logger
  logger = LoggerCustom(logEnable: !AppConfig.IN_PRODUCTION);
  // logger = LoggerCustom(logEnable: true);

  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  LocalDataService.createBox();

  // TODO: move some await to SplashScreen
  await Hive.initFlutter();

  // Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebasePushNotification.instance.init();

  Get.put<AppAutoRoute>(AppAutoRoute(), permanent: true);
}


Future<void> _appDataProvider() async {

  Get.lazyPut<DioModule>(() => DioModule(), fenix: true);

  Get.lazyPut<UserApi>(
          () => UserApi(Get.find<DioModule>().dio),
      fenix: true);

  Get.lazyPut<UserRepo>(
          () => UserRepo(),
      fenix: true);
}