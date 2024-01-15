import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:text_sns/controllers/profile_controller.dart';
import 'package:text_sns/view/common/basic_page.dart';
import 'package:get/get.dart';
import 'package:text_sns/view/common/byte_image.dart';
import 'package:text_sns/view/common/posts_screen/posts_screen.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const uidKey = "uid";
  static const path = "/profile/:$uidKey";
  static String generatePath(String uid) => "/profile/$uid";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    useEffect(() {
      controller.init();
      return;
    }, []);
    const style = TextStyle(fontSize: 30.0);
    return BasicPage(
        appBarTitle: "自分のプロフィール",
        child: Center(
          child: Column(
            children: [
              Obx(
                () => Text(
                  controller.rxPublicUser.value?.name ?? "",
                  style: style,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(
                () => ByteImage(
                  bytes: controller.rxUint8list.value,
                  length: 120,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(() {
                final publicUser = controller.rxPublicUser.value;
                if (publicUser == null) {
                  return const SizedBox.shrink();
                } else {
                  final data =
                      publicUser.isAppropriate ? "適切な画像です" : "適切な画像ではありません";
                  return Text(
                    data,
                    style: style,
                  );
                }
              }),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(child: PostsScreen(controller: controller)),
            ],
          ),
        ));
  }
}
