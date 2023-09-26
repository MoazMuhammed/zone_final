import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  int pageIndex = 0;
  LandingPageBloc() : super(LandingPageChanged(pageIndex: 0)) {
    on<LandingPageEvent>((event, emit) {
      if(event is LandingPageIndexChangedEvent){
        pageIndex = event.newIndex;
        emit(LandingPageChanged(pageIndex: pageIndex));
      }
      // TODO: implement event handler
    });
  }
}
