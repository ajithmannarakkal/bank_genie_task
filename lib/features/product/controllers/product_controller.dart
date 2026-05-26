import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  final productService = ProductService();
  RxList<Product> productList = <Product>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductList();
  }

  Future<void> getProductList() async {
    try {
      isLoading.value = true;
      final response = await productService.getProductList();
      if (response.products?.isNotEmpty ?? false) {
        productList.value = response.products!;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
