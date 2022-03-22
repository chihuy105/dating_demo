import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/widgets/image/blend_bottom.dart';

class UserCard extends StatefulWidget {
  final UserEntity userEntity;

  const UserCard({Key? key, required this.userEntity}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final _userService = Get.find<UserRepo>();
  final _ageLD = Rx<String?>('');

  @override
  void initState() {
    if (widget.userEntity.id != null && _ageLD.value != null) {
      _userService.getUserAge(widget.userEntity.id!).then((value) {
        _ageLD.value = value.toString();
      });
    }
    super.initState();
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
              widget.userEntity.picture,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  widget.userEntity.getFullName()?.text.xl3.white.make() ?? Gaps.empty,
                  Gaps.hGap12,
                  Obx(() => _ageLD.value?.text.xl3.white.make() ?? Gaps.empty),
                ],
              ),
              Gaps.vGap8,
              Row(
                children: [
                  const Icon(
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



class _UserAge extends StatefulWidget {
  final String? age;
  const _UserAge({Key? key, this.age}) : super(key: key);

  @override
  State<_UserAge> createState() => _UserAgeState();
}

class _UserAgeState extends State<_UserAge> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

