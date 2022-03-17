part of 'user_list_cubit.dart';

@immutable
abstract class UserListState {}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {
  final List<UserEntity> oldList;
  final bool isFirstFetch;

  UserListLoading(this.oldList, {this.isFirstFetch = false});
}

class UserListLoaded extends UserListState {
  final List<UserEntity> userList;

  UserListLoaded(this.userList);
}

class UserListError extends UserListState {}
