import 'dart:async';
import 'package:dating_demo/all_file/all_file.dart';
import 'package:swipe_cards/swipe_cards.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit(this.userService) : super(UserListInitial());

  final UserService userService;
  final swipeItemList = <SwipeItem>[];

  int page = 1;

  void loadData(){
    if (state is UserListLoading)
      return;

    final curState = state;
    var oldList = <UserEntity>[];
    if (curState is UserListLoaded){
      oldList = curState.userList;
    }

    emit(UserListLoading(oldList, isFirstFetch: page == 1));

    userService.fetchUserList(page: page).then((value) {
      ++page;

      final list = (state as UserListLoading).oldList;
      list.addAll(value);

      emit(UserListLoaded(list));
    });
  }
}
