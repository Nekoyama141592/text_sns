import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/view/common/basic_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const path = "/account";
  @override
  Widget build(BuildContext context) {
    final controller = AuthController.to;
    return BasicPage(
        appBarTitle: "アカウントページ",
        child: ListView(
          children: [
            Obx(() {
              final authUser = controller.rxAuthUser.value;
              final data = authUser == null ? "Nullです" : authUser.email!;
              return ListTile(
                title: Text(data),
                trailing: InkWell(
                  onTap: controller.onEditEmailButtonPressed,
                  child: const Icon(Icons.edit),
                ),
              );
            }),
            ListTile(
              title: const Text("パスワードを更新する"),
              onTap: controller.onUpdatePasswordTileTapped,
            ),
            ListTile(
              title: const Text("ログアウトを行う"),
              onTap: controller.onSignOutButtonPressed,
            ),
            ListTile(
              title: const Text(
                "ユーザーを削除する",
                style: TextStyle(color: Colors.red),
              ),
              onTap: controller.onDeleteUserTileTapped,
            )
          ],
        ));
  }
}
