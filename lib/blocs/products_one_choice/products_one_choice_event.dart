part of 'products_one_choice_bloc.dart';

@immutable
abstract class ProductsOneChoiceEvent {}

class ChangeCategoryEvent extends ProductsOneChoiceEvent{
  final int newCategory;
  ChangeCategoryEvent({ required this.newCategory});
}
class ChangeShopEvent extends ProductsOneChoiceEvent{
  final int newShop;
  ChangeShopEvent({ required this.newShop});
}
class ChangeSubCategoryEvent extends ProductsOneChoiceEvent{
  final int newSubCategory;
  ChangeSubCategoryEvent({ required this.newSubCategory});
}
