import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/models/q_doc_info/q_doc_info.dart';
import 'package:text_sns/models/post/post.dart';
import 'package:text_sns/view/common/byte_image.dart';
import 'package:text_sns/view/common/post_card/components/delete_icon.dart';
import 'package:text_sns/view/pages/profile_page.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.qDocInfo}) : super(key: key);
  final QDocInfo qDocInfo;
  @override
  Widget build(BuildContext context) {
    final postDoc = qDocInfo.postDoc;
    final Post post = Post.fromJson(postDoc.data());
    final publicUser = qDocInfo.publicUser;
    final userImage = qDocInfo.userImage;
    return Obx(() {
      if (MainController.to.deletePostIds.contains(postDoc.id)) {
        return const SizedBox.shrink();
      } else {
        return Card(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          child: ListTile(
            leading: InkWell(
                onTap: () {
                  if (publicUser == null) return;
                  final uid = publicUser.uid;
                  final path = ProfilePage.generatePath(uid);
                  Get.toNamed(path);
                },
                child: ByteImage(bytes: userImage)),
            title: Text(
              publicUser?.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(post.content),
            trailing: DeleteIcon(
              postDoc: postDoc,
            ),
          ),
        );
      }
    });
  }
}
