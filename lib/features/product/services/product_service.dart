import 'package:bank_genie_task/core/services/api_service.dart';

import '../../../core/constants/api_constants.dart';
import '../models/product_model.dart';

class ProductService {
  ApiService apiService = ApiService();

  Future<ProductModel> getProductList() async {
    final response = await apiService.getRequest(
      "${ApiConstants.baseUrl}/products",
    );
    return ProductModel.fromJson(response);
  }
}
