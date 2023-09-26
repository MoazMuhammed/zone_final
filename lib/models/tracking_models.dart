class Address {
  int? id;
  int? clientId;
  int? building;
  int? floor;
  String? type;
  String? apartment;
  String? street;
  String? subStreet;
  String? landmark;
  String? area;
  String? city;
  String? address;

  Address(
      {
        required this.id,
      required this.clientId,
      required this.building,
      required this.floor,
      required this.type,
      required this.apartment,
      required this.street,
      required this.subStreet,
      required this.landmark,
      required this.area,
      required this.city,
      required this.address
      });

  Address.fromJson(Map<String,dynamic> json){
    id =json['id'];
    clientId =json['client_id'];
    building =json['building'];
    floor =json['floor'];
    type =json['type'];
    apartment =json['apartment'];
    street =json['street'];
    subStreet =json['sub_street'];
    landmark =json['landmark'];
    area =json['area'];
    city =json['city'];
    address =json['address'];
  }

  Map<String,dynamic> toJson() => {
  'id':id,
  'client_id':clientId,
  'building':building,
  'floor':floor,
  'type':type,
  'apartment':apartment,
  'street':street,
  'sub_street':subStreet,
  'landmark':landmark,
  'area':area,
  'city':city,
  'address':address,
  };
}

class DeliveryRequest {
  int? id;
  int? orderId;
  int? addressId;
  int? areaId;
  String? state;
  String? location;

  DeliveryRequest(
      {required this.id,
      required this.orderId,
      required this.addressId,
      required this.areaId,
      required this.state,
      required this.location});

  DeliveryRequest.fromJson(Map<String,dynamic> json){
    id = json['id'];
    orderId = json['order_id'];
    addressId = json['address_id'];
    areaId = json['area_id'];
    state = json['state'];
    location = json['location'];
  }

  Map<String,dynamic> toJson()=> {
  'id':id,
  'order_id':orderId,
  'address_id':addressId,
  'area_id':areaId,
  'state':state,
  'location':location,
  };
}

class DeliveryOrder {
  int? id;
  int? orderId;
  int? deliveryId;
  int? addressId;
  String? state;

  DeliveryOrder({required this.id,required this.orderId,required this.deliveryId,required this.addressId,required this.state});

  DeliveryOrder.fromJson(Map<String,dynamic> json){
    id = json['id'];
    orderId = json['order_id'];
    deliveryId = json['delivery_id'];
    addressId = json['address_id'];
    state = json['state'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'order_id':orderId,
    'delivery_id':deliveryId,
    'address_id':addressId,
    'state':state
  };

}

class RejectedOrder {
  int? id;
  int? orderId;
  int? deliveryId;
  int? clientId;
  String? reason;

  RejectedOrder({required this.id,required this.orderId,required this.deliveryId,required this.clientId,required this.reason});

  RejectedOrder.fromJson(Map<String,dynamic> json){
    id = json['id'];
    orderId = json['order_id'];
    deliveryId = json['delivery_id'];
    clientId = json['client_id'];
    reason = json['reason'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'order_id':orderId,
    'delivery_id':deliveryId,
    'client_id':clientId,
    'reason':reason
  };

}