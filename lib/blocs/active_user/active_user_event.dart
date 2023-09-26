part of 'active_user_bloc.dart';

@immutable
abstract class ActiveUserEvent {}

class ActiveUserChangedEvent extends ActiveUserEvent{
  final String token;
  ActiveUserChangedEvent({required this.token});
}
