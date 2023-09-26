part of 'active_user_bloc.dart';

@immutable
abstract class ActiveUserState {}

class ActiveUserInitial extends ActiveUserState {}

class ActiveUserChanged extends ActiveUserState {
  final String token;
  ActiveUserChanged({required this.token});
}

