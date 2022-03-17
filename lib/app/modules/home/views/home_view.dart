import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/modules/home/bloc/user_list_cubit.dart';
import 'package:dating_demo/app/modules/home/views/user_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final swipeItemList = <SwipeItem>[];
  final userService = Get.find<UserService>();

  late MatchEngine matchEngine;

  @override
  void initState() {
    matchEngine = MatchEngine(swipeItems: swipeItemList);
    super.initState();
  }

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

  Widget _buildSwipe(BuildContext context, state){
    logger.i('_buildSwipe');

    if (state is UserListLoading && state.isFirstFetch){
      return const CircularProgressIndicator();
    }
    var list = <UserEntity>[];
    if(state is UserListLoading){
      list = state.oldList;
    }else if (state is UserListLoaded){
      list = state.userList;
    }

    return SwipeCards(
      matchEngine: matchEngine,
      itemBuilder: (BuildContext context, int index) {
        var userEntity = list
            .getOrNull(index);
        return userEntity == null?Gaps.empty : UserCard(
          userEntity: userEntity,
          key: ValueKey(userEntity.id),
        );
      },
      onStackFinished: () {},
      itemChanged: (SwipeItem item, int index) {
        if ((index % 2) != 0) {
          context.read<UserListCubit>().loadData();
        }
      },
      upSwipeAllowed: true,
      fillSpace: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<UserListCubit>(
        create: (context) {
          return UserListCubit(userService)..loadData();
        },
        child: SafeArea(
            child: Column(
              children: [
                BlocConsumer<UserListCubit, UserListState>(
                    buildWhen: (last, current) => !(current is UserListLoading && current.isFirstFetch),
                    builder: _buildSwipe,
                    listener: (_, state) {
                      if(state is UserListLoaded){
                        swipeItemList.clear();
                        swipeItemList.addAll(state.userList.mapAsList((userEntity) => SwipeItem(
                            content: userEntity,
                            likeAction: () => {userService.addLikedUserData(userEntity)},
                            superlikeAction: () => {userService.addLikedUserData(userEntity)},
                            nopeAction: () => {userService.addSecondLookUserData(userEntity)})));
                      }
                    },
                ).px16().expand(),
                Gaps.vGap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBtn(Icons.close, Colors.red, () {
                      matchEngine.currentItem?.nope();
                    }),
                    _buildBtn(Icons.star, Colors.blue, () {
                      matchEngine.currentItem?.superLike();
                    }),
                    _buildBtn(Icons.favorite, Colors.green, () {
                      matchEngine.currentItem?.like();
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
      ),
    );
  }
}
