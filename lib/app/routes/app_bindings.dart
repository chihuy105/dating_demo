

import 'package:dating_demo/all_file/all_file.dart';

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


  });
}