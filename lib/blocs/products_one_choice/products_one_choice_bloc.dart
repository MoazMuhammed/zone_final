import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_one_choice_event.dart';
part 'products_one_choice_state.dart';

class ProductsOneChoiceBloc extends Bloc<ProductsOneChoiceEvent, ProductsOneChoiceState> {
  int categoryIndex = 0;
  int shopIndex = 0;
  int subCategoryIndex = 0;
  ProductsOneChoiceBloc() : super(ProductsOneChoiceChanged(categoryIndex: 0, shopIndex: 0, subCategoryIndex: 0)) {
    on<ProductsOneChoiceEvent>((event, emit) {
      if(event is ChangeCategoryEvent){
        categoryIndex = event.newCategory;
        shopIndex = 0;
        subCategoryIndex = 0;
        emit(ProductsOneChoiceChanged(categoryIndex: categoryIndex, shopIndex:shopIndex, subCategoryIndex: subCategoryIndex));
      }else if(event is ChangeShopEvent){
        shopIndex = event.newShop;
        subCategoryIndex = 0;
        emit(ProductsOneChoiceChanged(categoryIndex: categoryIndex, shopIndex: shopIndex, subCategoryIndex: subCategoryIndex));
      }else if(event is ChangeSubCategoryEvent){
        subCategoryIndex = event.newSubCategory;
        emit(ProductsOneChoiceChanged(categoryIndex: categoryIndex, shopIndex: shopIndex, subCategoryIndex: subCategoryIndex));
      }
      // TODO: implement event handler
    });
  }
}
