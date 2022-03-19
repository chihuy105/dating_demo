import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/core/utils/mixin/mixin_auto_route_resume.dart';

class SecondLookView extends StatefulWidget {
  const SecondLookView({Key? key}) : super(key: key);

  @override
  State<SecondLookView> createState() => _SecondLookViewState();
}

class _SecondLookViewState extends State<SecondLookView>
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
