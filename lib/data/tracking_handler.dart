import 'dart:convert';
import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/models/tracking_models.dart';
import 'package:zone_final/models/user_models.dart';

//address

Future<List<Address>> getAllAddresses() async {
  List<dynamic> addresses = jsonDecode(await getWithoutParams(suffix: 'addresses/all'));
  List<Address> result = addresses.map((e) => Address.fromJson(e)).toList();
  print(result.first.landmark);
  return result;
}

Future<Address> getSingleAddress() async {
  Address result = Address.fromJson(jsonDecode(await getWithoutParams(suffix: 'addresses/single')));
  print(result.apartment);
  return result;
}

Future addAddress(Address address) async {
  return jsonDecode(await postWithParams(suffix: 'addresses/add',body: address.toJson()));
}

Future editAddress(Address address) async {
  return jsonDecode(await postWithParams(suffix: 'addresses/edit',body: address.toJson()));
}

//deliveries

Future<List<Delivery>> getAllDeliveries() async {
  List<dynamic> deliveries = jsonDecode(await getWithoutParams(suffix: 'deliveries'));
  List<Delivery> result = deliveries.map((e) => Delivery.fromJson(e)).toList();
  print(result.first.scooter);
  return result;
}

Future<Delivery> getDeliveryById(int deliveryId) async {
  Delivery result = Delivery.fromJson(jsonDecode(await getWithoutParams(suffix: 'deliveries/$deliveryId')));
  print(result.phone);
  return result;
}

Future<Delivery> getDeliveryByAreaId(int areaId) async {
  Delivery result = Delivery.fromJson(jsonDecode(await getWithoutParams(suffix: 'deliveries/area/$areaId')));
  print(result.phone);
  return result;
}

//delivery order

Future<List<DeliveryOrder>> getAllDeliveryOrders() async {
  List<dynamic> deliveryOrders = jsonDecode(await getWithoutParams(suffix: 'deliveries_orders'));
  List<DeliveryOrder> result = deliveryOrders.map((e) => DeliveryOrder.fromJson(e)).toList();
  print(result.first.orderId);
  return result;
}

Future<List<DeliveryOrder>> getDeliveryOrdersByClientId() async {
  List<dynamic> deliveryOrders = jsonDecode(await postWithParams(suffix: 'deliveries_orders/client', body: {}));
  List<DeliveryOrder> result = deliveryOrders.map((e) => DeliveryOrder.fromJson(e)).toList();
  print(result.first.orderId);
  return result;
}

Future<List<DeliveryOrder>> getDeliveryOrdersByAreaId(int areaId) async {
  List<dynamic> deliveryOrders = jsonDecode(await getWithoutParams(suffix: 'deliveries_orders/area/$areaId'));
  List<DeliveryOrder> result = deliveryOrders.map((e) => DeliveryOrder.fromJson(e)).toList();
  print(result.first.orderId);
  return result;
}

//rejected orders

Future<List<RejectedOrder>> getAllRejectedOrders() async {
  List<dynamic> rejectedOrders = jsonDecode(await getWithoutParams(suffix: 'deliveries_rejects'));
  List<RejectedOrder> result = rejectedOrders.map((e) => RejectedOrder.fromJson(e)).toList();
  print(result.first.orderId);
  return result;
}

Future<List<RejectedOrder>> getRejectedOrdersByClientId() async {
  List<dynamic> rejectedOrders = jsonDecode(await postWithParams(suffix: 'deliveries_rejects/client', body: {}));
  List<RejectedOrder> result = rejectedOrders.map((e) => RejectedOrder.fromJson(e)).toList();
  print(result.first.orderId);
  return result;
}

//delivery requests

Future<List<DeliveryRequest>> getAllDeliveryRequests() async {
  List<dynamic> deliveryRequests = jsonDecode(await getWithoutParams(suffix: 'deliveries_requests'));
  List<DeliveryRequest> result = deliveryRequests.map((e) => DeliveryRequest.fromJson(e)).toList();
  print(result.first.orderId);
  return result;
}

Future<List<DeliveryRequest>> getDeliveryRequestsByAreaId(int areaId) async {
  List<dynamic> deliveryRequests = jsonDecode(await getWithoutParams(suffix: 'deliveries_requests/area/$areaId'));
  List<DeliveryRequest> result = deliveryRequests.map((e) => DeliveryRequest.fromJson(e)).toList();
  print(result.first.orderId);
  return result;
}

Future acceptDeliveryRequest() async {
  return jsonDecode(await postWithParams(suffix: 'deliveries_requests/accept', body: {}));
}

Future rejectDeliveryRequest() async {
  return jsonDecode(await postWithParams(suffix: 'deliveries_requests/reject', body: {}));
}
