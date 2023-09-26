class ProductCategory {
  int? id;
  String? name;
  String? slug;

  ProductCategory({required this.id,required this.name,required this.slug});

  ProductCategory.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'name':name,
    'slug':slug
  };

}

class ProductSection {
  int? id;
  int? shopId;
  String? name;
  String? slug;

  ProductSection({required this.id,required this.shopId,required this.name,required this.slug});

  ProductSection.fromJson(Map<String,dynamic> json){
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'shop_id':shopId,
    'name':name,
    'slug':slug
  };

}

class SubCategory{
  int? id;
  int? categoryId;
  String? name;
  String? slug;

  SubCategory({required this.id,required this.categoryId,required this.name,required this.slug});

  SubCategory.fromJson(Map<String,dynamic> json){
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'category_id':categoryId,
    'name':name,
    'slug':slug
  };

}

class ShopCategory{
  int? id;
  String? image;
  String? name;
  String? slug;

  ShopCategory({required this.id,required this.image,required this.name,required this.slug});

  ShopCategory.fromJson(Map<String,dynamic> json){
    id = json['id'];
    image = json['image'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'image':image,
    'name':name,
    'slug':slug
  };

}