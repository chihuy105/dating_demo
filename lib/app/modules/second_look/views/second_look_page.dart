import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/core/utils/mixin/mixin_auto_route_resume.dart';

class SecondLookPage extends StatefulWidget {
  const SecondLookPage({Key? key}) : super(key: key);

  @override
  State<SecondLookPage> createState() => _SecondLookPageState();
}

class _SecondLookPageState extends State<SecondLookPage>
    with AutoRouteTabResume {
  final userService = Get.find<UserRepo>();
  List<UserEntity>? secondLookUserList;

  @override
  void initState() {
    secondLookUserList = userService.getSecondLookUserList();
    super.initState();
  }

  @override
  void onResume() {
    setState(() {
      secondLookUserList = userService.getSecondLookUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Second Look'.text.black.make(),
        centerTitle: true,
        leading: const BtnBack(),
      ),
      body: Center(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: secondLookUserList?.length,
            itemBuilder: (context, index) {
              return UserItem(
                userEntity: secondLookUserList.getOrNull(index),
              );
            }),
      ),
    );
  }
}
