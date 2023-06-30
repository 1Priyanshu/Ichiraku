import 'package:ichiraku/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  bool? isExists;
  int? quantity;
  String? time;
  ProductModel? product;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExists,
      this.quantity,
      this.time,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    isExists = json['isExists'];
    quantity = json['quantity'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "isExists": this.isExists,
      "quantity": this.quantity,
      "time": this.time,
      "product": this.product!.toJson(),
    };
  }
}
