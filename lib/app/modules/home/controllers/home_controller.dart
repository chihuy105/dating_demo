import 'package:dating_demo/all_file/all_file.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeController extends GetxController {
  MatchEngine matchEngine = MatchEngine(swipeItems: []);
  final RxList<SwipeItem> swipeItemLD = RxList<SwipeItem>();

  @override
  void onInit() {
    super.onInit();
    swipeItemLD.value = [
      'https://static.wikia.nocookie.net/disney/images/4/49/Ash_Pikachu.png/revision/latest?cb=20200621234841&path-prefix=vi',
      'https://cdn.tgdd.vn/Files/2016/07/11/854712/hinh-nen-pikachu-cho-dien-thoai-hd-6.jpg',
      'https://nguoinoitieng.tv/images/nnt/96/0/bbi0.jpg'
    ].mapAsList((v) => SwipeItem(
        content: v,
        likeAction: () => {
          // Store to list
        },
        superlikeAction: () => {
          // Store to list
        },
        nopeAction: () => {
          // Store to list
        }));
    matchEngine = MatchEngine(swipeItems: swipeItemLD);
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 4)).then((value) {
      swipeItemLD.addAll([
        'https://nguoinoitieng.tv/images/nnt/96/0/bbi0.jpg',
        'https://cdn.tgdd.vn/Files/2016/07/11/854712/hinh-nen-pikachu-cho-dien-thoai-hd-6.jpg',
        'https://static.wikia.nocookie.net/disney/images/4/49/Ash_Pikachu.png/revision/latest?cb=20200621234841&path-prefix=vi',
        'https://nguoinoitieng.tv/images/nnt/96/0/bbi0.jpg',
      ].mapAsList((v) => SwipeItem(
          content: v,
          likeAction: () => {
            // Store to list
          },
          superlikeAction: () => {
            // Store to list
          },
          nopeAction: () => {
            // Store to list
          })));
    });
  }

  @override
  void onClose() {}
}
