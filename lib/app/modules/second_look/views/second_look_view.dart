import 'package:dating_demo/all_file/all_file.dart';

class SecondLookView extends StatefulWidget {
  const SecondLookView({Key? key}) : super(key: key);

  @override
  State<SecondLookView> createState() => _SecondLookViewState();
}

class _SecondLookViewState extends State<SecondLookView> {

  final userService = Get.find<UserRepo>();
  List<UserEntity>? secondLookUserList;

  @override
  void initState() {
    secondLookUserList = userService.getSecondLookUserList();
    super.initState();
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
