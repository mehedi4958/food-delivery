class CartModel {
  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });

  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
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
