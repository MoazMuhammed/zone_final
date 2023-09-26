import 'dart:convert';
import 'package:zone_final/data/all_products_data.dart';
import '../models/user_models.dart';


Future saveImage(String filePath) => uploadImage(filePath: filePath,apiCompletion: 'client/saveImage');

Future addUser(Client client) async {
  return jsonDecode( await postWithParams(suffix: 'sanctum/register', body: client.toJson()));
}

Future updateUser(Client client) async {
  return jsonDecode( await postWithParams(suffix: 'client/update', body: client.toJson()));
}

Future<String> logIn(Map<String,dynamic> credentials) async {
  return jsonDecode( await postWithParams(suffix: 'sanctum/token', body: credentials));
}

Future logOut() async {
  return jsonDecode( await getWithoutParams(suffix: 'client/logout'));
}

Future<Client> getActiveUser() async {
  Client result = jsonDecode( await getWithoutParams(suffix: 'client/profile'));
  print(result.activeAddressId);
  return result;
}



