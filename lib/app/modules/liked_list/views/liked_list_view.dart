import 'package:dating_demo/all_file/all_file.dart';

import '../controllers/liked_list_controller.dart';

class LikedListView extends GetView<LikedListController> {
  const LikedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Liked List'.text.black.make(),
        leading: BtnBack(),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
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
