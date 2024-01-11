import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/main_controller.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return Column(
      children: [
        Obx(
          () => Text(
            MainController.to.rxPublicUser.value?.uid ?? "Nullです",
            style: style,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: authController.onSignOutButtonPressed,
            child: const Text(
              "ログアウトする",
              style: style,
            )),
      ],
    );
  }
}
