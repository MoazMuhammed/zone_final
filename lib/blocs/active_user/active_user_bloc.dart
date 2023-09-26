import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'active_user_event.dart';
part 'active_user_state.dart';

class ActiveUserBloc extends Bloc<ActiveUserEvent, ActiveUserState> {
  String token = '';
  ActiveUserBloc() : super(ActiveUserInitial()) {
    on<ActiveUserEvent>((event, emit) {
      // TODO: implement event handler
      if(event is ActiveUserChangedEvent){
        token = event.token;
        emit(ActiveUserChanged(token:token ));
      }
    });
  }
}
