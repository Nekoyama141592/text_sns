import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/posts_controller.dart';
import 'package:text_sns/models/q_doc_info/q_doc_info.dart';
import 'package:text_sns/view/common/post_card/post_card.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostsController());
    return Obx(() {
      final List<QDocInfo> qDocInfos = controller.qDocInfos;
      return ListView.builder(
          itemCount: qDocInfos.length,
          itemBuilder: (context, index) {
            final qDocInfo = qDocInfos[index];
            return PostCard(qDocInfo: qDocInfo);
          });
    });
  }
}
