import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductrepo;
  RecommendedProductController({required this.recommendedProductrepo});

  List<dynamic> _recommendedProductList = []; // dart private variable
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false; // private variable for loading image
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductrepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("Hi!, Priyanshu - from server(trending)");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
