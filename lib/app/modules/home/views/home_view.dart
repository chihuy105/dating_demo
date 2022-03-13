import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/modules/home/views/user_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  _buildBtn(icon, color, onPress) {
    return BtnCircleIcon(
      icon,
      size: 55,
      backgroundColor: Colors.transparent,
      borderColor: color,
      iconSize: 30,
      iconColor: color,
      onPress: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Obx(() => !controller.swipeItemLD.isNullOrEmpty()
              ? SwipeCards(
                  matchEngine: controller.matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    var userEntity = controller.swipeItemLD
                        .getOrNull(index)
                        ?.content as UserEntity;
                    return UserCard(
                      userEntity: userEntity,
                      key: ValueKey(userEntity.id),
                    );
                  },
                  onStackFinished: () {},
                  itemChanged: (SwipeItem item, int index) {
                    if ((controller.swipeItemLD.length - index) == 5) {
                      controller.loadMore();
                    }
                  },
                  upSwipeAllowed: true,
                  fillSpace: true,
                )
              : Gaps.empty).px16().expand(),
          Gaps.vGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBtn(Icons.close, Colors.red, () {
                controller.matchEngine.currentItem?.nope();
              }),
              _buildBtn(Icons.star, Colors.blue, () {
                controller.matchEngine.currentItem?.superLike();
              }),
              _buildBtn(Icons.favorite, Colors.green, () {
                controller.matchEngine.currentItem?.like();
              })
            ],
          ).px16(),
          Gaps.vGap16,
          Container(
            color: Colors.grey,
            child: Row(
              children: [
                Btn(
                  child: 'Second Look'.text.white.make(),
                  leading: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  style: AppButton.textStyle(context,
                      backgroundColor: Colors.transparent),
                  onPressed: () => Get.toNamed(Routes.SECOND_LOOK),
                ).expand(),
                Gaps.hGap16,
                Btn(
                  child: 'Liked List'.text.white.make(),
                  leading: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  style: AppButton.textStyle(context,
                      backgroundColor: Colors.transparent),
                  onPressed: () => Get.toNamed(Routes.LIKED_LIST),
                ).expand(),
              ],
            ).px16(),
          ),
        ],
      )),
    );
  }
}
