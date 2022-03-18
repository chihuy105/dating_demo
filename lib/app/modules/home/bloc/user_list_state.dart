part of 'user_list_cubit.dart';

class UserListData {
  final bool isFirstFetch;
  final List<UserEntity> list;

  const UserListData({
    this.isFirstFetch = false,
     this.list = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserListData &&
          runtimeType == other.runtimeType &&
          isFirstFetch == other.isFirstFetch &&
          list == other.list);

  @override
  int get hashCode => isFirstFetch.hashCode ^ list.hashCode;

  @override
  String toString() {
    return 'UserListData{' +
        ' isFirstFetch: $isFirstFetch,' +
        ' list: $list,' +
        '}';
  }

  UserListData copyWith({
    bool? isFirstFetch,
    List<UserEntity>? list,
  }) {
    return UserListData(
      isFirstFetch: isFirstFetch ?? this.isFirstFetch,
      list: list ?? this.list,
    );
  }
}

@immutable
abstract class UserListState {
  final UserListData data;

  const UserListState(this.data);
}

class UserListInitial extends UserListState {
  const UserListInitial(data) : super(data);
}

class UserListLoading extends UserListState {
  const UserListLoading(data) : super(data);
}

class UserListLoaded extends UserListState {
  final List<UserEntity> newList;

  const UserListLoaded({required this.newList, required UserListData data})
      : super(data);
}

class UserListError extends UserListState {
  final String error;

  const UserListError({required this.error, required UserListData data})
      : super(data);
}
