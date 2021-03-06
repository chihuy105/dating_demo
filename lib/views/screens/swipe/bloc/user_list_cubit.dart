import 'package:dating_demo/all_file/all_file.dart';
import 'package:swipe_cards/swipe_cards.dart';

part 'user_list_state.dart';

/// This bloc will check all the case for a paging logic
/// 1. Return data
/// 2. Return empty data
/// 3. Return Error when crash
/// 4. Load by page
///
class UserListCubit extends Cubit<UserListState> {
  late final UserRepo _userService;
  final swipeItemList = <SwipeItem>[];
  int page = 1;

  UserListCubit({UserRepo? userService}) : super(const UserListInitial(UserListData())) {
    _userService = userService ?? Get.find<UserRepo>();
  }

  Future<void> loadData() async {
    if (state is UserListLoading) {
      return;
    }
    try {
      emit(UserListLoading(state.data.copyWith(isFirstFetch: page == 1)));

      var fetchUserList = await _userService.fetchUserList(page: page);
      ++page;

      final list = state.data.list;

      emit(UserListLoaded(newList: fetchUserList, data: state.data.copyWith(list: [...list,...fetchUserList])));
    } catch (e) {
      logger.e('UserList loadData fail');
      emit(UserListError(error: 'UserList loadData fail', data: state.data));
    }
  }
}
