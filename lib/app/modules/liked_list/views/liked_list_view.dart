import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/core/utils/mixin/mixin_auto_route_resume.dart';

class LikedListView extends StatefulWidget {
  const LikedListView({Key? key}) : super(key: key);

  @override
  State<LikedListView> createState() => _LikedListViewState();
}

class _LikedListViewState extends State<LikedListView> with AutoRouteTabResume {
  final userService = Get.find<UserRepo>();
  List<UserEntity>? list;

  @override
  void initState() {
    list = userService.getLikedUserList();
    super.initState();
  }

  @override
  void onResume() {
    setState(() {
      list = userService.getLikedUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Liked List'.text.black.make(),
        leading: const BtnBack(),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: list?.length ?? 0,
            itemBuilder: (context, index) {
              return UserItem(
                userEntity: list.getOrNull(index),
              );
            }),
      ),
    );
  }
}
