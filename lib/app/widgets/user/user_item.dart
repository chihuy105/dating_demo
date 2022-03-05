import 'package:dating_demo/all_file/all_file.dart';

class UserItem extends StatelessWidget {
  final UserEntity? userEntity;

  const UserItem({Key? key, this.userEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Img(
              userEntity?.picture,
              fit: BoxFit.cover,
            ),
          ).expand(flex: 1),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (userEntity.getFullName()??'').text.xl2.make(),
            ],
          ).px16().expand(flex: 4)
        ],
      ),
    );
  }
}
