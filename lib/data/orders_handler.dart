import 'dart:convert';
import 'package:zone_final/data/all_products_data.dart';
import '../models/commercial_models.dart';
import '../models/ordering_models.dart';

//cart

Future<Cart> getCart(int clientId) async{
  Cart result = Cart.fromJson(jsonDecode(await postWithParams(suffix: 'carts/client', body: {'client_id':clientId})));
  print(result.clientId);
  return result;
}

//cart items

Future<List<CartItem>> getCartItems(int clientId) async {
  List<dynamic> cartItems = jsonDecode(await postWithParams(suffix: 'cart_items/client', body: {'client_id':clientId}));
  List<CartItem> result = cartItems.map((e) => CartItem.fromJson(e)).toList();
  print(result.first.price);
  return result;
}

Future addCartItem(CartItem cartItem) async {
  return jsonDecode(await postWithParams(suffix: 'cart_items/add', body: cartItem.toJson()));
}

Future deleteCartItem(CartItem cartItem) async {
  return jsonDecode(await postWithParams(suffix: 'cart_items/delete', body: cartItem.toJson()));
}

Future deleteAllCartItems(Cart cart) async {
  return jsonDecode(await postWithParams(suffix: 'cart_items/deleteAll', body: cart.toJson()));
}

//favourites

Future<List<Favourite>> getFavouritesByClientId(int clientId) async {
  List<dynamic> favourites = jsonDecode(await postWithParams(suffix: 'favourites/client', body: {'client_id':clientId}));
  List<Favourite> result = favourites.map((e) => Favourite.fromJson(e)).toList();
  print(result.first.image);
  return result;
}

Future addToFavourites(Favourite favourite) async {
  return jsonDecode(await postWithParams(suffix: 'favourites/add', body: favourite.toJson()));
}

Future removeFromFavourites(Favourite favourite) async {
  return jsonDecode(await postWithParams(suffix: 'favourites/remove', body: favourite.toJson()));
}

//orders

Future addOrder(Order order) async {
  return jsonDecode(await postWithParams(suffix: 'orders/add', body: order.toJson()));
}

Future updateOrder(Order order) async {
  return jsonDecode(await postWithParams(suffix: 'orders/update', body: order.toJson()));
}

Future<Order> getOrderById(int orderId) async {
  Order result = Order.fromJson(jsonDecode(await getWithoutParams(suffix: 'orders/$orderId')));
  print(result.deliveryId);
  return result;
}

Future<Order> getOrderByStatus(String status) async {
  Order result = Order.fromJson(jsonDecode(await getWithoutParams(suffix: 'orders/status/$status')));
  print(result.deliveryId);
  return result;
}

Future<List<Order>> getCurrentOrdersByClientId(int clientId) async {
  List<dynamic> orders = jsonDecode(await getWithoutParams(suffix: 'orders/client/current/$clientId'));
  List<Order> result = orders.map((e) => Order.fromJson(e)).toList();
  print(result.first.total);
  return  result;
}

Future<List<Order>> getCurrentOrdersByShopId(int shopId) async {
  List<dynamic> orders = jsonDecode(await getWithoutParams(suffix: 'orders/shop/current/$shopId')) ;
  List<Order> result = orders.map((e) => Order.fromJson(e)).toList();
  print(result.first.total);
  return  result;
}

Future<List<Order>> getCurrentOrdersByVendorId(int vendorId) async {
  List<dynamic> orders = jsonDecode(await getWithoutParams(suffix: 'orders/vendor/current/$vendorId'));
  List<Order> result = orders.map((e) => Order.fromJson(e)).toList();
  print(result.first.total);
  return  result;
}

Future<List<Order>> getPastOrdersByClientId(int clientId) async {
  List<dynamic> orders = jsonDecode(await getWithoutParams(suffix: 'orders/client/past/$clientId')) ;
  List<Order> result = orders.map((e) => Order.fromJson(e)).toList();
  print(result.first.total);
  return  result;
}

Future<List<Order>> getPastOrdersByShopId(int shopId) async {
  List<dynamic> orders = jsonDecode(await getWithoutParams(suffix: 'orders/shop/past/$shopId'));
  List<Order> result = orders.map((e) => Order.fromJson(e)).toList();
  print(result.first.total);
  return  result;
}

Future<List<Order>> getPastOrdersByVendorId(int vendorId) async {
  List<dynamic> orders = jsonDecode(await getWithoutParams(suffix: 'orders/vendor/past/$vendorId'));
  List<Order> result = orders.map((e) => Order.fromJson(e)).toList();
  print(result.first.total);
  return  result;
}

//order items

Future<List<OrderItem>> getOrderItemsByOrderId(int orderId) async {
  List<dynamic> orderItems = jsonDecode(await getWithoutParams(suffix: 'order_items/order/$orderId'));
  List<OrderItem> result = orderItems.map((e) => OrderItem.fromJson(e)).toList();
  print(result.first.count);
  return  result;
}

Future<List<OrderItem>> getOrderItemsByShopId(int shopId) async {
  List<dynamic> orderItems = jsonDecode(await getWithoutParams(suffix: 'order_items/shop/$shopId'));
  List<OrderItem> result = orderItems.map((e) => OrderItem.fromJson(e)).toList();
  print(result.first.count);
  return  result;
}

Future<List<OrderItem>> getOrderItemsByClientId(int clientId) async {
  List<dynamic> orderItems = jsonDecode(await getWithoutParams(suffix: 'order_items/client/$clientId'));
  List<OrderItem> result = orderItems.map((e) => OrderItem.fromJson(e)).toList();
  print(result.first.count);
  return  result;
}

Future<List<OrderItem>> getOrderItemsByVendorId(int vendorId) async {
  List<dynamic> orderItems = jsonDecode(await getWithoutParams(suffix: 'order_items/vendor/$vendorId'));
  List<OrderItem> result = orderItems.map((e) => OrderItem.fromJson(e)).toList();
  print(result.first.count);
  return  result;
}
