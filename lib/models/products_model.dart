class Product {
  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;

  /// getter
  List<ProductModel> get products => _products;

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((e) {
        _products.add(ProductModel.fromJson(e));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['total_size'] = totalSize;
  //   data['type_id'] = typeId;
  //   data['offset'] = offset;
  //   if (products != null) {
  //     data['products'] = products!.map((e) => e.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['description'] = description;
  //   data['price'] = price;
  //   data['stars'] = stars;
  //   data['img'] = img;
  //   data['location'] = location;
  //   data['created_at'] = createdAt;
  //   data['updated_at'] = updatedAt;
  //   data['type_id'] = typeId;
  //   return data;
  // }
}
