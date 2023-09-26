import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_products_one_event.dart';
part 'all_products_one_state.dart';

class AllProductsOneBloc extends Bloc<AllProductsOneEvent, AllProductsOneState> {
  bool searchActivated = false;
  AllProductsOneBloc() : super(AllProductsOneChanged(searchActivated: false)) {
    on<AllProductsOneEvent>((event, emit) {
      if(event is SearchToggleEvent){
        searchActivated = !searchActivated;
        emit(AllProductsOneChanged(searchActivated: searchActivated));
      }// TODO: implement event handler
    });
  }
}
