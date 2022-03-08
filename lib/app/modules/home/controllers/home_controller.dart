import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/controllers/mixin_paging.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeController extends GetxController with MixinPaging<UserEntity> {
  MatchEngine matchEngine = MatchEngine(swipeItems: [SwipeItem(content: '')]);
  final RxList<SwipeItem> swipeItemLD = RxList<SwipeItem>([]);
  final userService = Get.find<UserService>();

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

  @override
  void onListDataChange([List<UserEntity>? userList]) {
    swipeItemLD.clear();
    swipeItemLD.addAll(userList.mapAsList((userEntity) => SwipeItem(
        content: userEntity,
        likeAction: () => {userService.addLikedUserData(userEntity)},
        superlikeAction: () => {userService.addLikedUserData(userEntity)},
        nopeAction: () => {userService.addSecondLookUserData(userEntity)})));
  }

  @override
  void onClose() {}
}
