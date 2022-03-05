import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/controllers/mixin_paging.dart';
import 'package:dating_demo/app/data/model/user/user_resp.dart';
import 'package:dating_demo/app/data/services/user/user_service.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeController extends GetxController with MixinPaging<UserEntity> {
  MatchEngine matchEngine = MatchEngine(swipeItems: [SwipeItem(content: '')]);
  final RxList<SwipeItem> swipeItemLD = RxList<SwipeItem>([]);
  final userService = Get.find<UserService>();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    loadData(true);
    matchEngine = MatchEngine(swipeItems: swipeItemLD);
  }

  @override
  Future fetchListData(int page, int pageSize) {
    return userService.fetchUserList(page: page);
  }

  void onListDataChange([List<UserEntity>? userList]) {
    logger.i('New data');
    swipeItemLD.clear();
    swipeItemLD.addAll(userList.mapAsList((v) => SwipeItem(
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
  }

  @override
  void onClose() {}
}
