import 'package:dating_demo/all_file/all_file.dart';

import '../controllers/second_look_controller.dart';

class SecondLookView extends GetView<SecondLookController> {

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
            itemCount: 2,
            itemBuilder: (context, index) {
              return UserItem(
                age: '25',
                name: 'Chi',
                avatar: 'https://nguoinoitieng.tv/images/nnt/96/0/bbi0.jpg',
              );
            }),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final String? avatar;
  final String? name;
  final String? age;

  const UserItem({Key? key, this.avatar, this.name, this.age}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Img(
              avatar,
              fit: BoxFit.cover,
            ),
          ).expand(flex: 1),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (name??'').text.xl2.make(),
              (age??'').text.xl2.make()
            ],
          ).px16().expand(flex: 4)
        ],
      ),
    );
  }
}
