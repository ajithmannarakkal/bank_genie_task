import 'package:bank_genie_task/features/product/views/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../services/login_service.dart';

class LoginController extends GetxController {
  final storage = FlutterSecureStorage();
  LoginService loginService = LoginService();
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<dynamic> login(
    BuildContext context,
    String username,
    String password,
  ) async {
    final response = await loginService.login(username, password);
    if (response.statusCode == 200) {
      await storage.write(key: 'token', value: response.body['token']);

      Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => ProductListScreen()),
      );
      print(response.body);
    }
    // return response;
  }
}
