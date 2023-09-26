class VariationValue {
  int? id;
  int? variationId;
  int? valueId;

  VariationValue({required this.id,required this.variationId,required this.valueId});

  VariationValue.fromJson(Map<String,dynamic> json){
    id = json['id'];
    variationId = json['variation_id'];
    valueId = json['value_id'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'variation_id':variationId,
    'value_id':valueId,
  };

}

class Variation {
  int? id;
  int? productId;
  int? stock;
  bool? active;
  double? price;

  Variation({required this.id, required this.productId, required this.stock, required this.active, required this.price});

  Variation.fromJson(Map<String,dynamic> json){
    id = json['id'];
    productId = json['product_id'];
    stock = json['stock'];
    active = json['active'];
    price = json['price'];
  }

  Map<String,dynamic> toJson() =>
      {
        'id': id,
        'product_id': productId,
        'stock': stock,
        'active': active,
        'price': price
      };
}

class Value {
  int? id;
  int? attributeId;
  String? name;
  String? type;

  Value({required this.id,required this.attributeId,required this.name,required this.type});

  Value.fromJson(Map<String,dynamic> json){
    id = json['id'];
    attributeId = json['attribute_id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'attribute_id':attributeId,
    'name':name,
    'type':type,
  };

}

class Attribute {
  int? id;
  int? vendorId;
  int? shopId;
  String? name;
  String? type;

  Attribute({required this.id,required this.vendorId,required this.shopId,required this.name,required this.type});

  Attribute.fromJson(Map<String,dynamic> json){
    id = json['id'];
    vendorId = json['vendor_id'];
    shopId = json['shop_id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'vendor_id':vendorId,
    'shop_id':shopId,
    'name':name,
    'type':type,
  };

}

