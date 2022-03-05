
import 'package:dating_demo/all_file/all_file.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: "Hello".text.colorPrimary(context).make()
      ),
    );
  }
}
