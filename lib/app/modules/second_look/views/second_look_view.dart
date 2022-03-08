import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/widgets/user/user_item.dart';

import '../controllers/second_look_controller.dart';

class SecondLookView extends GetView<SecondLookController> {
  const SecondLookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Second Look'.text.black.make(),
        centerTitle: true,
        leading: BtnBack(),
      ),
      body: Center(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: controller.userList.length,
            itemBuilder: (context, index) {
              return UserItem(
                  userEntity: controller.userList.getOrNull(index),
              );
            }),
      ),
    );
  }
}
