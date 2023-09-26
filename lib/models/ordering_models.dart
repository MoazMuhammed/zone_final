class Order {
  int? id;
  int? clientId;
  int? deliveryId;
  int? addressId;
  int? shopId;
  int? vendorId;
  int? isPaid;
  double? subTotal;
  double? total;
  double? shippingPrices;
  double? discount;
  double? tax;
  String? name;
  String? status;
  String? promoCode;
  String? estimatedTime;
  String? notes;

  Order(
      {required this.id,
      required this.clientId,
      required this.deliveryId,
      required this.addressId,
      required this.shopId,
      required this.vendorId,
      required this.isPaid,
      required this.subTotal,
      required this.total,
      required this.shippingPrices,
      required this.discount,
      required this.tax,
      required this.name,
      required this.status,
      required this.promoCode,
      required this.estimatedTime,
      required this.notes});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    deliveryId = json['delivery_id'];
    addressId = json['address_id'];
    shopId = json['shop_id'];
    vendorId = json['vendor_id'];
    isPaid = json['is_paid'];
    subTotal = json['sub_total'];
    total = json['total'];
    shippingPrices = json['shipping_price'];
    discount = json['discount'];
    tax = json['tax'];
    name = json['order_name'];
    status = json['status'];
    promoCode = json['promo_code'];
    estimatedTime = json['delivery_time'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'client_id': clientId,
        'delivery_id': deliveryId,
        'address_id': addressId,
        'shop_id': shopId,
        'vendor_id': vendorId,
        'is_paid': isPaid,
        'sub_total': subTotal,
        'total': total,
        'shipping_price': shippingPrices,
        'discount': discount,
        'tax': tax,
        'order_name': name,
        'status': status,
        'promo_code': promoCode,
        'delivery_time': estimatedTime,
        'notes': notes,
      };
}

class Cart {
  int? id;
  int? clientId;
  int? count;

  Cart({required this.id, required this.clientId, required this.count});

  Cart.fromJson(Map<String,dynamic> json){
    id = json['id'];
    clientId = json['client_id'];
    count = json['count'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'client_id':clientId,
    'count':count,
  };
}

class OrderItem {
  int? id;
  int? orderId;
  int? shopId;
  int? productId;
  int? variantId;
  int? count;
  double? price;
  String? image;

  OrderItem(
      {
        required this.id,
        required this.orderId,
        required this.count,
        required this.shopId,
        required this.productId,
        required this.variantId,
        required this.price,
        required this.image
      });

  OrderItem.fromJson(Map<String,dynamic> json){
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    variantId = json['variant_id'];
    shopId = json['shop_id'];
    count = json['count'];
    price = json['price'];
    image = json['image'];
  }

  Map<String,dynamic> toJson() => {
    'id':id ,
    'order_id':orderId,
    'product_id':productId ,
    'variant_id':variantId ,
    'shop_id':shopId ,
    'count':count,
    'price':price ,
    'image':image ,
  };
}

class CartItem {
  int? id;
  int? cartId;
  int? shopId;
  int? productId;
  int? variantId;
  int? count;
  double? price;
  String? image;

  CartItem(
      {
        required this.id,
        required this.cartId,
        required this.count,
        required this.shopId,
        required this.productId,
        required this.variantId,
        required this.price,
        required this.image
      });

  CartItem.fromJson(Map<String,dynamic> json){
    id = json['id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    variantId = json['variant_id'];
    shopId = json['shop_id'];
    count = json['count'];
    price = json['price'];
    image = json['image'];
  }

  Map<String,dynamic> toJson() => {
    'id':id ,
    'cart_id':cartId,
    'product_id':productId ,
    'variant_id':variantId ,
    'shop_id':shopId ,
    'count':count,
    'price':price ,
    'image':image ,
  };
}

