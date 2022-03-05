import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/modules/home/views/user_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

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
              SwipeCards(
                matchEngine: controller.matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(
                    avatar: controller.swipeItemLD
                        .getOrNull(index)
                        ?.content,
                    name: "Chi",
                    age: "25",
                  );
                },
                onStackFinished: () {},
                itemChanged: (SwipeItem item, int index) {},
                upSwipeAllowed: true,
                fillSpace: true,
              ).px16().expand(),
              Gaps.vGap16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBtn(Icons.close, Colors.red, () {

                  }),
                  _buildBtn(Icons.star, Colors.blue, () {

                  }),
                  _buildBtn(Icons.favorite, Colors.green, () {

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
                      leading: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      style: AppButton.textStyle(context,backgroundColor: Colors.transparent),
                      onPressed: () => Get.toNamed(Routes.SECOND_LOOK),
                    ).expand(),
                    Gaps.hGap16,
                    Btn(
                      child: 'Liked List'.text.white.make(),
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      style: AppButton.textStyle(context,backgroundColor: Colors.transparent),
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
