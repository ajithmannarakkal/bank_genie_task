import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../login/views/login_screen.dart';
import '../../product/views/product_list_screen.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    final storage = FlutterSecureStorage();

    String? token = await storage.read(key: 'token');
    if (token != null) {
      Get.offAll(() => ProductListScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }
}
