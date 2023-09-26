part of 'all_products_one_bloc.dart';

@immutable
abstract class AllProductsOneState {}

class AllProductsOneChanged extends AllProductsOneState {
  final bool searchActivated;
  AllProductsOneChanged({required this.searchActivated});
}
