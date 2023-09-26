class Product {
  int? id;
  int? shopId;
  int? categoryId;
  int? sectionId;
  int? subCategoryId;
  double? price;
  int? isFeatured;
  int? active;
  String? image;
  String? name;
  String? description;
  String? slug;
  String? type;
  String? unit;
  String? tags;

  Product(
      {
        required this.id,
      required this.shopId,
      required this.categoryId,
      required this.sectionId,
      required this.subCategoryId,
      required this.price,
      required this.active,
      required this.image,
      required this.name,
      required this.description,
      required this.slug,
      required this.type,
      required this.unit,
      required this.tags,
        required this.isFeatured
      });

  Product.fromJson(Map<String,dynamic> json){
    id = json['id'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    sectionId = json['section_id'];
    subCategoryId = json['subcategory_id'];
    price = json['price'];
    active = json['active'];
    image = json['image'];
    name = json['name'];
    description = json['details'];
    slug = json['slug'];
    type = json['type'];
    unit = json['unit'];
    tags  = json['tags'];
    isFeatured = json['is_featured'];
  }

  Map<String,dynamic> toJson() => {
  'id': id,
  'shop_id' :shopId,
  'category_id' : categoryId,
  'section_id': sectionId,
  'subcategory_id' : subCategoryId,
  'price': price,
  'active' :active,
  'image': image,
  'name': name,
  'details': description,
  'slug': slug,
  'type': type,
  'unit': unit,
    'tags' : tags,
    'is_featured':isFeatured,
  };

}

class Shop {
  int? id;
  int? areaId;
  int? categoryId;
  int? subCategoryId;
  int? isAd;
  double? deliveryFees;
  String? name;
  String? shopDescription;
  String? logo;
  String? coverPhoto;
  String? ownerName;
  String? ownerPhone;
  String? address;
  String? from;
  String? to;
  String? deliveryTime;
  String? location;

  Shop(
      {
        required this.id,
      required this.areaId,
      required this.categoryId,
      required this.subCategoryId,
      required this.isAd,
      required this.deliveryFees,
      required this.name,
      required this.shopDescription,
      required this.logo,
      required this.coverPhoto,
      required this.ownerName,
      required this.ownerPhone,
      required this.address,
      required this.from,
      required this.to,
      required this.deliveryTime,
      required this.location
      });

  Shop.fromJson(Map<String,dynamic> json){
    id = json['id'];
    areaId = json['area_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    isAd = json['is_ad'];
    deliveryFees = json['delivery_fees'];
    name = json['name'];
    shopDescription = json['shop_description'];
    logo = json['logo'];
    coverPhoto = json['cover_photo'];
    ownerName = json['owner_name'];
    ownerPhone = json['owner_phone'];
    address = json['address'];
    from = json['from'];
    to = json['to'];
    deliveryTime = json['delivery_time'];
    location = json['location'];
  }

  Map<String,dynamic> toJson() => {
   'id':id,
  'area_id':areaId ,
  'category_id':categoryId ,
  'sub_category_id':subCategoryId ,
  'is_ad':isAd ,
   'delivery_fees':deliveryFees,
  'name':name ,
   'shop_description':shopDescription,
  'logo':logo ,
  'cover_photo':coverPhoto ,
   'owner_name':ownerName,
  'owner_phone':ownerPhone ,
  'address':address ,
 'from': from ,
   'to':to,
   'delivery_time':deliveryTime,
   'location':location,
  };
}

class Favourite {
  int? id;
  int? clientId;
  int? shopId;
  int? productId;
  int? variantId;
  double? price;
  String? image;

  Favourite(
      {
        required this.id,
        required this.clientId,
        required this.shopId,
        required this.productId,
        required this.variantId,
        required this.price,
        required this.image
      });

  Favourite.fromJson(Map<String,dynamic> json){
    id = json['id'];
    clientId = json['client_id'];
    productId = json['product_id'];
    variantId = json['variant_id'];
    shopId = json['shop_id'];
    price = json['price'];
    image = json['image'];
  }

  Map<String,dynamic> toJson() => {
    'id':id ,
    'client_id':clientId,
    'product_id':productId ,
    'variant_id':variantId ,
    'shop_id':shopId ,
    'price':price ,
    'image':image ,
  };
}

class Offer {
  int? id;
  int? shopId;
  int? vendorId;
  String? name;
  String? image;
  int? active;
  String? type;

  Offer({required this.id, required this.shopId, required this.type,required this.vendorId,required this.name,required this.active,required this.image});

  Offer.fromJson(Map<String,dynamic> json){
    id = json['id'];
    shopId = json['shop_id'];
    vendorId = json['vendor_id'];
    name = json['name'];
    image = json['image'];
    active = json['active'];
    type = json['type'];
  }

  Map<String,dynamic> toJson() => {
  'id': id ,
  'shop_id': shopId ,
  'vendor_id':vendorId,
  'type':type ,
  'image':image,
  'name':name,
  'active':active
  };

}

class Voucher {
  int? id;
  int? shopId;
  int? vendorId;
  double? amount;
  String? code;
  String? type;
  String? expire;
  int? active;

  Voucher({required this.id,
    required this.shopId,
    required this.vendorId,
    required this.amount,
    required this.code,
    required this.type,
    required this.expire,
    required this.active
  });

  Voucher.fromJson(Map<String,dynamic> json){
    id = json['id'];
    shopId = json['shop_id'];
    vendorId = json['vendor_id'];
    amount = (json['amount'] is double)?json['amount']:json['amount'].toDouble();
    code = json['code'];
    type = json['type'];
    expire = json['expire'];
    active = json['active'];
  }

  Map<String,dynamic> toJson() => {
    'id': id ,
    'shop_id': shopId ,
    'vendor_id': vendorId ,
    'amount': amount ,
    'code': code ,
    'type':type ,
    'expire':expire ,
    'active':active
  };
}