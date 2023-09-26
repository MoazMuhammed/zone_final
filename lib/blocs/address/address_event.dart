part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}

class AddressChangeEvent extends AddressEvent {
  final double lat;
  final double lng;
  AddressChangeEvent({required this.lat,required this.lng});
}
