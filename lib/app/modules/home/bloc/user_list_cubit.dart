import 'dart:async';
import 'package:dating_demo/all_file/all_file.dart';
import 'package:swipe_cards/swipe_cards.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {

  late final UserRepo _userService;
  final swipeItemList = <SwipeItem>[];
  int page = 1;

  UserListCubit({UserRepo? userService}) : super(UserListInitial()){
    _userService = userService ?? Get.find<UserRepo>();
  }

  void loadData(){
    if (state is UserListLoading) {
      return;
    }

    final curState = state;
    var oldList = <UserEntity>[];
    if (curState is UserListLoaded){
      oldList = curState.userList;
    }

    emit(UserListLoading(oldList, isFirstFetch: page == 1));

    _userService.fetchUserList(page: page).then((value) {
      ++page;

      final list = (state as UserListLoading).oldList;
      list.addAll(value);

      emit(UserListLoaded(list, value));
    });
  }
}
