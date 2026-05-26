import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = controller.productList[index];
                  return Container(
                    child: Column(
                      children: [
                        Text(product.title!),
                        Image.network(product.thumbnail!),
                        Text(product.price.toString()),
                        Text(product.description!),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
