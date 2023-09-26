class Client {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? birthday;
  String? gender;
  String? image;
  String? deviceToken;
  int? activeAddressId;

  Client(
      {
        this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
        this.birthday,
        this.gender,
        this.image,
        this.deviceToken,
        this.activeAddressId
      });

  Client.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'] ;
    phone = json['phone'] ;
    password = json['password'] ;
    birthday = json['birthday'] ;
    gender = json['gender'] ;
    image = json['image'] ;
    deviceToken = json['device_token'] ;
    activeAddressId = json['ActiveAddress_id'] ;
  }

  Map<String,dynamic> toJson()=>{
  'id':id,
  'name':name,
  'email':email,
  'phone':phone,
  'password':password,
  'birthday':birthday,
  'gender':gender,
  'image':image,
  'device_token':deviceToken,
  'ActiveAddress_id':activeAddressId,
  };

}

class Delivery {
  int? id;
  String? scooter;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? image;
  List<int>? successOrders;
  List<int>? canceledOrders;
  int? areaId;

  Delivery(
      {
        required this.id,
      required this.scooter,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.image,
      required this.successOrders,
      required this.canceledOrders,
      required this.areaId
      });

  Delivery.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'] ;
    phone = json['phone'] ;
    password = json['password'] ;
    image = json['image'] ;
    scooter = json['scooter'] ;
    successOrders = json['success_orders'] ;
    canceledOrders = json['canceled'] ;
    areaId = json['area_id'] ;
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'email':email,
    'phone':phone,
    'password':password,
    'image':image,
    'scooter':scooter ,
    'success_orders':successOrders,
    'canceled':canceledOrders,
    'area_id':areaId ,
  } ;

}

class Vendor{

  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? officeName;
  int? numberOfShops;

  Vendor(
      {
        required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.officeName,
      required this.numberOfShops
      });

  Vendor.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'] ;
    phone = json['phone'] ;
    password = json['password'] ;
    officeName = json['office_name'];
    numberOfShops = json['no_of_shops'];
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'email':email,
    'phone':phone,
    'password':password,
    'office_name':officeName,
    'no_of_shops':numberOfShops,
  } ;

}