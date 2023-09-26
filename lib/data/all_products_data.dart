import 'dart:convert';
import 'package:zone_final/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Map<String,dynamic>> shoesList = [
  {
    'name':'Nike airmax 1',
    'price': 500.0,
    'image':'images/shoe1.png',
    'favourite': false,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'
  },
  {
    'name':'Nike airmax 2',
    'price': 600.0,
    'image':'images/shoe2.png',
    'favourite': false,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'

  },
  {
    'name':'Nike airmax 3',
    'price': 400.0,
    'image':'images/shoe3.png',
    'favourite': true,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'
  },
  {
    'name':'Nike airmax 4',
    'price': 600.0,
    'image':'images/shoe2.png',
    'favourite': false,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'

  },
];
List<Map<String,dynamic>> shirtsList = [
  {
    'name':'Nike shirt 1',
    'price': 500.0,
    'image':'images/shoe1.png',
    'favourite': false,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'

  },
  {
    'name':'Nike shirt 2',
    'price': 600.0,
    'image':'images/shoe2.png',
    'favourite': false,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'

  },
  {
    'name':'Nike shirt 3',
    'price': 400.0,
    'image':'images/shoe3.png',
    'favourite': true,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'

  },
  {
    'name':'Nike shirt 4',
    'price': 600.0,
    'image':'images/shoe2.png',
    'favourite': false,
    'description': 'A fancy sports shoes with great material and beautiful design that will make you comfortable'

  },
];
List<Map<String,dynamic>> categoriesList = [
  {
    'name':'Shoes',
    'products':shoesList
  },
  {
    'name':'Shirts',
    'products':shirtsList

  },
  {
    'name':'Sweet shirts',
    'products':shoesList

  },
  {
    'name':'Balls',
    'products':shirtsList

  },
];
List<double> allSizes = [40,40.5,41,41.5,42,42.5,43,43.5,44,44.5,45,45.5,46];
List<double> availableSizes = [40,41,41.5,42,43,43.5,44.5,45,45.5];

List<Map<String,dynamic>> shopsList = [
  {
    'name':'Nike',
    'image':'images/nikePNG.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'Adidas',
    'image':'images/adidas_logo.png',
    'description':'We offer fried chicken with fascinating secret gradients'

  },
  {
    'name':'Lacoste',
    'image':'images/lacoste_logo.png',
    'description':'We offer fried chicken with fascinating secret gradients'

  },
  {
    'name':'Zara',
    'image':'images/zara_logo.png',
    'description':'We offer fried chicken with fascinating secret gradients'

  },
  {
    'name':'Nike',
    'image':'images/nikePNG.png',
    'description':'We offer fried chicken with fascinating secret gradients'

  },
  {
    'name':'Adidas',
    'image':'images/adidas_logo.png',
    'description':'We offer fried chicken with fascinating secret gradients'

  },
  {
    'name':'Lacoste',
    'image':'images/lacoste_logo.png',
    'description':'We offer fried chicken with fascinating secret gradients'

  },
  {
    'name':'Zara',
    'image':'images/zara_logo.png',
    'description':'We offer fried chicken with fascinating secret gradients'

  },
];

List<Map<String,dynamic>> shopsListFood = [
  {
    'name':'kintacky fried chicken',
    'image':'images/kfc.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'mac',
    'image':'images/mac.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'pizza hut',
    'image':'images/pizza.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'kfc',
    'image':'images/kfc.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'mac',
    'image':'images/mac.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'pizza hut',
    'image':'images/pizza.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'kfc',
    'image':'images/kfc.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'mac',
    'image':'images/mac.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
  {
    'name':'pizza hut',
    'image':'images/pizza.png',
    'description':'We offer fried chicken with fascinating secret gradients'
  },
];
List<Map<String,dynamic>> cakesList = [
  {
    'name':'Cup cake with strawberry',
    'price': 50.0,
    'image':'images/cake1.png',
    'favourite': false,
    'description': 'Delicious and sweet \n baked with love.'
  },
  {
    'name':'Piece of chocolate cake',
    'price': 60.0,
    'image':'images/cake2.png',
    'favourite': false,
    'description': 'Delicious and sweet \n baked with love.'
  },
  {
    'name':'Cup chocolate cake',
    'price': 40.0,
    'image':'images/cake4.png',
    'favourite': false,
    'description': 'Delicious and sweet \n baked with love.'
  },
  {
    'name':'Chocolate cake with strawberry',
    'price': 50.0,
    'image':'images/cake3.png',
    'favourite': false,
    'description': 'Delicious and sweet \n baked with love.'
  },
];

List<String> ads = [
  'images/banner1.png',
  'images/banner2.png',
  'images/banner3.png',
  'images/banner4.png',
  'images/banner5.png',
];



List<Map<String,dynamic>> orders = [
  {
    'id':'ac32d43e',
    'shops': shopsList.where((element) => shopsList.indexOf(element)<4).toList(),
    'finished': true,
    'date_time':'12-11-2022 12:30',
    'state':0,
    'progress':0.5,
  },
  {
    'id':'fc32d55e',
    'shops': shopsList.where((element) => shopsList.indexOf(element)<4).toList(),
    'finished': true,
    'date_time':'12-11-2022 12:30',
    'state':1,
    'progress':0.5,
  },
  {
    'id':'an32r13e',
    'shops': shopsListFood.where((element) => shopsListFood.indexOf(element)<4).toList(),
    'finished': false,
    'date_time':'12-11-2022 12:30',
    'state':2,
    'progress':0.5,

  },
  {
    'id':'sb3342w2',
    'shops': shopsListFood.where((element) => shopsListFood.indexOf(element)<4).toList(),
    'finished': false,
    'date_time':'12-11-2022 12:30',
    'state':1,
    'progress':0.5,

  },
  {
    'id':'af15d43e',
    'shops': shopsList.where((element) => shopsList.indexOf(element)<4).toList(),
    'finished': true,
    'date_time':'12-11-2022 12:30',
    'state':0,
    'progress':0.8,
  }
];
List<Map<String,dynamic>> notifications = [
  {
    'id':'ac32d43e',
    'shop_image': 'images/adidas_logo.png',
    'shop_name': 'adidas',
    'details': 'A new offer for you',
    'date_time':'12-11-2022 12:30'
  },
  {
    'id':'fc32d55e',
    'shop_image': 'images/lacoste_logo.png',
    'shop_name': 'lacoste',
    'details': 'A new offer for you',
    'date_time':'12-11-2022 12:30'
  },
  {
    'id':'an32r13e',
    'shop_image': 'images/kfc.png',
    'shop_name': 'kfc',
    'details': 'A new offer for you',
    'date_time':'12-11-2022 12:30'
  },
  {
    'id':'sb3342w2',
    'shop_image': 'images/zara_logo.png',
    'shop_name': 'zara',
    'details': 'A new offer for you',
    'date_time':'12-11-2022 12:30'
  },
  {
    'id':'af15d43e',
    'shop_image': 'images/mac.png',
    'shop_name': 'Macdonald’s',
    'details': 'A new offer for you',
    'date_time':'12-11-2022 12:30'
  }
];

List<String> countries =[
  'Egypt',
  'Kwait',
  'United Emirates',
  'Saudi Arabia',
  'United States',
  'France',
  'Germany'
];

List<String> languages =[
  'Arabic',
  'English',
  'French',
  'German'
];


List<Map<String,dynamic>> cartItems =[
  {
    'name':'cake 1',
    'type':2,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake1.png',
    'favourite' : true,
    'amount':1,
  },
  {
    'name':'cake 2',
    'type':1,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake2.png',
    'favourite' : true,
    'amount':1,
  },
  {
    'name':'cake 3',
    'type':2,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake3.png',
    'favourite' : true,
    'amount':1,
  },
  {
    'name':'cake 4',
    'type':1,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake4.png',
    'favourite' : true,
    'amount':1,
  },
  {
    'name':'cake 5',
    'type':1,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake1.png',
    'favourite' : true,
    'amount':1,
  },
];

List<Map<String,dynamic>> favourites = [
  {
    'name':'cake 1',
    'type':2,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake1.png',
    'favourite' : true
  },
  {
    'name':'cake 2',
    'type':1,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake2.png',
    'favourite' : true

  },
  {
    'name':'cake 3',
    'type':2,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake3.png',
    'favourite' : true

  },
  {
    'name':'cake 4',
    'type':1,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake4.png',
    'favourite' : true

  },
  {
    'name':'cake 5',
    'type':1,
    'description':'Simply a cake with chocolate that will make you love all aspects of life',
    'price':255.0,
    'image':'images/cake1.png',
    'favourite' : true
  },
];


List<String> vouchers = [
  'New',
  'Already used',
  'expired',
];

List<Map<String,String>> faqs = [
  {
    'title':'Who are we ?',
    'details':'a;ofawfawf akwfnak.faw.fnawfln. a;lwfa.naw;falwf.awf aw;foawfla;wlfaw;mf a;owfawf;anwfkawf;n ;aowjflawf'
  },
  {
    'title':'What is our vision and mission ?',
    'details':'a;ofawfawf akwfnak.faw.fnawfln. a;lwfa.naw;falwf.awf aw;foawfla;wlfaw;mf a;owfawf;anwfkawf;n ;aowjflawf'
  },
  {
    'title':'How can i communicate with a store ?',
    'details':'a;ofawfawf akwfnak.faw.fnawfln. a;lwfa.naw;falwf.awf aw;foawfla;wlfaw;mf a;owfawf;anwfkawf;n ;aowjflawf'
  },
  {
    'title':'What is the refund policy ?',
    'details':'a;ofawfawf akwfnak.faw.fnawfln. a;lwfa.naw;falwf.awf aw;foawfla;wlfaw;mf a;owfawf;anwfkawf;n ;aowjflawf'
  },
  {
    'title':'Where do i report a store ?',
    'details':'a;ofawfawf akwfnak.faw.fnawfln. a;lwfa.naw;falwf.awf aw;foawfla;wlfaw;mf a;owfawf;anwfkawf;n ;aowjflawf'
  },
];


List<List<Color>>  gradients = [
  const [
    Color(0xFF2980b9),
    Color(0xFF6DD5FA),
  ],
  const [
    Color(0xFFee9ca7),
    Color(0xFFffdde1),
  ],
  const [
    Color(0xFF7F00FF),
    Color(0xFFE100FF),
  ],
  const [
    Color(0xFFCAC531),
    Color(0xFFF3F9A7),
  ],
  const [
    Color(0xFF0cebeb),
    Color(0xFF20e3b2),
    Color(0xFF29ffc6),
  ],

];

List<Map<String,dynamic>> vouchersDetails = [
  {
    'percent':30,
    'code':'25e99977f4g',
    'details':'You can use it for first order of food in any restaurant',
    'expired_at':'25/12/2023',
    'type':0
  },
  {
    'percent':10,
    'code':'14f935a77f4g',
    'details':'You can use it for first order of clothes in any restaurant',
    'expired_at':'01/10/2023',
    'type':0
  },
  {
    'percent':20,
    'code':'25e99977f4g',
    'details':'You can use it for first order of food in any restaurant',
    'expired_at':'25/12/2023',
    'type':1
  },
  {
    'percent':15,
    'code':'25e99977f4g',
    'details':'You can use it for first order of food in any restaurant',
    'expired_at':'25/12/2023',
    'type':2
  },
  {
    'percent':30,
    'code':'25e99977f4g',
    'details':'You can use it for first order of food in any restaurant',
    'expired_at':'25/12/2023',
    'type':2
  },
  {
    'percent':50,
    'code':'25e99977f4g',
    'details':'You can use it for first order of food in any restaurant',
    'expired_at':'25/12/2023',
    'type':1
  },
  {
    'percent':2,
    'code':'25e99977f4g',
    'details':'You can use it for first order of food in any restaurant',
    'expired_at':'25/12/2023',
    'type':0
  },
  {
    'percent':10,
    'code':'25e99977f4g',
    'details':'You can use it for first order of food in any restaurant',
    'expired_at':'25/12/2023',
    'type':1
  },
];


List<Map<String,dynamic>> addresses = [
  {
    'latLng': const LatLng(30.0444,31.2357),
    'city':'Cairo',
    'area':'Badr city',
    'detailed':'377 c, ebni baitak, Badr city, Cairo',
    'mobile':'01019334494',
  },
  {
    'latLng': const LatLng(30.0444,31.2357),
    'city':'Cairo',
    'area':'Badr city',
    'detailed':'377 c, ebni baitak, Badr city, Cairo',
    'mobile':'01019334494',
  },
  {
    'latLng': const LatLng(30.0444,31.2357),
    'city':'Cairo',
    'area':'Badr city',
    'detailed':'377 c, ebni baitak, Badr city, Cairo',
    'mobile':'01019334494',
  },
  {
    'latLng': const LatLng(30.0444,31.2357),
    'city':'Cairo',
    'area':'Badr city',
    'detailed':'377 c, ebni baitak, Badr city, Cairo',
    'mobile':'01019334494',
  },
  {
    'latLng': const LatLng(30.0444,31.2357),
    'city':'Cairo',
    'area':'Badr city',
    'detailed':'377 c, ebni baitak, Badr city, Cairo',
    'mobile':'01019334494',
  },
  {
    'latLng': const LatLng(30.0444,31.2357),
    'city':'Cairo',
    'area':'Badr city',
    'detailed':'377 c, ebni baitak, Badr city, Cairo',
    'mobile':'01019334494',
  },
];

Future<String> getWithoutParams({required String suffix}) async{
  http.Response response = await http.get(
    Uri.parse('$zoneApi/$suffix'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $savedToken',
    },
  );
  if(response.statusCode == 200){
    print(response.body);
    return response.body;
  }
  return jsonEncode({});
}

Future<String> postWithParams({required String suffix,required Map<String,dynamic> body}) async{
  http.Response response = await http.post(
    Uri.parse('$zoneApi/$suffix'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $savedToken',
    },
    body: jsonEncode(body)
  );
  if(response.statusCode == 200){
    print(response.body);
    return jsonEncode(response.body);
  }
  return jsonEncode('');
}

Future uploadImage({required String filePath,required String apiCompletion}) async {
  var postUri = Uri.parse('$zoneApi$apiCompletion');
  Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Bearer $savedToken"
  };
  http.MultipartRequest request = http.MultipartRequest("POST", postUri);
  http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'profile', filePath);
  request.files.add(multipartFile);
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  http.Response response1 = await http.Response.fromStream(response);
  print("Result: ${response1.body}");
  // print(response.statusCode);
  // print(response.request);
  // print(response.stream);
  // print(response.reasonPhrase);
}











