import 'package:dating_demo/all_file/all_file.dart';

import '../controllers/liked_list_controller.dart';

class LikedListView extends GetView<LikedListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked List'),
        leading: BtnBack(),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LikedListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
