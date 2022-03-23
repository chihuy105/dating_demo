import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/core/utils/mixin/mixin_auto_route_resume.dart';

class LikedListPage extends StatefulWidget {
  const LikedListPage({Key? key}) : super(key: key);

  @override
  State<LikedListPage> createState() => _LikedListPageState();
}

class _LikedListPageState extends State<LikedListPage> with AutoRouteTabResume {
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
