import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/views/screens/swipe/views/user_card.dart';
import 'package:dating_demo/views/screens/swipe/bloc/user_list_cubit.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final swipeItemList = <SwipeItem>[];
  final userService = Get.find<UserRepo>();

  late MatchEngine matchEngine;

  @override
  void initState() {
    matchEngine = MatchEngine(swipeItems: swipeItemList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<UserListCubit>(
        create: (context) {
          return UserListCubit()..loadData();
        },
        child: SafeArea(
            child: Column(
          children: [
            _buildSwipeBloc().px16().expand(),
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
          ],
        )),
      ),
    );
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

  Widget _buildSwipe(BuildContext context, UserListState state) {

    if (state is UserListError && state.data.isFirstFetch) {
      return state.error.text.colorError(context).make().centered();
    }

    if (state is UserListLoading && state.data.isFirstFetch) {
      return const Center(child: CircularProgressIndicator());
    }
    var list = state.data.list;

    if (list.isNullOrEmpty()) {
      return 'No User found'.text.make().centered();
    }

    return SwipeCards(
      matchEngine: matchEngine,
      itemBuilder: (BuildContext context, int index) {
        var userEntity = list.getOrNull(index);
        return userEntity == null
            ? Gaps.empty
            : UserCard(
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

  Widget _buildSwipeBloc() {
    return BlocConsumer<UserListCubit, UserListState>(
      buildWhen: (last, current) =>
          (last is UserListLoading && last.data.isFirstFetch) ||
          (current is UserListError || current is UserListLoaded),
      builder: _buildSwipe,
      listenWhen: (last, current) => current is UserListLoaded,
      listener: (_, state) {
        if (state is UserListLoaded) {
          swipeItemList.addAll(state.newList.mapAsList((userEntity) =>
              SwipeItem(
                  content: userEntity,
                  likeAction: () => {userService.addLikedUserData(userEntity)},
                  superlikeAction: () =>
                      {userService.addLikedUserData(userEntity)},
                  nopeAction: () =>
                      {userService.addSecondLookUserData(userEntity)})));
        }
      },
    );
  }
}
