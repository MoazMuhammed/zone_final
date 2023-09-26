import 'dart:convert';
import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/models/commercial_models.dart';
import '../models/categories_models.dart';

//shop categories

Future<List<ShopCategory>> getAllShopCategories() async {
  List<dynamic> categories = jsonDecode(await getWithoutParams(suffix: 'categories'));
  List<ShopCategory> result = categories.map((e) => ShopCategory.fromJson(e)).toList();
  return result;
}

Future<ShopCategory> getShopCategoryById(int categoryId) async {
  ShopCategory result = ShopCategory.fromJson(jsonDecode( await getWithoutParams(suffix: 'categories/$categoryId')));
  return result;
}

//subcategories

Future<List<SubCategory>> getAllSubCategories() async {
  List<dynamic> subCategories = jsonDecode(await getWithoutParams(suffix: 'subcategories'));
  List<SubCategory> result = subCategories.map((e) => SubCategory.fromJson(e)).toList();
  return result;
}

Future<SubCategory> getSubCategoryById(int subcategoryId) async {
  SubCategory result = SubCategory.fromJson(jsonDecode( await getWithoutParams(suffix: 'subcategories/$subcategoryId')));
  print(result.name);
  return result;
}

Future<List<SubCategory>> getSubCategoriesByCategoryId(int categoryId) async {
  List<dynamic> subCategories = jsonDecode(await getWithoutParams(suffix: 'subcategories/category/$categoryId'));
  List<SubCategory> result = subCategories.map((e) => SubCategory.fromJson(e)).toList();
  return result;
}

//product sections

Future addProductSection(ProductSection section) async {
  return jsonDecode(await postWithParams(suffix: 'sections/add', body: section.toJson()));
}

Future editProductSection(ProductSection section) async {
  return jsonDecode(await postWithParams(suffix: 'sections/edit', body: section.toJson()));
}

Future deleteProductSection(ProductSection section) async {
  return jsonDecode(await postWithParams(suffix: 'sections/delete', body: section.toJson()));
}

Future<List<ProductSection>> getSectionsByShopId(int shopId) async {
  List<dynamic> sections = jsonDecode(await getWithoutParams(suffix: 'sections/shop/$shopId'));
  List<ProductSection> result = sections.map((e) => ProductSection.fromJson(e)).toList();
  print(result.first.shopId);
  return result;
}

Future<ProductSection> getSectionById(int sectionId) async {
  ProductSection result = ProductSection.fromJson(jsonDecode(await getWithoutParams(suffix: 'sections/$sectionId')));
  print(result.name);
  return result;
}

//offers

Future<List<Offer>> getAllOffers() async {
  List<dynamic> offers = jsonDecode(await getWithoutParams(suffix: 'offers'));
  List<Offer> result = offers.map((e) => Offer.fromJson(e)).toList();
  print(result.first.type);
  return result;
}

Future<Offer> getOfferById(int offerId) async {
  Offer result = Offer.fromJson(jsonDecode(await getWithoutParams(suffix: 'offers/$offerId')));
  print(result.active);
  return result;
}

Future<List<Offer>> getOffersByShopId(int shopId) async {
  List<dynamic> offers = jsonDecode(await getWithoutParams(suffix: 'offers/shop/$shopId'));
  List<Offer> result = offers.map((e) => Offer.fromJson(e)).toList();
  print(result.first.image);
  return result;
}

Future addOffer(Offer offer) async {
  return jsonDecode(await postWithParams(suffix: 'offers/add', body: offer.toJson()));
}

Future editOffer(Offer offer) async {
  return jsonDecode(await postWithParams(suffix: 'offers/edit', body: offer.toJson()));
}

Future deleteOffer(Offer offer) async {
  return jsonDecode(await postWithParams(suffix: 'offers/delete', body: offer.toJson()));
}

Future saveOfferImage(String filePath) => uploadImage(filePath: filePath, apiCompletion: 'offers/saveImage');

//vouchers

Future<List<Voucher>> getAllVouchers() async {
  List<dynamic> vouchers = jsonDecode(await getWithoutParams(suffix: 'vouchers'));
  List<Voucher> result = vouchers.map((e) => Voucher.fromJson(e)).toList();
  print(result.first.expire);
  return result;
}

Future<Voucher> getVoucherById(int voucherId) async {
  Voucher result = Voucher.fromJson(jsonDecode(await getWithoutParams(suffix: 'vouchers/$voucherId')));
  print(result.amount);
  return result;
}

Future<List<Voucher>> getVouchersByShopId(int shopId) async {
  List<dynamic> vouchers = jsonDecode(await getWithoutParams(suffix: 'vouchers/shop/$shopId'));
  List<Voucher> result = vouchers.map((e) => Voucher.fromJson(e)).toList();
  print(result.first.amount);
  return result;
}

Future addVoucher(Voucher voucher) async {
  return jsonDecode(await postWithParams(suffix: 'vouchers/add', body: voucher.toJson()));
}

Future editVoucher(Voucher voucher) async {
  return jsonDecode(await postWithParams(suffix: 'vouchers/edit', body: voucher.toJson()));
}

Future deleteVoucher(Voucher voucher) async {
  return jsonDecode(await postWithParams(suffix: 'vouchers/delete', body: voucher.toJson()));
}

Future saveVoucherImage(String filePath) => uploadImage(filePath: filePath, apiCompletion: 'vouchers/saveImage');



//products

Future<List<Product>> getAllProducts() async {
  List<dynamic> products = jsonDecode(await getWithoutParams(suffix: 'products'));
  List<Product> result = products.map((e) => Product.fromJson(e)).toList();
  print(result.first.shopId);
  return result;
}

Future<Product> getProductById(int productId) async {
  Product result = Product.fromJson(jsonDecode(await getWithoutParams(suffix: 'products/$productId')));
  print(result.price);
  return result;
}

Future<List<Product>> getProductsByShopId(int shopId) async {
  List<dynamic> products = jsonDecode(await getWithoutParams(suffix: 'products/shop/$shopId'));
  List<Product> result = products.map((e) => Product.fromJson(e)).toList();
  print(result.first.shopId);
  return result;
}

Future<List<Product>> getProductsByCategoryId(int categoryId) async {
  List<dynamic> products = jsonDecode(await getWithoutParams(suffix: 'products/category/$categoryId'));
  List<Product> result = products.map((e) => Product.fromJson(e)).toList();
  print(result.first.shopId);
  return result;
}

Future<List<Product>> getProductsBySubcategoryId(int subcategoryId) async {
  List<dynamic> products = jsonDecode(await getWithoutParams(suffix: 'products/subcategory/$subcategoryId'));
  List<Product> result = products.map((e) => Product.fromJson(e)).toList();
  print(result.first.shopId);
  return result;
}

Future<List<Product>> getProductsBySectionId(int sectionId) async {
  List<dynamic> products =jsonDecode(await getWithoutParams(suffix: 'products/section/$sectionId'));
  List<Product> result = products.map((e) => Product.fromJson(e)).toList();
  print(result.first.shopId);
  return result;
}

Future<List<Product>> getProductsFeatured() async {
  List<dynamic> products = jsonDecode(await getWithoutParams(suffix: 'products/featured'));
  List<Product> result = products.map((e) => Product.fromJson(e)).toList();
  print(result.first.shopId);
  return result;
}

Future addProduct(Product product) async {
  return jsonDecode(await postWithParams(suffix: 'products/add', body: product.toJson()));
}

Future editProduct(Product product) async {
  return jsonDecode(await postWithParams(suffix: 'products/edit', body: product.toJson()));
}

Future deleteProduct(Product product) async {
  return jsonDecode(await postWithParams(suffix: 'products/delete', body: product.toJson()));
}

Future saveProductImage(String filePath) => uploadImage(filePath: filePath, apiCompletion: 'products/saveImage');




