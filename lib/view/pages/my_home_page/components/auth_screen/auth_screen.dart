import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 60.0, color: Colors.purple);
    final controller = Get.find<AuthController>();
    return Obx(() {
      if (controller.rxIsLoginMode.value) {
        return InkWell(
            onTap: controller.onToggleLoginModeButtonPressed,
            child: const Text(
              "LoginScreen",
              style: style,
            ));
      } else {
        return InkWell(
            onTap: controller.onToggleLoginModeButtonPressed,
            child: const Text(
              "SignupScreen",
              style: style,
            ));
      }
    });
  }
}
