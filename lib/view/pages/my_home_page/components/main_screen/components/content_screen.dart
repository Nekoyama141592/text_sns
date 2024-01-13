import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/view/common/byte_image.dart';

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
            MainController.to.rxPublicUser.value?.name ?? "Nullです",
            style: style,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Obx(
          () => ByteImage(bytes: MainController.to.rxUint8list.value),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Obx(() {
          final publicUser = MainController.to.rxPublicUser.value;
          if (publicUser == null) {
            return const SizedBox.shrink();
          } else {
            final data = publicUser.isAppropriate ? "適切な画像です" : "適切な画像ではありません";
            return Text(data);
          }
        }),
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
