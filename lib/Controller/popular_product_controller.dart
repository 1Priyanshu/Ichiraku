import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichiraku/models/cart_models.dart';
import 'package:ichiraku/models/products_model.dart';
import 'package:ichiraku/utils/colors.dart';

import '../data/repository/popular_product_repo.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductrepo;
  PopularProductController({required this.popularProductrepo});

  List<ProductModel> _popularProductList = []; // dart private variable
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false; // private variable for loading image
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity; // getter for private quantity
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductrepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    }

    return quantity;
  }

  //   if (quantity < 0) {
  //     return 0;
  //   }
  //   return quantity;
  // }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart
          .getQuantity(product); //if exist get from storage _inCartItems = x;
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
