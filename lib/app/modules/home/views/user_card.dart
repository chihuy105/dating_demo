import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/data/model/user/user_resp.dart';
import 'package:dating_demo/app/widgets/image/blend_bottom.dart';

class UserCard extends StatelessWidget {
  final String? avatar;
  final String? name;
  final String? age;

  const UserCard({Key? key, this.avatar, this.name, this.age,})
      : super(key: key);

  static UserCard byUserEntity(UserEntity user) {
    return UserCard(
      avatar: user.picture,
      name: user.firstName ?? '' + (user.lastName ?? ''),
      age: '25',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.onPrimary,
      child: Stack(
        fit: StackFit.expand,
        children: [
          BlendBottom(
            child: Img(
              avatar,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  name?.text.xl3.white.make() ?? Gaps.empty,
                  Gaps.hGap12,
                  age?.text.xl3.white.make() ?? Gaps.empty,
                ],
              ),
              Gaps.vGap8,
              Row(
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    color: Colors.green,
                    size: 15,
                  ),
                  Gaps.hGap8,
                  "Recently Active".text.thin.xl2.white.make(),
                ],
              ),
            ],
          ).p16().objectBottomLeft()
        ],
      ),
    ).cornerRadius(Dimens.rad_XL);
  }
}
