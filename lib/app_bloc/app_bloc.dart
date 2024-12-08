import 'package:bloc/bloc.dart';
import 'package:eigital_assessment/domain/user_model.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  /// i already know that persisting the data in bloc as an instance member is a bad practice !! but this is just an example
  /// we could persist the list locally or use a hydrated bloc that caches the states
  List<UserClass> currentlyLoadedUsers = [];
  SortType? lastSortType;
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      if (event is LoadUsersData) {
        emit(LoadUsersDataLoadingState());
        currentlyLoadedUsers = users;
        await Future.delayed(const Duration(seconds: 3));
        emit(LoadUsersDataSuccessState(users: currentlyLoadedUsers));
      } else if (event is PickUser) {
        /// this state must close the GuestBook + returns the current user data to the center pan
        /// why the delay? because we want to change the tile background color before we animate
        await Future.delayed(const Duration(milliseconds: 300));
        emit(PickUserState(
            pickedUser: currentlyLoadedUsers
                .firstWhere((el) => el.id == event.userId)));
      } else if (event is OpenGuestBook) {
        /// this state opens the guest book
        currentlyLoadedUsers = users;
        emit(OpenedGuestBookState(users: currentlyLoadedUsers));
      } else if (event is FilterUsers) {
        if ((event.filterString ?? '').isEmpty) {
          currentlyLoadedUsers = users;
          emit(FilterUsersResultState(filteredUsers: currentlyLoadedUsers));
        } else {
          final l =currentlyLoadedUsers
              .where((el) =>
          el.name.contains(event.filterString!) ||
              el.email.contains(event.filterString!) ||
              el.phoneNumber.contains(event.filterString!)).toList();
          currentlyLoadedUsers=l;
          emit(FilterUsersResultState(
              filteredUsers: currentlyLoadedUsers));
        }
      }else if(event is SortUsers){

        if(lastSortType==null||lastSortType==SortType.desc){
          currentlyLoadedUsers.sort((a,b)=>  a.name.compareTo(b.name));
          lastSortType= SortType.asc;
        }else if(lastSortType == SortType.asc){
          currentlyLoadedUsers.sort((a,b)=>  b.name.compareTo(a.name));
          lastSortType= SortType.desc;
        }
        emit(SortUsersResultState(sortedUsers: currentlyLoadedUsers));
      }
    });
  }
}
