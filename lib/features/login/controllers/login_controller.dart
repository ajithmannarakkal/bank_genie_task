import 'package:bank_genie_task/features/product/views/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';


import '../services/login_service.dart';

class LoginController extends GetxController {
  final storage = FlutterSecureStorage();
  LoginService loginService = LoginService();
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(
    BuildContext context,
    String username,
    String password,
  ) async {
    final response = await loginService.login(username, password);

    if (response.accessToken != null) {
      await storage.write(key: 'token', value: response.accessToken);
      Get.to(() => ProductListScreen());
    }
  }
}
