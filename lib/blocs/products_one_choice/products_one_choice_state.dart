part of 'products_one_choice_bloc.dart';

@immutable
abstract class ProductsOneChoiceState {}

class ProductsOneChoiceChanged extends ProductsOneChoiceState {
  final int categoryIndex;
  final int shopIndex;
  final int subCategoryIndex;
  ProductsOneChoiceChanged({
    required this.categoryIndex,
    required this.shopIndex,
    required this.subCategoryIndex
});
}
