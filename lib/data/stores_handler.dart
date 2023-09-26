import 'dart:convert';

import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/models/variations_models.dart';

import '../models/commercial_models.dart';

//attributes

Future<List<Attribute>> getAttributesByVendorId(int vendorId) async {
  List<dynamic> attributes= jsonDecode(await getWithoutParams(suffix: 'attributes/vendor/$vendorId'));
  List<Attribute> result = attributes.map((e) => Attribute.fromJson(e)).toList();
  print(result.first.name);
  return result;
}

Future<List<Attribute>> getAttributesByShopId(int shopId) async {
  List<dynamic> attributes= jsonDecode(await getWithoutParams(suffix: 'attributes/shop/$shopId'));
  List<Attribute> result = attributes.map((e) => Attribute.fromJson(e)).toList();
  print(result.first.type);
  return result;
}

Future addAttribute(Attribute attribute) async {
  return jsonDecode(await postWithParams(suffix: 'attributes/add', body: attribute.toJson()));
}

Future editAttribute(Attribute attribute) async {
  return jsonDecode(await postWithParams(suffix: 'attributes/edit', body: attribute.toJson()));
}

Future deleteAttribute(Attribute attribute) async {
  return jsonDecode(await postWithParams(suffix: 'attributes/delete', body: attribute.toJson()));
}

//values

Future<List<Value>> getValuesByAttributeId(int attributeId) async {
  List<dynamic> values = jsonDecode(await getWithoutParams(suffix: 'values/attribute/$attributeId'));
  List<Value> result = values.map((e) => Value.fromJson(e)).toList();
  print(result.first.attributeId);
  return result;
}

Future addValue(Value value) async {
  return jsonDecode(await postWithParams(suffix: 'values/add', body: value.toJson()));
}

Future editValue(Value value) async {
  return jsonDecode(await postWithParams(suffix: 'values/edit', body: value.toJson()));
}

Future deleteValue(Value value) async {
  return jsonDecode(await postWithParams(suffix: 'values/delete', body: value.toJson()));
}

//shops

Future<List<Shop>> getAllShops() async {
  List<dynamic> shops = jsonDecode(await getWithoutParams(suffix: 'shops'));
  List<Shop> result = shops.map((e) => Shop.fromJson(e)).toList();
  print(result.first.ownerName);
  return result;
}

Future<Shop> getShopById(int shopId) async {
  Shop result = Shop.fromJson( jsonDecode(await getWithoutParams(suffix: 'shops/$shopId')));
  print(result.from);
  return result;
}

Future<List<Shop>> getShopsByAreaId(int areaId) async {
  List<dynamic> shops = jsonDecode(await getWithoutParams(suffix: 'shops/area/$areaId'));
  List<Shop> result = shops.map((e) => Shop.fromJson(e)).toList();
  print(result.first.ownerName);
  return result;
}

Future<List<Shop>> getShopsByCategoryId(int categoryId) async {
  List<dynamic> shops = jsonDecode(await getWithoutParams(suffix: 'shops/category/$categoryId'));
  List<Shop> result = shops.map((e) => Shop.fromJson(e)).toList();
  print(result.first.ownerName);
  return result;
}

Future<List<Shop>> getShopsBySubcategoryId(int subcategoryId) async {
  List<dynamic> shops = jsonDecode(await getWithoutParams(suffix: 'shops/subcategory/$subcategoryId'));
  List<Shop> result = shops.map((e) => Shop.fromJson(e)).toList();
  print(result.first.ownerName);
  return result;
}

Future addShop(Shop shop) async {
  return jsonDecode(await postWithParams(suffix: 'shops/add', body: shop.toJson()));
}

Future editShop(Shop shop) async {
  return jsonDecode(await postWithParams(suffix: 'shops/edit', body: shop.toJson()));
}

Future deleteShop(Shop shop) async {
  return jsonDecode(await postWithParams(suffix: 'shops/delete', body: shop.toJson()));
}

Future saveShopImage(String filePath) => uploadImage(filePath: filePath, apiCompletion: 'shops/saveImage');



