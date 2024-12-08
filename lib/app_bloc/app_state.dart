part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  final List<UserClass> users;
  const AppState({required this.users});
}

final class AppInitial extends AppState {
  AppInitial() : super(users: []);
  @override
  List<Object> get props => [];
}

/// LoadUsersData
final class LoadUsersDataLoadingState extends AppState{
  LoadUsersDataLoadingState(): super(users: []);
  @override
  List<Object?> get props =>[];
}

final class LoadUsersDataSuccessState extends AppState{

  const LoadUsersDataSuccessState({required super.users});

  @override
  List<Object?> get props =>[super.users];
}
/// PickUser
final class PickUserState extends AppState{
  final UserClass pickedUser;
   PickUserState({required this.pickedUser,}):super(users: []);

  @override
  List<Object?> get props => [pickedUser];
}
/// OpenGuestBook
final class OpenedGuestBookState extends AppState{
  const OpenedGuestBookState({required super.users});
  @override
  List<Object?> get props => [];
}
/// FilterUsers
final class FilterUsersResultState extends AppState{
  final List<UserClass> filteredUsers;
  const FilterUsersResultState({required this.filteredUsers,}):super(users: filteredUsers);

  @override
  List<Object?> get props => [filteredUsers];
}
/// SortUsers
final class SortUsersResultState extends AppState{
  final List<UserClass> sortedUsers;
  const SortUsersResultState({required this.sortedUsers}):super(users:sortedUsers );

  @override
  List<Object?> get props => [sortedUsers];
}