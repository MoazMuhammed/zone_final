
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  double lat = 30.0444;
  double lng=31.2357;
  AddressBloc() : super(AddressChanged(lat: 30.0444,lng: 31.2357)) {
    on<AddressEvent>((event, emit) {
      // TODO: implement event handler
      if(event is AddressChangeEvent){
        lat = event.lat;
        lng = event.lng;
        emit(AddressChanged(lat: lat, lng: lng));
      }
    });
  }
}
