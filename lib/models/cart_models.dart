class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  bool? isExists;
  int? quantity;
  String? time;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExists,
      this.quantity,
      this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    isExists = json['isExists'];
    quantity = json['quantity'];
    time = json['time'];
  }
}
