part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

class LoadUsersData extends AppEvent {
  @override
  List<Object?> get props => [];
}

class PickUser extends AppEvent {
  final String userId;

  const PickUser({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class OpenGuestBook extends AppEvent {
  const OpenGuestBook();

  @override
  List<Object?> get props => [];
}

class FilterUsers extends AppEvent {
  final String? filterString;

  const FilterUsers({this.filterString});

  @override
  List<Object?> get props => [filterString];
}

class SortUsers extends AppEvent {
  const SortUsers();
  @override
  List<Object?> get props => [];
}

enum SortType { asc, desc }
