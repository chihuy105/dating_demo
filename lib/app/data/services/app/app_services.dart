import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/services/app/firebase_push_notify.dart';
import 'package:dating_demo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

/// Add this to manifest
/// <meta-data
///      android:name="com.google.firebase.messaging.default_notification_channel_id"
///      android:value="high_importance_channel" />
///

class AppServices {
  static Future<void> initServices() async {
    logger.i('SERVICE starting ...');

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

    Get.put<AppAutoRoute>(AppAutoRoute());

    logger.i('SERVICE all started...');
  }


}

