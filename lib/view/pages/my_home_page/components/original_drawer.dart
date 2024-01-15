import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/theme_controller.dart';
import 'package:text_sns/view/pages/account_page.dart';
import 'package:text_sns/view/pages/profile_page.dart';

class OriginalDrawer extends StatelessWidget {
  const OriginalDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = ThemeController.to;
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("アカウントページへ"),
            onTap: () {
              Get.toNamed(AccountPage.path);
            },
          ),
          ListTile(
            title: const Text("自分のプロフィールへ"),
            onTap: () {
              final user = AuthController.to.rxAuthUser.value;
              if (user == null) return;
              final uid = user.uid;
              final path = ProfilePage.generatePath(uid);
              Get.toNamed(path);
            },
          ),
          Obx(() => ListTile(
                title: const Text("テーマ切り替え"),
                trailing: CupertinoSwitch(
                  value: controller.rxIsDarkTheme.value,
                  onChanged: controller.onSwitchChanged,
                ),
              ))
        ],
      ),
    );
  }
}
