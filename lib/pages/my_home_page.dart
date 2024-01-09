import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/my_home_page_controller.dart';

import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyHomePageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: controller.onFloatingActionButtonPressed),
      body: Center(child: Obx(() {
        return Text(
          'ユーザーのID ${controller.rxDoc.value?.id ?? "定められていません"}',
          style: const TextStyle(fontSize: 40.0),
        );
      })),
    );
  }
}
