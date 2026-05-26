import 'package:bank_genie_task/core/services/api_service.dart';

import '../../../core/constants/api_constants.dart';

class ProductService {
ApiService apiService = ApiService();

Future<dynamic> getProductList() async {
  final response = await apiService.getRequest("${ApiConstants.baseUrl}/products");
  return response;

}


}