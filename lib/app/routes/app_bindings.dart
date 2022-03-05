
import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/repository/user/user_api.dart';
import 'package:dating_demo/app/data/services/user/user_service.dart';

class AppBindings{
  AppBindings._();

  static final bindings = BindingsBuilder((){
    Get.lazyPut<DioModule>(() => DioModule(), fenix: true);

    // Get.lazyPut<ProductService>(() => ProductService(Get.find<DioModule>().dio), fenix: true);
    //
    // Get.lazyPut<DiscountController>(() => DiscountController(), fenix: true);
    //
    // Get.put<AppController>(AppController(), permanent: true);
    //
    // Get.create(() => FNewsDetailController());

    Get.lazyPut<UserApi>(
            () => UserApi(Get.find<DioModule>().dio),
        fenix: true);

    Get.lazyPut<UserService>(
            () => UserService(),
        fenix: true);

  });
}