part of 'address_bloc.dart';

@immutable
abstract class AddressState {}

class AddressChanged extends AddressState {
  final double lat;
  final double lng;
  AddressChanged({required this.lat,required this.lng});
}
