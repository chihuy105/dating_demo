import 'package:dating_demo/all_file/all_file.dart';

class AppServices {

  static Future<void> initServices() async {
    print('SERVICE starting ...');

    // TODO: move some await to SplashScreen
    await Hive.initFlutter();

    // Firebase
    // await Firebase.initializeApp();
    // await AppFirebaseConfigService.instance.init();

    print('SERVICE all started...');
  }

}
