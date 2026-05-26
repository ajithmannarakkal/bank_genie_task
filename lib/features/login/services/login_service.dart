import 'package:bank_genie_task/core/services/api_service.dart';

import '../../../core/constants/api_constants.dart';

class LoginService {
  ApiService apiService = ApiService();
  Future<dynamic> login(String username, String password) async {
    final response = await apiService.postRequest("${ApiConstants.baseUrl}/auth/login", {
      "username": username,
      "password": password,
    });
    return response;
  }
}
