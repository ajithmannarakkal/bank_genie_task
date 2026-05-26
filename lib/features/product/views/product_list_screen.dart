import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../login/views/login_screen.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(
            onPressed: () async {
              final storage = FlutterSecureStorage();

              await storage.deleteAll();
              Get.offAll(() => LoginScreen());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = controller.productList[index];
                  return ProductItem(product: product);
                },
              ),
      ),
    );
  }
}
