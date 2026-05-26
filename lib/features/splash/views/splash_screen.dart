import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
